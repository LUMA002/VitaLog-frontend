// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages the full intake-log list for the current user.
///
/// Delegates soft-deletion to [IIntakeLogRepository] — streams auto-refresh
/// the UI via the underlying Drift subscription.

@ProviderFor(IntakeLogsController)
final intakeLogsControllerProvider = IntakeLogsControllerProvider._();

/// Manages the full intake-log list for the current user.
///
/// Delegates soft-deletion to [IIntakeLogRepository] — streams auto-refresh
/// the UI via the underlying Drift subscription.
final class IntakeLogsControllerProvider
    extends $AsyncNotifierProvider<IntakeLogsController, List<IntakeLog>> {
  /// Manages the full intake-log list for the current user.
  ///
  /// Delegates soft-deletion to [IIntakeLogRepository] — streams auto-refresh
  /// the UI via the underlying Drift subscription.
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
    r'b916bf0007cb1510be3806ee6b3f673424729ef1';

/// Manages the full intake-log list for the current user.
///
/// Delegates soft-deletion to [IIntakeLogRepository] — streams auto-refresh
/// the UI via the underlying Drift subscription.

abstract class _$IntakeLogsController extends $AsyncNotifier<List<IntakeLog>> {
  FutureOr<List<IntakeLog>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<IntakeLog>>, List<IntakeLog>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<IntakeLog>>, List<IntakeLog>>,
              AsyncValue<List<IntakeLog>>,
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
