import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../core/l10n/app_failure_l10n.dart';
import '../../../core/result/result.dart';
import '../../../core/utils/uuid.dart';
import '../../../domain/models/course.dart';
import '../../auth/application/auth_controller.dart';
import '../../notifications/application/notification_service.dart';
import 'course_form_state.dart';

part 'course_form_controller.g.dart';

/// Manages the state for the course create / edit form.
///
/// [courseId] == null в†’ create mode (initialised with sensible defaults).
/// [courseId] != null в†’ edit mode (loaded from [ICourseRepository]).
///
/// The form screen calls [submit] and pops on `true` return.
@riverpod
class CourseFormController extends _$CourseFormController {
  @override
  FutureOr<CourseFormState> build(String? courseId) async {
    final clock = ref.read(clockProvider);
    final nowUtc = clock.nowUtc();
    final todayUtc =
        DateTime.utc(nowUtc.year, nowUtc.month, nowUtc.day);

    if (courseId == null) {
      return CourseFormState(
        productId: null,
        productName: '',
        servingSizeInput: '1',
        timeOfDay: const Duration(hours: 8),
        startDateUtc: todayUtc,
        endDateUtc: null,
        isSubmitting: false,
      );
    }

    final course =
        await ref.read(courseRepositoryProvider).getById(courseId);
    if (course == null) {
      throw StateError('Course $courseId not found.');
    }
    final product =
        await ref.read(productRepositoryProvider).getById(course.productId);

    return CourseFormState(
      productId: course.productId,
      productName: product?.name ?? 'вЂ”',
      servingSizeInput: course.servingSize.toString(),
      timeOfDay: course.timeOfDay,
      startDateUtc: course.startDateUtc,
      endDateUtc: course.endDateUtc,
      isSubmitting: false,
    );
  }

  // в”Ђв”Ђ Field setters в”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђ

  void setProduct(String productId, String productName) {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(current.copyWith(
      productId: productId,
      productName: productName,
      fieldErrors: const {},
    ));
  }

  void setServingSize(String raw) {
    final current = state.value;
    if (current == null) return;
    state =
        AsyncData(current.copyWith(servingSizeInput: raw, fieldErrors: const {}));
  }

  void setTimeOfDay(Duration d) {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(current.copyWith(timeOfDay: d));
  }

  void setStartDate(DateTime utcMidnight) {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(current.copyWith(startDateUtc: utcMidnight));
  }

  void setEndDate(DateTime? utcMidnight) {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(current.copyWith(endDateUtc: utcMidnight));
  }

  // в”Ђв”Ђ Submit в”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђв”Ђ

  /// Validates and persists the form.
  ///
  /// Returns `true` on success (screen should pop), `false` on validation
  /// or repository failure (state updated with [fieldErrors]).
  Future<bool> submit() async {
    final current = state.value;
    if (current == null) return false;

    final errors = validateCourseForm(current);
    if (errors.isNotEmpty) {
      state = AsyncData(current.copyWith(fieldErrors: errors));
      return false;
    }

    state = AsyncData(current.copyWith(isSubmitting: true, fieldErrors: const {}));

    try {
      final clock = ref.read(clockProvider);
      final now = clock.nowUtc();
      final authState = ref.read(authControllerProvider).value;
      final userId = switch (authState) {
        Authenticated(:final userId) => userId,
        _ => null,
      };
      final servingSize = double.parse(current.servingSizeInput);

      final course = Course(
        id: courseId ?? newUuid(),
        userId: userId,
        productId: current.productId!,
        servingSize: servingSize,
        timeOfDay: current.timeOfDay,
        startDateUtc: current.startDateUtc,
        endDateUtc: current.endDateUtc,
        updatedAtUtc: now,
        deletedAtUtc: null,
      );

      final result =
          await ref.read(courseRepositoryProvider).upsert(course);

      return result.when(
        success: (_) {
          ref.read(notificationServiceProvider).scheduleNextIntakes();
          return true;
        },
        failure: (e) {
          state = AsyncData(
            current.copyWith(
              isSubmitting: false,
              fieldErrors: {'_global': e.localizedMessage},
            ),
          );
          return false;
        },
      );
    } catch (e) {
      state = AsyncData(
        current.copyWith(
          isSubmitting: false,
          fieldErrors: {'_global': e.toString()},
        ),
      );
      return false;
    }
  }
}
