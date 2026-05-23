import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../core/failure/app_failure.dart';
import '../../../core/result/result.dart';
import '../../../data/remote/auth_service.dart';
import '../../../data/remote/secure_storage_service.dart';
import '../../notifications/application/notification_service.dart';

part 'auth_controller.g.dart';

// ── Auth State ───────────────────────────────────────────────────────────────

/// Sealed union of authentication states for the whole app.
///
/// The app always starts in [Guest] mode (or hydrates [Authenticated] from
/// [SecureStorageService] on startup). Guest mode gives full access to all
/// local features; [Authenticated] is required only for cloud sync.
sealed class AuthState {
  const AuthState();
}

final class Guest extends AuthState {
  const Guest();
}

final class Authenticated extends AuthState {
  const Authenticated({required this.userId, required this.email});

  final String userId;
  final String email;
}

// ── Controller ────────────────────────────────────────────────────────────────

/// Manages the global authentication session.
///
/// Architectural contract:
/// - NEVER blocks navigation — Guest mode gives full access to local features.
/// - Protects only `/settings/sync` (requires [Authenticated]).
/// - [dioProvider] injects an [AuthInterceptor] that calls
///   `ref.invalidate(authControllerProvider)` on 401/expired, which causes
///   this notifier to rebuild and re-evaluate the stored session.
@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  Future<AuthState> build() async {
    final storage = ref.watch(secureStorageServiceProvider);
    final session = await storage.loadSession();
    if (session == null) return const Guest();

    // Trust the stored tokens; the AuthInterceptor will handle expiry lazily.
    // userId and email are persisted alongside the tokens so we don't need to
    // decode the JWT on every cold start.
    if (session.userId.isEmpty || session.email.isEmpty) {
      return const Guest();
    }
    return Authenticated(userId: session.userId, email: session.email);
  }

  // ── Login ──────────────────────────────────────────────────────────────────

  /// Authenticates the user and persists the session.
  ///
  /// Sets [state] to [AsyncLoading] while the request is in-flight, then to
  /// [AsyncData] on success or [AsyncError] with an [AppFailure] on failure.
  Future<Result<Authenticated, AppFailure>> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final result = await _loginCore(email: email, password: password);
    _applyAuthResult(result);
    return result;
  }

  // ── Register ───────────────────────────────────────────────────────────────

  /// Registers a new account, then immediately logs in to establish a session.
  Future<Result<Authenticated, AppFailure>> register({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final authSvc = ref.read(authServiceProvider);
    final registerResult =
        await authSvc.register(email: email, password: password);

    if (registerResult.isFailure) {
      _applyAuthResult(
        Failure<Authenticated, AppFailure>(registerResult.error),
      );
      return Failure(registerResult.error);
    }

    final loginResult = await _loginCore(email: email, password: password);
    _applyAuthResult(loginResult);
    return loginResult;
  }

  // ── Session persistence ────────────────────────────────────────────────────

  Future<Result<Authenticated, AppFailure>> _loginCore({
    required String email,
    required String password,
  }) async {
    final authSvc = ref.read(authServiceProvider);
    final storage = ref.read(secureStorageServiceProvider);

    final result = await authSvc.loginRaw(email: email, password: password);

    if (result.isFailure) {
      return Failure<Authenticated, AppFailure>(result.error);
    }

    final tokens = result.value;
    final userId = _extractSubFromJwt(tokens.accessToken) ?? '';
    if (userId.isEmpty) {
      return const Failure<Authenticated, AppFailure>(
        AuthFailure(message: 'Could not decode user ID from token.'),
      );
    }

    final normalizedEmail = email.trim().toLowerCase();
    await storage.saveSession(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
      userId: userId,
      email: normalizedEmail,
    );

    final claimFailure = await _claimGuestData(userId);
    if (claimFailure != null) {
      return Failure<Authenticated, AppFailure>(claimFailure);
    }

    // Rebuild notification schedule now that the user's courses are stamped.
    ref.read(notificationServiceProvider).scheduleNextIntakes();

    return Success<Authenticated, AppFailure>(
      Authenticated(userId: userId, email: normalizedEmail),
    );
  }

  void _applyAuthResult(Result<Authenticated, AppFailure> result) {
    if (result.isFailure) {
      state = AsyncError(result.error, StackTrace.current);
      return;
    }
    state = AsyncData(result.value);
  }

  // ── Logout ─────────────────────────────────────────────────────────────────

  /// Clears local tokens and reverts to [Guest].
  ///
  /// When [eraseData] is true, hard-deletes rows owned by the current user from
  /// the local Drift database before clearing the session.
  Future<void> logout({required bool eraseData}) async {
    if (eraseData) {
      final current = state.value;
      if (current is Authenticated) {
        await _eraseUserData(current.userId);
      }
      await ref.read(syncMetaDaoProvider).updateSyncMeta(
            lastSyncAt: null,
            lastSyncStatus: 'local_data_cleared',
          );
    }

    await ref.read(secureStorageServiceProvider).clearSession();
    state = const AsyncData(Guest());
    _invalidateDataProviders();
  }

  /// Hard-deletes all locally owned rows for the current session owner.
  ///
  /// Authenticated users lose synced personal data; guests lose offline drafts
  /// and schedules. Global catalog rows are preserved.
  Future<void> eraseLocalData() async {
    final current = state.value;
    final userId = current is Authenticated ? current.userId : null;
    await _eraseUserData(userId);
    await ref.read(syncMetaDaoProvider).updateSyncMeta(
          lastSyncAt: null,
          lastSyncStatus: 'local_data_cleared',
        );
    _invalidateDataProviders();
    ref.read(notificationServiceProvider).scheduleNextIntakes();
  }

  // ── Local data ownership ───────────────────────────────────────────────────

  Future<AppFailure?> _claimGuestData(String userId) async {
    try {
      final coursesDao = ref.read(coursesDaoProvider);
      final productsDao = ref.read(productsDaoProvider);

      await coursesDao.claimGuestCourses(userId);
      await coursesDao.claimGuestIntakeLogs(userId);
      await productsDao.claimGuestDraftProducts(userId);

      _invalidateDataProviders();
      return null;
    } catch (e) {
      return DbFailure(message: 'Failed to claim local data.', cause: e);
    }
  }

  Future<void> _eraseUserData(String? userId) async {
    final db = ref.read(appDatabaseProvider);
    final coursesDao = ref.read(coursesDaoProvider);
    final productsDao = ref.read(productsDaoProvider);
    final wellbeingDao = ref.read(wellbeingLogsDaoProvider);

    await db.transaction(() async {
      if (userId != null) {
        await coursesDao.deleteIntakeLogsForUser(userId);
      } else {
        await coursesDao.deleteGuestIntakeLogs();
      }

      // WellbeingLogs has no userId in V2 — erase all device-local journal rows.
      await wellbeingDao.deleteAll();

      if (userId != null) {
        await coursesDao.deleteCoursesForUser(userId);
        await productsDao.deleteLocalDraftsForUser(userId);
      } else {
        await coursesDao.deleteGuestCourses();
        await productsDao.deleteGuestDraftProducts();
      }
    });
  }

  void _invalidateDataProviders() {
    ref
      ..invalidate(activeCourseStreamProvider)
      ..invalidate(userIntakeLogStreamProvider)
      ..invalidate(intakeHistoryStreamProvider)
      ..invalidate(allProductStreamProvider)
      ..invalidate(allWellbeingLogStreamProvider);
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  /// Extracts the `sub` claim from a JWT without verifying the signature.
  ///
  /// Signature verification is the server's responsibility. We only need the
  /// user ID for local display and data claim purposes.
  static String? _extractSubFromJwt(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      // JWT uses Base64url (no padding) — normalise to standard Base64.
      var payload = parts[1];
      switch (payload.length % 4) {
        case 2:
          payload += '==';
        case 3:
          payload += '=';
      }
      payload = payload.replaceAll('-', '+').replaceAll('_', '/');

      final decoded = utf8.decode(base64.decode(payload));
      final claims = jsonDecode(decoded) as Map<String, dynamic>;
      return claims['sub'] as String?;
    } catch (_) {
      return null;
    }
  }
}
