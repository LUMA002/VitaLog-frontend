import 'package:freezed_annotation/freezed_annotation.dart';

part 'wellbeing_form_state.freezed.dart';

/// Immutable state for the wellbeing diary bottom-sheet form.
@freezed
sealed class WellbeingFormState with _$WellbeingFormState {
  const factory WellbeingFormState({
    @Default(3) int mood,
    @Default(3) int energy,
    @Default(7.0) double sleepHours,
    @Default('') String notes,
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _WellbeingFormState;
}
