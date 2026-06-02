import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../i18n/strings.g.dart';

const _persistedLocaleCodes = {'en', 'ua'};

AppLocale? _appLocaleFromLanguageCode(String languageCode) {
  for (final locale in AppLocale.values) {
    if (locale.languageCode == languageCode) {
      return locale;
    }
  }
  return null;
}

String _intlLocaleTagFor(AppLocale locale) => switch (locale) {
      AppLocale.ua => 'uk',
      AppLocale.en => 'en',
    };

/// Flutter Material/Cupertino system locale from the active slang locale.
///
/// Slang uses [AppLocale.ua] (`languageCode: ua`); Flutter and `intl`
/// expect `uk` for Ukrainian date/time pickers and formatting.
Locale resolveMaterialLocale() {
  return Locale(_intlLocaleTagFor(LocaleSettings.currentLocale));
}

/// Prefer [resolveMaterialLocale]; falls back when [context] has no locale.
Locale materialLocaleOf(BuildContext context) =>
    Localizations.maybeLocaleOf(context) ?? resolveMaterialLocale();

String resolveIntlLocaleTag() =>
    _intlLocaleTagFor(LocaleSettings.currentLocale);

void applyAppLocale(AppLocale locale) {
  LocaleSettings.setLocale(locale);
  syncIntlDefaultLocaleFor(locale);
}

void syncIntlDefaultLocaleFor(AppLocale locale) {
  Intl.defaultLocale = _intlLocaleTagFor(locale);
}

void syncIntlDefaultLocale() {
  syncIntlDefaultLocaleFor(LocaleSettings.currentLocale);
}

Future<void> applySavedOrDeviceLocale(String? savedLanguageCode) async {
  if (savedLanguageCode != null && _persistedLocaleCodes.contains(savedLanguageCode)) {
    final savedLocale = _appLocaleFromLanguageCode(savedLanguageCode);
    if (savedLocale != null) {
      applyAppLocale(savedLocale);
      return;
    }
  }

  await LocaleSettings.useDeviceLocale();
  syncIntlDefaultLocale();
}

String formatDateLong(DateTime dateTime) {
  return DateFormat.yMMMMEEEEd(resolveIntlLocaleTag()).format(dateTime);
}

String formatDateMedium(DateTime dateTime) {
  return DateFormat.yMMMd(resolveIntlLocaleTag()).format(dateTime);
}

String formatDateShort(DateTime dateTime) {
  return DateFormat.yMd(resolveIntlLocaleTag()).format(dateTime);
}

String formatDateShortWithTime(DateTime dateTime) {
  return DateFormat.yMd(resolveIntlLocaleTag()).add_jm().format(dateTime);
}

String formatDateMonthDay(DateTime dateTime) {
  return DateFormat.MMMd(resolveIntlLocaleTag()).format(dateTime);
}

String formatTime(DateTime dateTime) {
  return DateFormat.jm(resolveIntlLocaleTag()).format(dateTime);
}
