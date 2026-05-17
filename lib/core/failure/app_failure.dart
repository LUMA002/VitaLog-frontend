sealed class AppFailure {
  const AppFailure();
}

final class NetworkFailure extends AppFailure {
  const NetworkFailure({required this.message, this.statusCode});
  final String message;
  final int? statusCode;
}

final class AuthFailure extends AppFailure {
  const AuthFailure({required this.message});
  final String message;

  static const expired = AuthFailure(message: 'Session expired. Please sign in again.');
  static const unauthorized = AuthFailure(message: 'Unauthorized.');
}

final class ValidationFailure extends AppFailure {
  const ValidationFailure({required this.message, this.fieldErrors = const {}});
  final String message;
  final Map<String, String> fieldErrors;
}

final class DbFailure extends AppFailure {
  const DbFailure({required this.message, this.cause});
  final String message;
  final Object? cause;
}

final class SyncFailure extends AppFailure {
  const SyncFailure({required this.message});
  final String message;
}

final class UnknownFailure extends AppFailure {
  const UnknownFailure({required this.message, this.cause});
  final String message;
  final Object? cause;
}
