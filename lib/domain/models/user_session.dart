import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_session.freezed.dart';

/// Represents a successfully authenticated user session.
///
/// Hydrated from [flutter_secure_storage] on app start by [AuthController].
/// Tokens are opaque strings — never inspect their contents in the domain layer.
///
/// No [fromJson]/[toJson] — tokens are persisted via [SecureStorageFacade],
/// not serialized as a whole object.
@freezed
sealed class UserSession with _$UserSession {
  const factory UserSession({
    required String userId,
    required String email,
    required String accessToken,
    required String refreshToken,
  }) = _UserSession;
}
