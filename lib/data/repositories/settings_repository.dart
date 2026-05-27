import 'package:shared_preferences/shared_preferences.dart';

abstract final class SettingsKeys {
  static const wifiOnlySync = 'wifi_only_sync';
  static const appLocale = 'app_locale';
}

/// Persists app-level preferences via [SharedPreferences].
final class SettingsRepository {
  SettingsRepository(this._prefs);

  final SharedPreferences _prefs;

  bool getWifiOnlySync() => _prefs.getBool(SettingsKeys.wifiOnlySync) ?? false;

  Future<void> setWifiOnlySync(bool value) =>
      _prefs.setBool(SettingsKeys.wifiOnlySync, value);

  String? getSavedLocale() => _prefs.getString(SettingsKeys.appLocale);

  Future<void> setSavedLocale(String languageCode) =>
      _prefs.setString(SettingsKeys.appLocale, languageCode);
}
