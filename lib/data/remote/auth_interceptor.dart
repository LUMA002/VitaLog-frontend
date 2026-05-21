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
    required SecureStorageService storage,
    required AuthService authService,
    required void Function() onSessionExpired,
  })  : _storage = storage,
        _authService = authService,
        _onSessionExpired = onSessionExpired;

  final SecureStorageService _storage;
  final AuthService _authService;
  final void Function() _onSessionExpired;

  /// While non-null, a token refresh is in-flight. Concurrent 401 errors wait
  /// on this completer instead of issuing a duplicate refresh request.
  Completer<bool>? _refreshCompleter;

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

    // Avoid retrying an already-retried request or the refresh call itself.
    final options = err.requestOptions;
    if (options.extra['_retried'] == true) {
      return handler.next(err);
    }

    // ── Queuing mutex ──────────────────────────────────────────────────────

    if (_refreshCompleter != null) {
      // Another request is already refreshing — wait for the outcome.
      final refreshed = await _refreshCompleter!.future;
      if (refreshed) {
        return handler.resolve(await _retry(options, err.requestOptions.extra));
      } else {
        return handler.next(
          _authError('Session expired.', err.requestOptions),
        );
      }
    }

    _refreshCompleter = Completer<bool>();

    try {
      final refreshToken = await _storage.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        _refreshCompleter!.complete(false);
        _onSessionExpired();
        return handler.next(_authError('No refresh token.', options));
      }

      final newTokens = await _authService.refreshTokens(refreshToken);

      if (newTokens == null ||
          newTokens.accessToken.isEmpty ||
          newTokens.refreshToken.isEmpty) {
        _refreshCompleter!.complete(false);
        await _storage.clearSession();
        _onSessionExpired();
        return handler.next(_authError('Token refresh failed.', options));
      }

      await _storage.saveTokens(
        accessToken: newTokens.accessToken,
        refreshToken: newTokens.refreshToken,
      );
      _refreshCompleter!.complete(true);

      return handler.resolve(await _retry(options, {'_retried': true}));
    } catch (e) {
      _refreshCompleter?.complete(false);
      await _storage.clearSession();
      _onSessionExpired();
      return handler.next(_authError(e.toString(), options));
    } finally {
      _refreshCompleter = null;
    }
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  Future<Response<dynamic>> _retry(
    RequestOptions options,
    Map<String, dynamic> extraOverrides,
  ) async {
    final newToken = await _storage.getAccessToken();
    final dio = Dio();
    return dio.request<dynamic>(
      options.path,
      data: options.data,
      queryParameters: options.queryParameters,
      options: Options(
        method: options.method,
        headers: {
          ...options.headers,
          if (newToken != null) 'Authorization': 'Bearer $newToken',
        },
        extra: {...options.extra, ...extraOverrides},
        responseType: options.responseType,
        contentType: options.contentType,
        sendTimeout: options.sendTimeout,
        receiveTimeout: options.receiveTimeout,
      ),
    );
  }

  DioException _authError(String message, RequestOptions options) =>
      DioException(
        requestOptions: options,
        type: DioExceptionType.badResponse,
        error: AuthFailure(message: message),
      );
}
