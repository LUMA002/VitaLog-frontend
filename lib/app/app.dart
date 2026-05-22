import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/l10n/material_locale.dart';
import '../i18n/strings.g.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';
import 'widgets/app_lifecycle_sync.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppLifecycleSync(
      child: TranslationProvider(
        child: _VitaLogMaterialApp(router: ref.watch(appRouterProvider)),
      ),
    );
  }
}

class _VitaLogMaterialApp extends StatelessWidget {
  const _VitaLogMaterialApp({required this.router});

  final RouterConfig<Object> router;

  @override
  Widget build(BuildContext context) {
    final locale = resolveMaterialLocale();

    return MaterialApp.router(
      title: 'VitaLog',
      theme: AppTheme.dark,
      routerConfig: router,
      locale: locale,
      supportedLocales: const [Locale('en'), Locale('uk')],
      localeListResolutionCallback: (locales, supported) {
        for (final preferred in locales ?? const <Locale>[]) {
          if (preferred.languageCode == 'uk' || preferred.languageCode == 'ua') {
            return const Locale('uk');
          }
          if (preferred.languageCode == 'en') {
            return const Locale('en');
          }
        }
        return locale;
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
