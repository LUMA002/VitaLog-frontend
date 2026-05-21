import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../i18n/strings.g.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';
import 'widgets/app_lifecycle_sync.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return AppLifecycleSync(
      child: TranslationProvider(
        child: MaterialApp.router(
        title: 'VitaLog',
        theme: AppTheme.dark,
        routerConfig: router,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
