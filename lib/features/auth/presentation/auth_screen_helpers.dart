import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/routes.dart';
import '../../../core/failure/app_failure.dart';
import '../../../i18n/strings.g.dart';
import '../application/auth_controller.dart';

/// Wires auth-screen side effects: error [SnackBar]s and post-login navigation.
void listenAuthController(WidgetRef ref, BuildContext context) {
  ref.listen<AsyncValue<AuthState>>(authControllerProvider, (previous, next) {
    if (!context.mounted) return;

    next.whenOrNull(
      error: (error, _) {
        final message =
            error is AppFailure ? error.message : error.toString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      },
    );

    final wasLoading = previous?.isLoading ?? false;
    final authenticated = next.asData?.value;
    if (wasLoading && authenticated is Authenticated) {
      context.go(AppRoutes.dashboard);
    }
  });
}

// Mirrors backend FluentValidation: NotEmpty, EmailAddress, MaximumLength(255).
// ASP.NET EmailAddressAttribute-compatible pattern (single @, domain with dot).
final RegExp _authEmailPattern = RegExp(
  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
  r'[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?'
  r'(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+$',
);

const int _authEmailMaxLength = 255;
const int _registerPasswordMinLength = 8;
const int _registerPasswordMaxLength = 128;

final RegExp _passwordUppercase = RegExp(r'[A-Z]');
final RegExp _passwordLowercase = RegExp(r'[a-z]');
final RegExp _passwordDigit = RegExp(r'[0-9]');

String? validateAuthEmail(String? value, Translations t) {
  final trimmed = value?.trim() ?? '';
  if (trimmed.isEmpty) return t.auth.validation.emailRequired;
  if (trimmed.length > _authEmailMaxLength) {
    return t.auth.validation.emailMaxLength;
  }
  if (!_authEmailPattern.hasMatch(trimmed)) {
    return t.auth.validation.emailInvalid;
  }
  return null;
}

/// Login: backend [LoginRequestValidator] — password NotEmpty only.
String? validateAuthLoginPassword(String? value, Translations t) {
  if ((value ?? '').isEmpty) return t.auth.validation.passwordRequired;
  return null;
}

/// Register: backend [RegisterRequestValidator] complexity rules.
String? validateAuthRegisterPassword(String? value, Translations t) {
  final password = value ?? '';
  if (password.isEmpty) return t.auth.validation.passwordRequired;
  if (password.length < _registerPasswordMinLength) {
    return t.auth.validation.passwordMinLength;
  }
  if (password.length > _registerPasswordMaxLength) {
    return t.auth.validation.passwordMaxLength;
  }
  if (!_passwordUppercase.hasMatch(password)) {
    return t.auth.validation.passwordUppercase;
  }
  if (!_passwordLowercase.hasMatch(password)) {
    return t.auth.validation.passwordLowercase;
  }
  if (!_passwordDigit.hasMatch(password)) {
    return t.auth.validation.passwordDigit;
  }
  return null;
}

String? validateAuthConfirmPassword(
  String? value,
  String password,
  Translations t,
) {
  if ((value ?? '').isEmpty) {
    return t.auth.validation.confirmPasswordRequired;
  }
  if (value != password) return t.auth.validation.confirmPasswordMismatch;
  return null;
}
