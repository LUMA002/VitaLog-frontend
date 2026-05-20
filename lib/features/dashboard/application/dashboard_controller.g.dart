// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Derives today's supplement schedule by joining active [Course]s,
/// today's [IntakeLog]s and the [Product] catalogue.
///
/// Whenever any of the three underlying Drift streams emit, [build] re-runs
/// and the dashboard re-renders automatically with zero explicit refresh calls.

@ProviderFor(DashboardSchedule)
final dashboardScheduleProvider = DashboardScheduleProvider._();

/// Derives today's supplement schedule by joining active [Course]s,
/// today's [IntakeLog]s and the [Product] catalogue.
///
/// Whenever any of the three underlying Drift streams emit, [build] re-runs
/// and the dashboard re-renders automatically with zero explicit refresh calls.
final class DashboardScheduleProvider
    extends $AsyncNotifierProvider<DashboardSchedule, List<ScheduledIntake>> {
  /// Derives today's supplement schedule by joining active [Course]s,
  /// today's [IntakeLog]s and the [Product] catalogue.
  ///
  /// Whenever any of the three underlying Drift streams emit, [build] re-runs
  /// and the dashboard re-renders automatically with zero explicit refresh calls.
  DashboardScheduleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardScheduleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardScheduleHash();

  @$internal
  @override
  DashboardSchedule create() => DashboardSchedule();
}

String _$dashboardScheduleHash() => r'bd77901ebb5591f6adf002eec66f3a8014c1484c';

/// Derives today's supplement schedule by joining active [Course]s,
/// today's [IntakeLog]s and the [Product] catalogue.
///
/// Whenever any of the three underlying Drift streams emit, [build] re-runs
/// and the dashboard re-renders automatically with zero explicit refresh calls.

abstract class _$DashboardSchedule
    extends $AsyncNotifier<List<ScheduledIntake>> {
  FutureOr<List<ScheduledIntake>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ScheduledIntake>>, List<ScheduledIntake>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ScheduledIntake>>,
                List<ScheduledIntake>
              >,
              AsyncValue<List<ScheduledIntake>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
