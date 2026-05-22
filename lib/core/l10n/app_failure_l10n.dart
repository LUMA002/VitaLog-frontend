import '../../i18n/strings.g.dart';
import '../failure/app_failure.dart';

extension AppFailureL10n on AppFailure {
  String get localizedMessage {
    final tr = LocaleSettings.instance.currentTranslations;
    return switch (this) {
      NetworkFailure() => tr.errors.network,
      SyncFailure() => tr.errors.sync,
      AuthFailure() => identical(this, AuthFailure.expired)
          ? tr.errors.auth.expired
          : identical(this, AuthFailure.unauthorized)
              ? tr.errors.auth.unauthorized
              : message,
      DbFailure() => tr.errors.unknown,
      UnknownFailure() => tr.errors.unknown,
      ValidationFailure() => message,
    };
  }
}
