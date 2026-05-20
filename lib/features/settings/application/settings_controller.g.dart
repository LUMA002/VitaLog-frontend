// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// In-memory toggle for the "Wi-Fi only" sync preference.
///
/// Phase 5 will persist this flag in SharedPreferences or flutter_secure_storage.

@ProviderFor(WifiOnly)
final wifiOnlyProvider = WifiOnlyProvider._();

/// In-memory toggle for the "Wi-Fi only" sync preference.
///
/// Phase 5 will persist this flag in SharedPreferences or flutter_secure_storage.
final class WifiOnlyProvider extends $NotifierProvider<WifiOnly, bool> {
  /// In-memory toggle for the "Wi-Fi only" sync preference.
  ///
  /// Phase 5 will persist this flag in SharedPreferences or flutter_secure_storage.
  WifiOnlyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiOnlyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiOnlyHash();

  @$internal
  @override
  WifiOnly create() => WifiOnly();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$wifiOnlyHash() => r'd1bfd3b57bc0a2763d98029653b0cb097abd84c7';

/// In-memory toggle for the "Wi-Fi only" sync preference.
///
/// Phase 5 will persist this flag in SharedPreferences or flutter_secure_storage.

abstract class _$WifiOnly extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
