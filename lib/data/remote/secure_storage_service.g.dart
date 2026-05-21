// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secure_storage_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Thin facade over [FlutterSecureStorage].
///
/// Android: defaults to `EncryptedSharedPreferences` (requires `minSdkVersion
/// = 23` in `android/app/build.gradle`).
/// iOS: Keychain with `accessibility = first_unlock_this_device`.

@ProviderFor(secureStorageService)
final secureStorageServiceProvider = SecureStorageServiceProvider._();

/// Thin facade over [FlutterSecureStorage].
///
/// Android: defaults to `EncryptedSharedPreferences` (requires `minSdkVersion
/// = 23` in `android/app/build.gradle`).
/// iOS: Keychain with `accessibility = first_unlock_this_device`.

final class SecureStorageServiceProvider
    extends
        $FunctionalProvider<
          SecureStorageService,
          SecureStorageService,
          SecureStorageService
        >
    with $Provider<SecureStorageService> {
  /// Thin facade over [FlutterSecureStorage].
  ///
  /// Android: defaults to `EncryptedSharedPreferences` (requires `minSdkVersion
  /// = 23` in `android/app/build.gradle`).
  /// iOS: Keychain with `accessibility = first_unlock_this_device`.
  SecureStorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageServiceHash();

  @$internal
  @override
  $ProviderElement<SecureStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SecureStorageService create(Ref ref) {
    return secureStorageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SecureStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SecureStorageService>(value),
    );
  }
}

String _$secureStorageServiceHash() =>
    r'9b8abb2bde21e8a804582fd2b0fa39c3d9e24ea5';
