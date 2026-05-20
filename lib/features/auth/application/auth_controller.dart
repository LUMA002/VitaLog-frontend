import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

// ── Auth State ───────────────────────────────────────────────────────────────

/// Sealed union of authentication states for the whole app.
///
/// The app always starts in [Guest] mode. Phase 5 will hydrate
/// [Authenticated] from flutter_secure_storage on startup.
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

// ── Controller ───────────────────────────────────────────────────────────────

/// Manages the global authentication session.
///
/// Kept alive for the lifetime of the app. Starts as [Guest] and can
/// transition to [Authenticated] after login (Phase 5).
///
/// Architectural contract:
/// - NEVER blocks navigation — Guest mode gives full access to local features.
/// - Protects only `/settings/sync` (requires [Authenticated]).
@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  Future<AuthState> build() async {
    // Phase 5: hydrate from flutter_secure_storage.
    // Attempt to read stored tokens; if valid → Authenticated, else Guest.
    return const Guest();
  }

  /// Clears local tokens and reverts to [Guest].
  ///
  /// [keepLocalData]: if false, Phase 5 will erase rows owned by this user.
  Future<void> logout({bool keepLocalData = true}) async {
    // Phase 5: clear tokens from flutter_secure_storage.
    state = const AsyncData(Guest());
  }

  // Phase 5: login({required String email, required String password})
  // Phase 5: register({required String email, required String password})
}
