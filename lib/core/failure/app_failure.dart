sealed class AppFailure {
  const AppFailure();

  /// Human-readable description of the failure, suitable for logging.
  String get message;
}

final class NetworkFailure extends AppFailure {
  const NetworkFailure({required this.message, this.statusCode});
  @override
  final String message;
  final int? statusCode;
}

final class AuthFailure extends AppFailure {
  const AuthFailure({required this.message});
  @override
  final String message;

  static const expired =
      AuthFailure(message: 'Session expired. Please sign in again.');
  static const unauthorized = AuthFailure(message: 'Unauthorized.');
}

final class ValidationFailure extends AppFailure {
  const ValidationFailure(
      {required this.message, this.fieldErrors = const {}});
  @override
  final String message;
  final Map<String, String> fieldErrors;
}

final class DbFailure extends AppFailure {
  const DbFailure({required this.message, this.cause});
  @override
  final String message;
  final Object? cause;
}

final class SyncFailure extends AppFailure {
  const SyncFailure({required this.message});
  @override
  final String message;
}

final class UnknownFailure extends AppFailure {
  const UnknownFailure({required this.message, this.cause});
  @override
  final String message;
  final Object? cause;
}
