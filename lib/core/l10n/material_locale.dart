import 'package:flutter/material.dart';

import '../../i18n/strings.g.dart';

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
