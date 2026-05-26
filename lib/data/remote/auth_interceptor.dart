import 'dart:async';

import 'package:dio/dio.dart';

import '../../core/failure/app_failure.dart';
import 'auth_service.dart';
import 'secure_storage_service.dart';

/// Dio interceptor that:
///
/// 1. **onRequest** — injects `Authorization: Bearer <accessToken>` from
///    [SecureStorageService] if a token is stored.
///
/// 2. **onError (401)** — implements a Mutex-Queuing token refresh:
///    - The first 401 acquires a lock and calls `POST /api/auth/refresh`.
///    - Concurrent 401 responses wait for that single refresh to finish, then
///      either replay their original request (success) or reject (failure).
///    - If refresh fails, clears secure storage and calls [onSessionExpired]
///      so the caller (typically [AuthController]) can transition to Guest.
///
/// This interceptor does NOT depend on Riverpod — it receives its dependencies
/// via the constructor so it can be created before the provider graph is
/// fully wired.
final class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required Dio dio,
    required SecureStorageService storage,
    required AuthService authService,
    required void Function() onSessionExpired,
  })  : _dio = dio,
        _storage = storage,
        _authService = authService,
        _onSessionExpired = onSessionExpired;

  final Dio _dio;
  final SecureStorageService _storage;
  final AuthService _authService;
  final void Function() _onSessionExpired;

  /// While non-null, a token refresh is in-flight. Concurrent 401 errors wait
  /// on this completer instead of issuing a duplicate refresh request.
  Completer<bool>? _refreshCompleter;

  void _completeRefresh(bool success) {
    final completer = _refreshCompleter;
    if (completer != null && !completer.isCompleted) {
      completer.complete(success);
    }
  }

  // ── onRequest ─────────────────────────────────────────────────────────────

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  // ── onError ───────────────────────────────────────────────────────────────

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final options = err.requestOptions;
    if (options.extra['_retried'] == true) {
      return handler.next(err);
    }

    if (_refreshCompleter != null) {
      final refreshed = await _refreshCompleter!.future;
      if (refreshed) {
        try {
          return handler.resolve(await _retry(options));
        } on DioException catch (e) {
          return handler.next(e);
        } on Object catch (e) {
          return handler.next(_authError(e.toString(), options));
        }
      }
      return handler.next(_authError('Session expired.', options));
    }

    _refreshCompleter = Completer<bool>();

    try {
      final refreshToken = await _storage.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        _completeRefresh(false);
        _onSessionExpired();
        return handler.next(_authError('No refresh token.', options));
      }

      final newTokens = await _authService.refreshTokens(refreshToken);

      if (newTokens == null ||
          newTokens.accessToken.isEmpty ||
          newTokens.refreshToken.isEmpty) {
        _completeRefresh(false);
        await _storage.clearSession();
        _onSessionExpired();
        return handler.next(_authError('Token refresh failed.', options));
      }

      await _storage.saveTokens(
        accessToken: newTokens.accessToken,
        refreshToken: newTokens.refreshToken,
      );

      _completeRefresh(true);

      try {
        return handler.resolve(await _retry(options));
      } on DioException catch (e) {
        return handler.next(e);
      } on Object catch (e) {
        return handler.next(_authError(e.toString(), options));
      }
    } on Object catch (e) {
      _completeRefresh(false);
      await _storage.clearSession();
      _onSessionExpired();
      return handler.next(_authError(e.toString(), options));
    } finally {
      _refreshCompleter = null;
    }
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  Future<Response<dynamic>> _retry(RequestOptions options) async {
    final newToken = await _storage.getAccessToken();
    if (newToken != null && newToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $newToken';
    }
    options.extra['_retried'] = true;
    return _dio.fetch(options);
  }

  DioException _authError(String message, RequestOptions options) =>
      DioException(
        requestOptions: options,
        type: DioExceptionType.badResponse,
        error: AuthFailure(message: message),
      );
}
