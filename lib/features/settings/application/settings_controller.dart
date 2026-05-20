import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

/// In-memory toggle for the "Wi-Fi only" sync preference.
///
/// Phase 5 will persist this flag in SharedPreferences or flutter_secure_storage.
@riverpod
class WifiOnly extends _$WifiOnly {
  @override
  bool build() => false;

  void set(bool value) => state = value;
}
