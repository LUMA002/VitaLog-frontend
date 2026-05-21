// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_connectivity.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(connectivity)
final connectivityProvider = ConnectivityProvider._();

final class ConnectivityProvider
    extends $FunctionalProvider<Connectivity, Connectivity, Connectivity>
    with $Provider<Connectivity> {
  ConnectivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityHash();

  @$internal
  @override
  $ProviderElement<Connectivity> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Connectivity create(Ref ref) {
    return connectivity(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Connectivity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Connectivity>(value),
    );
  }
}

String _$connectivityHash() => r'e66720f09edf1a8b09e450e1eaedd51da9443f0e';

@ProviderFor(internetConnection)
final internetConnectionProvider = InternetConnectionProvider._();

final class InternetConnectionProvider
    extends
        $FunctionalProvider<
          InternetConnection,
          InternetConnection,
          InternetConnection
        >
    with $Provider<InternetConnection> {
  InternetConnectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'internetConnectionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$internetConnectionHash();

  @$internal
  @override
  $ProviderElement<InternetConnection> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InternetConnection create(Ref ref) {
    return internetConnection(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InternetConnection value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InternetConnection>(value),
    );
  }
}

String _$internetConnectionHash() =>
    r'3ffb7a82ca29eaeba555eaef462f3f82e8c2cc0e';

@ProviderFor(syncConnectivity)
final syncConnectivityProvider = SyncConnectivityProvider._();

final class SyncConnectivityProvider
    extends
        $FunctionalProvider<
          SyncConnectivity,
          SyncConnectivity,
          SyncConnectivity
        >
    with $Provider<SyncConnectivity> {
  SyncConnectivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncConnectivityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncConnectivityHash();

  @$internal
  @override
  $ProviderElement<SyncConnectivity> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SyncConnectivity create(Ref ref) {
    return syncConnectivity(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncConnectivity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncConnectivity>(value),
    );
  }
}

String _$syncConnectivityHash() => r'18c22e00727c6ff3b4ef0a43ecc2d07aeb3d1434';
