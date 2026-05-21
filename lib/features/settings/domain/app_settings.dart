class AppSettings {
  const AppSettings({this.wifiOnlySync = false});

  final bool wifiOnlySync;

  AppSettings copyWith({bool? wifiOnlySync}) {
    return AppSettings(wifiOnlySync: wifiOnlySync ?? this.wifiOnlySync);
  }
}
