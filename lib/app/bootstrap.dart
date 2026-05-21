import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/logger/talker.dart';
import '../core/logger/talker_riverpod_observer.dart';
import '../i18n/strings.g.dart';
import 'app.dart';

Future<void> bootstrap() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (details) {
      talker.handle(details.exception, details.stack, 'Flutter Error');
    };

    await LocaleSettings.useDeviceLocale();

    runApp(
      ProviderScope(
        observers: [TalkerRiverpodObserver(talker: talker)],
        child: const App(),
      ),
    );
  }, (error, stack) => talker.handle(error, stack, 'Zone Error'));
}
