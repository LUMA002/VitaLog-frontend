import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../models/user_session.dart';

/// Authentication contract used by [AuthController].
///
/// Stub — will be fully implemented in Phase 5 (Auth & Sync).
/// Mobile implementation: [ApiAuthRepository] (Dio + SecureStorage).
abstract interface class IAuthRepository {
  /// Registers a new account and returns an authenticated session.
  Future<Result<UserSession, AppFailure>> register({
    required String email,
    required String password,
  });

  /// Signs in with existing credentials and returns an authenticated session.
  Future<Result<UserSession, AppFailure>> login({
    required String email,
    required String password,
  });

  /// Attempts a silent token refresh. Returns the new session or an auth failure.
  Future<Result<UserSession, AppFailure>> refresh();

  /// Clears stored tokens. Always succeeds locally.
  Future<void> logout();
}
