import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../../core/failure/app_failure.dart';
import '../../core/logger/talker.dart';
import '../../core/network/dio_base_options.dart';
import '../../core/result/result.dart';
import 'dtos/auth_dtos.dart';
import 'secure_storage_service.dart';

part 'auth_service.g.dart';

// ── Provider ──────────────────────────────────────────────────────────────────

/// Raw Dio instance used **exclusively** for auth calls (no AuthInterceptor to
/// avoid circular dependency: AuthInterceptor → AuthService → Dio).
@Riverpod(keepAlive: true)
Dio _authDio(Ref ref) {
  final dio = Dio(createDioBaseOptions());
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: false,
        printResponseHeaders: false,
        printResponseData: false,
      ),
    ),
  );
  return dio;
}

@Riverpod(keepAlive: true)
AuthService authService(Ref ref) => AuthService(
  ref.watch(_authDioProvider),
  ref.watch(secureStorageServiceProvider),
);

// ── Service ───────────────────────────────────────────────────────────────────

/// Handles the three auth endpoints.
///
/// Returns `Result<T, AppFailure>` — never throws. Callers inspect the result
/// without needing try/catch.
final class AuthService {
  AuthService(this._dio, this._storage);

  final Dio _dio;
  final SecureStorageService _storage;

  // ── Login ──────────────────────────────────────────────────────────────────

  /// `POST /api/auth/login` → stores session and returns the user's ID + email.
  Future<Result<({String userId, String email}), AppFailure>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/auth/login',
        data: LoginRequestDto(email: email, password: password).toJson(),
      );

      final dto = LoginResponseDto.fromJson(response.data!);

      // On web the backend returns HttpOnly cookies; the JSON body carries
      // empty strings. Storing empty tokens in secure storage is pointless
      // and would break session hydration on mobile.
      if (!kIsWeb) {
        await _storage.saveTokens(
          accessToken: dto.accessToken,
          refreshToken: dto.refreshToken,
        );
      }

      return Success((userId: '', email: email));
    } on DioException catch (e) {
      return Failure(_mapDioError(e));
    } catch (e) {
      return Failure(UnknownFailure(message: e.toString(), cause: e));
    }
  }

  /// `POST /api/auth/login` → full session (stores tokens, returns session data).
  ///
  /// [userId] is obtained separately (e.g. from `/api/auth/me` or the JWT
  /// sub claim). This overload accepts it as a parameter so the caller
  /// (AuthController) can stamp it after decoding the token.
  Future<Result<LoginResponseDto, AppFailure>> loginRaw({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/auth/login',
        data: LoginRequestDto(email: email, password: password).toJson(),
      );
      return Success(LoginResponseDto.fromJson(response.data!));
    } on DioException catch (e) {
      return Failure(_mapDioError(e));
    } catch (e) {
      return Failure(UnknownFailure(message: e.toString(), cause: e));
    }
  }

  // ── Register ───────────────────────────────────────────────────────────────

  /// `POST /api/auth/register` → returns the new user's UUID.
  Future<Result<String, AppFailure>> register({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/auth/register',
        data: RegisterRequestDto(email: email, password: password).toJson(),
      );
      final dto = RegisterResponseDto.fromJson(response.data!);
      return Success(dto.userId);
    } on DioException catch (e) {
      return Failure(_mapDioError(e));
    } catch (e) {
      return Failure(UnknownFailure(message: e.toString(), cause: e));
    }
  }

  // ── Refresh ────────────────────────────────────────────────────────────────

  /// `POST /api/auth/refresh` — called by [AuthInterceptor] on 401.
  ///
  /// Returns the new token pair on success, `null` on failure.
  /// Does NOT persist the tokens — the interceptor handles persistence.
  Future<RefreshResponseDto?> refreshTokens(String refreshToken) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/auth/refresh',
        data: RefreshRequestDto(refreshToken: refreshToken).toJson(),
      );
      return RefreshResponseDto.fromJson(response.data!);
    } catch (_) {
      return null;
    }
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  AppFailure _mapDioError(DioException e) {
    final status = e.response?.statusCode;
    if (status == 400 || status == 409) {
      final detail = e.response?.data is Map
          ? (e.response!.data as Map)['title'] as String? ??
                e.message ??
                'Bad request'
          : e.message ?? 'Bad request';
      return ValidationFailure(message: detail);
    }
    if (status == 401) return AuthFailure.unauthorized;
    return NetworkFailure(
      message: e.message ?? 'Network error',
      statusCode: status,
    );
  }
}
