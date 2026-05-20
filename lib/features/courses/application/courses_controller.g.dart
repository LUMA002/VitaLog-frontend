// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the list of active courses for the current user, enriched with
/// product metadata for display.

@ProviderFor(CoursesController)
final coursesControllerProvider = CoursesControllerProvider._();

/// Provides the list of active courses for the current user, enriched with
/// product metadata for display.
final class CoursesControllerProvider
    extends $AsyncNotifierProvider<CoursesController, List<CourseItem>> {
  /// Provides the list of active courses for the current user, enriched with
  /// product metadata for display.
  CoursesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coursesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coursesControllerHash();

  @$internal
  @override
  CoursesController create() => CoursesController();
}

String _$coursesControllerHash() => r'28119f364931917ca49225ac6d4317831738ab59';

/// Provides the list of active courses for the current user, enriched with
/// product metadata for display.

abstract class _$CoursesController extends $AsyncNotifier<List<CourseItem>> {
  FutureOr<List<CourseItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<CourseItem>>, List<CourseItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<CourseItem>>, List<CourseItem>>,
              AsyncValue<List<CourseItem>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
