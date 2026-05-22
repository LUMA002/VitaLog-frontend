// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages the state for the course create / edit form.
///
/// [courseId] == null в†’ create mode (initialised with sensible defaults).
/// [courseId] != null в†’ edit mode (loaded from [ICourseRepository]).
///
/// The form screen calls [submit] and pops on `true` return.

@ProviderFor(CourseFormController)
final courseFormControllerProvider = CourseFormControllerFamily._();

/// Manages the state for the course create / edit form.
///
/// [courseId] == null в†’ create mode (initialised with sensible defaults).
/// [courseId] != null в†’ edit mode (loaded from [ICourseRepository]).
///
/// The form screen calls [submit] and pops on `true` return.
final class CourseFormControllerProvider
    extends $AsyncNotifierProvider<CourseFormController, CourseFormState> {
  /// Manages the state for the course create / edit form.
  ///
  /// [courseId] == null в†’ create mode (initialised with sensible defaults).
  /// [courseId] != null в†’ edit mode (loaded from [ICourseRepository]).
  ///
  /// The form screen calls [submit] and pops on `true` return.
  CourseFormControllerProvider._({
    required CourseFormControllerFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'courseFormControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$courseFormControllerHash();

  @override
  String toString() {
    return r'courseFormControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CourseFormController create() => CourseFormController();

  @override
  bool operator ==(Object other) {
    return other is CourseFormControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$courseFormControllerHash() =>
    r'f74b074595a14a4796169047779be148486db3cc';

/// Manages the state for the course create / edit form.
///
/// [courseId] == null в†’ create mode (initialised with sensible defaults).
/// [courseId] != null в†’ edit mode (loaded from [ICourseRepository]).
///
/// The form screen calls [submit] and pops on `true` return.

final class CourseFormControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          CourseFormController,
          AsyncValue<CourseFormState>,
          CourseFormState,
          FutureOr<CourseFormState>,
          String?
        > {
  CourseFormControllerFamily._()
    : super(
        retry: null,
        name: r'courseFormControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Manages the state for the course create / edit form.
  ///
  /// [courseId] == null в†’ create mode (initialised with sensible defaults).
  /// [courseId] != null в†’ edit mode (loaded from [ICourseRepository]).
  ///
  /// The form screen calls [submit] and pops on `true` return.

  CourseFormControllerProvider call(String? courseId) =>
      CourseFormControllerProvider._(argument: courseId, from: this);

  @override
  String toString() => r'courseFormControllerProvider';
}

/// Manages the state for the course create / edit form.
///
/// [courseId] == null в†’ create mode (initialised with sensible defaults).
/// [courseId] != null в†’ edit mode (loaded from [ICourseRepository]).
///
/// The form screen calls [submit] and pops on `true` return.

abstract class _$CourseFormController extends $AsyncNotifier<CourseFormState> {
  late final _$args = ref.$arg as String?;
  String? get courseId => _$args;

  FutureOr<CourseFormState> build(String? courseId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CourseFormState>, CourseFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CourseFormState>, CourseFormState>,
              AsyncValue<CourseFormState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
