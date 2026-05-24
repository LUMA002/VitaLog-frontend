import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../core/l10n/app_failure_l10n.dart';
import '../../../core/result/result.dart';
import '../../../core/utils/uuid.dart';
import '../../../domain/models/wellbeing_log.dart';
import 'wellbeing_form_state.dart';

part 'wellbeing_form_controller.g.dart';

/// Manages mood / energy / sleep / notes for the wellbeing diary form.
@riverpod
class WellbeingFormController extends _$WellbeingFormController {
  @override
  WellbeingFormState build() => const WellbeingFormState();

  void setMood(int value) =>
      state = state.copyWith(mood: value.clamp(1, 5), errorMessage: null);

  void setEnergy(int value) =>
      state = state.copyWith(energy: value.clamp(1, 5), errorMessage: null);

  void setSleepHours(double value) =>
      state = state.copyWith(
        sleepHours: value.clamp(0, 24).toDouble(),
        errorMessage: null,
      );

  void setNotes(String value) =>
      state = state.copyWith(notes: value, errorMessage: null);

  /// Persists a new [WellbeingLog] at the current instant (UTC via [clockProvider]).
  ///
  /// Returns `true` on success so the UI can close the sheet.
  Future<bool> saveLog() async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);

    final now = ref.read(clockProvider).nowUtc();

    final trimmedNotes = state.notes.trim();
    final log = WellbeingLog(
      id: newUuid(),
      recordedAtUtc: now,
      mood: state.mood,
      energy: state.energy,
      sleepHours: state.sleepHours,
      notes: trimmedNotes.isEmpty ? null : trimmedNotes,
      createdAtUtc: now,
      updatedAtUtc: now,
      syncFlags: 0,
    );

    final result =
        await ref.read(wellbeingLogRepositoryProvider).insert(log);

    return result.when(
      success: (_) {
        state = state.copyWith(isSubmitting: false);
        return true;
      },
      failure: (failure) {
        state = state.copyWith(
          isSubmitting: false,
          errorMessage: failure.localizedMessage,
        );
        return false;
      },
    );
  }
}
