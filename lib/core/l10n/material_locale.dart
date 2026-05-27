import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../i18n/strings.g.dart';

const _persistedLocaleCodes = {'en', 'ua'};

/// Flutter Material/Cupertino system locale from the active slang locale.
///
/// Slang uses [AppLocale.ua] (`languageCode: ua`); Flutter and `intl`
/// expect `uk` for Ukrainian date/time pickers and formatting.
Locale resolveMaterialLocale() => switch (LocaleSettings.currentLocale) {
      AppLocale.ua => const Locale('uk'),
      AppLocale.en => const Locale('en'),
    };

/// Prefer [resolveMaterialLocale]; falls back when [context] has no locale.
Locale materialLocaleOf(BuildContext context) =>
    Localizations.maybeLocaleOf(context) ?? resolveMaterialLocale();

void syncIntlDefaultLocale() {
  Intl.defaultLocale = switch (LocaleSettings.currentLocale) {
    AppLocale.ua => 'uk',
    _ => LocaleSettings.currentLocale.languageCode,
  };
}

Future<void> applySavedOrDeviceLocale(String? savedLanguageCode) async {
  if (savedLanguageCode != null &&
      _persistedLocaleCodes.contains(savedLanguageCode)) {
    LocaleSettings.setLocaleRaw(savedLanguageCode);
  } else {
    await LocaleSettings.useDeviceLocale();
  }
  syncIntlDefaultLocale();
}
