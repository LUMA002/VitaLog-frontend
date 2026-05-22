import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../i18n/strings.g.dart';

part 'course_form_state.freezed.dart';

/// Immutable state for the course create/edit form.
///
/// Validation mirrors the backend rules:
/// - [productId] must be non-null and non-empty.
/// - [servingSizeInput] must parse to a `double > 0`.
/// - If [endDateUtc] is set, it must be `>= startDateUtc`.
@freezed
sealed class CourseFormState with _$CourseFormState {
  const factory CourseFormState({
    required String? productId,
    required String productName,

    /// Raw text input for serving size — validated on submit.
    required String servingSizeInput,

    /// Duration from midnight (UTC-safe, timezone-agnostic schedule time).
    required Duration timeOfDay,

    /// UTC midnight of the start date.
    required DateTime startDateUtc,

    /// UTC midnight of the optional end date. Null = open-ended.
    required DateTime? endDateUtc,
    required bool isSubmitting,

    /// Field-level validation errors keyed by field name.
    /// Key `'_global'` holds a top-level submit error message.
    @Default({}) Map<String, String> fieldErrors,
  }) = _CourseFormState;
}

/// Validates the form state and returns a map of field errors (empty = valid).
Map<String, String> validateCourseForm(CourseFormState state) {
  final errors = <String, String>{};

  if (state.productId == null || state.productId!.isEmpty) {
    errors['product'] = t.validation.productRequired;
  }

  final servingSize = double.tryParse(state.servingSizeInput);
  if (servingSize == null || servingSize <= 0) {
    errors['servingSize'] = t.validation.servingSizePositive;
  }

  if (state.endDateUtc != null &&
      state.endDateUtc!.isBefore(state.startDateUtc)) {
    errors['endDate'] = t.validation.endDateOnOrAfterStart;
  }

  return errors;
}
