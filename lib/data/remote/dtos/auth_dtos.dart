import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dtos.freezed.dart';
part 'auth_dtos.g.dart';

// ── Login ─────────────────────────────────────────────────────────────────────

/// `POST /api/auth/login` request body.
@freezed
sealed class LoginRequestDto with _$LoginRequestDto {
  const factory LoginRequestDto({
    required String email,
    required String password,
  }) = _LoginRequestDto;

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);
}

/// `POST /api/auth/login` response — `{ "accessToken": "...", "refreshToken": "..." }`.
@freezed
sealed class LoginResponseDto with _$LoginResponseDto {
  const factory LoginResponseDto({
    required String accessToken,
    required String refreshToken,
  }) = _LoginResponseDto;

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);
}

// ── Register ──────────────────────────────────────────────────────────────────

/// `POST /api/auth/register` request body.
@freezed
sealed class RegisterRequestDto with _$RegisterRequestDto {
  const factory RegisterRequestDto({
    required String email,
    required String password,
  }) = _RegisterRequestDto;

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDtoFromJson(json);
}

/// `POST /api/auth/register` response — `{ "userId": "uuid" }`.
@freezed
sealed class RegisterResponseDto with _$RegisterResponseDto {
  const factory RegisterResponseDto({
    required String userId,
  }) = _RegisterResponseDto;

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseDtoFromJson(json);
}

// ── Refresh ───────────────────────────────────────────────────────────────────

/// `POST /api/auth/refresh` request body.
@freezed
sealed class RefreshRequestDto with _$RefreshRequestDto {
  const factory RefreshRequestDto({
    required String refreshToken,
  }) = _RefreshRequestDto;

  factory RefreshRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshRequestDtoFromJson(json);
}

/// `POST /api/auth/refresh` response — `{ "accessToken": "...", "refreshToken": "..." }`.
@freezed
sealed class RefreshResponseDto with _$RefreshResponseDto {
  const factory RefreshResponseDto({
    required String accessToken,
    required String refreshToken,
  }) = _RefreshResponseDto;

  factory RefreshResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseDtoFromJson(json);
}
