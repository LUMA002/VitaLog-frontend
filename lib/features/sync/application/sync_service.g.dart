// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Singleton sync orchestrator.
///
/// State:
///  - [AsyncData(null)]    → idle / last sync succeeded
///  - [AsyncLoading]       → sync in progress
///  - [AsyncError]         → last sync failed (error = [AppFailure])
///
/// Call [runOnce] to trigger a push-pull cycle.  Only one cycle runs at a time;
/// concurrent calls are silently dropped if a cycle is already in-flight.

@ProviderFor(SyncService)
final syncServiceProvider = SyncServiceProvider._();

/// Singleton sync orchestrator.
///
/// State:
///  - [AsyncData(null)]    → idle / last sync succeeded
///  - [AsyncLoading]       → sync in progress
///  - [AsyncError]         → last sync failed (error = [AppFailure])
///
/// Call [runOnce] to trigger a push-pull cycle.  Only one cycle runs at a time;
/// concurrent calls are silently dropped if a cycle is already in-flight.
final class SyncServiceProvider
    extends $NotifierProvider<SyncService, AsyncValue<void>> {
  /// Singleton sync orchestrator.
  ///
  /// State:
  ///  - [AsyncData(null)]    → idle / last sync succeeded
  ///  - [AsyncLoading]       → sync in progress
  ///  - [AsyncError]         → last sync failed (error = [AppFailure])
  ///
  /// Call [runOnce] to trigger a push-pull cycle.  Only one cycle runs at a time;
  /// concurrent calls are silently dropped if a cycle is already in-flight.
  SyncServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncServiceHash();

  @$internal
  @override
  SyncService create() => SyncService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$syncServiceHash() => r'b631eecc479e898625f03441ee7f0706272130fc';

/// Singleton sync orchestrator.
///
/// State:
///  - [AsyncData(null)]    → idle / last sync succeeded
///  - [AsyncLoading]       → sync in progress
///  - [AsyncError]         → last sync failed (error = [AppFailure])
///
/// Call [runOnce] to trigger a push-pull cycle.  Only one cycle runs at a time;
/// concurrent calls are silently dropped if a cycle is already in-flight.

abstract class _$SyncService extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
