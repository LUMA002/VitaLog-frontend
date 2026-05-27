import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repositories/settings_repository.dart';
import '../../../i18n/strings.g.dart';
import '../domain/app_settings.dart';

part 'settings_controller.g.dart';

@Riverpod(keepAlive: true)
Future<SettingsRepository> settingsRepository(Ref ref) async {
  final prefs = await SharedPreferences.getInstance();
  return SettingsRepository(prefs);
}

@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  @override
  Future<AppSettings> build() async {
    final repo = await ref.watch(settingsRepositoryProvider.future);
    return AppSettings(wifiOnlySync: repo.getWifiOnlySync());
  }

  Future<void> setWifiOnlySync(bool value) async {
    final repo = await ref.read(settingsRepositoryProvider.future);
    await repo.setWifiOnlySync(value);
    final current = state.requireValue;
    state = AsyncData(current.copyWith(wifiOnlySync: value));
  }

  Future<void> persistAppLocale(AppLocale locale) async {
    final repo = await ref.read(settingsRepositoryProvider.future);
    await repo.setSavedLocale(locale.languageCode);
  }
}
