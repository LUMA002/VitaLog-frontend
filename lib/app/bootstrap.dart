import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/l10n/material_locale.dart';
import '../core/logger/talker.dart';
import '../core/logger/talker_riverpod_observer.dart';
import '../data/repositories/settings_repository.dart';
import 'app.dart';

Future<void> bootstrap() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (details) {
      talker.handle(details.exception, details.stack, 'Flutter Error');
    };

    final prefs = await SharedPreferences.getInstance();
    final settingsRepo = SettingsRepository(prefs);
    await applySavedOrDeviceLocale(settingsRepo.getSavedLocale());

    // Pre-initialize date formatting for all supported locales so that
    // DateFormat correctly localizes dates without requiring a network load.
    await Future.wait([
      initializeDateFormatting('en', null),
      initializeDateFormatting('uk', null),
    ]);

    runApp(
      ProviderScope(
        observers: [TalkerRiverpodObserver(talker: talker)],
        child: const App(),
      ),
    );
  }, (error, stack) => talker.handle(error, stack, 'Zone Error'));
}
