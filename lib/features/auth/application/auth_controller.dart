import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/failure/app_failure.dart';
import '../../../core/result/result.dart';
import '../../../data/remote/auth_service.dart';
import '../../../data/remote/secure_storage_service.dart';

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
  /// Returns [Success] with the [Authenticated] state on success, or
  /// [Failure] with an [AppFailure] if the credentials are invalid.
  Future<Result<Authenticated, AppFailure>> login({
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

    await storage.saveSession(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
      userId: userId,
      email: email.trim().toLowerCase(),
    );
    final authState = Authenticated(userId: userId, email: email);
    state = AsyncData(authState);
    return Success<Authenticated, AppFailure>(authState);
  }

  // ── Register ───────────────────────────────────────────────────────────────

  /// Registers a new account, then immediately logs in to establish a session.
  Future<Result<Authenticated, AppFailure>> register({
    required String email,
    required String password,
  }) async {
    final authSvc = ref.read(authServiceProvider);
    final registerResult =
        await authSvc.register(email: email, password: password);

    if (registerResult.isFailure) {
      return Failure(registerResult.error);
    }

    // Registration succeeded; proceed to login.
    return login(email: email, password: password);
  }

  // ── Logout ─────────────────────────────────────────────────────────────────

  /// Clears local tokens and reverts to [Guest].
  ///
  /// [keepLocalData]: when `false`, the caller is expected to erase all rows
  /// owned by this user before calling logout (not implemented in Phase 5).
  Future<void> logout({bool keepLocalData = true}) async {
    await ref.read(secureStorageServiceProvider).clearSession();
    state = const AsyncData(Guest());
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
