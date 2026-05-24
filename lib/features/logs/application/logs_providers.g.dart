// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages the full intake-log list for the current user.
///
/// Joins intake logs with courses and products so the history UI can show
/// product names without duplicating lookup logic in widgets.

@ProviderFor(IntakeLogsController)
final intakeLogsControllerProvider = IntakeLogsControllerProvider._();

/// Manages the full intake-log list for the current user.
///
/// Joins intake logs with courses and products so the history UI can show
/// product names without duplicating lookup logic in widgets.
final class IntakeLogsControllerProvider
    extends $AsyncNotifierProvider<IntakeLogsController, List<IntakeLogItem>> {
  /// Manages the full intake-log list for the current user.
  ///
  /// Joins intake logs with courses and products so the history UI can show
  /// product names without duplicating lookup logic in widgets.
  IntakeLogsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'intakeLogsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$intakeLogsControllerHash();

  @$internal
  @override
  IntakeLogsController create() => IntakeLogsController();
}

String _$intakeLogsControllerHash() =>
    r'a25b7f8ef391fe568db4191180081133284060b4';

/// Manages the full intake-log list for the current user.
///
/// Joins intake logs with courses and products so the history UI can show
/// product names without duplicating lookup logic in widgets.

abstract class _$IntakeLogsController
    extends $AsyncNotifier<List<IntakeLogItem>> {
  FutureOr<List<IntakeLogItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<IntakeLogItem>>, List<IntakeLogItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<IntakeLogItem>>, List<IntakeLogItem>>,
              AsyncValue<List<IntakeLogItem>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Manages the local-only wellbeing journal list.
///
/// Uses a hard delete ([deleteById]) since wellbeing logs are never synced.

@ProviderFor(WellbeingLogsController)
final wellbeingLogsControllerProvider = WellbeingLogsControllerProvider._();

/// Manages the local-only wellbeing journal list.
///
/// Uses a hard delete ([deleteById]) since wellbeing logs are never synced.
final class WellbeingLogsControllerProvider
    extends
        $AsyncNotifierProvider<WellbeingLogsController, List<WellbeingLog>> {
  /// Manages the local-only wellbeing journal list.
  ///
  /// Uses a hard delete ([deleteById]) since wellbeing logs are never synced.
  WellbeingLogsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wellbeingLogsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wellbeingLogsControllerHash();

  @$internal
  @override
  WellbeingLogsController create() => WellbeingLogsController();
}

String _$wellbeingLogsControllerHash() =>
    r'aa4cc177b6c6ec7052a3d686a7708e41f5935bd3';

/// Manages the local-only wellbeing journal list.
///
/// Uses a hard delete ([deleteById]) since wellbeing logs are never synced.

abstract class _$WellbeingLogsController
    extends $AsyncNotifier<List<WellbeingLog>> {
  FutureOr<List<WellbeingLog>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<WellbeingLog>>, List<WellbeingLog>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<WellbeingLog>>, List<WellbeingLog>>,
              AsyncValue<List<WellbeingLog>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Whether a wellbeing entry exists for the device's current local calendar day.

@ProviderFor(hasTodayWellbeingLog)
final hasTodayWellbeingLogProvider = HasTodayWellbeingLogProvider._();

/// Whether a wellbeing entry exists for the device's current local calendar day.

final class HasTodayWellbeingLogProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether a wellbeing entry exists for the device's current local calendar day.
  HasTodayWellbeingLogProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasTodayWellbeingLogProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasTodayWellbeingLogHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return hasTodayWellbeingLog(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hasTodayWellbeingLogHash() =>
    r'4c661ed09f23ca082e46684b956a6d9aac4a5996';
