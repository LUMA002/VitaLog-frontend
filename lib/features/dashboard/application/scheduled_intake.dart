import 'package:freezed_annotation/freezed_annotation.dart';

part 'scheduled_intake.freezed.dart';

/// A single scheduled supplement intake slot shown on the Dashboard.
///
/// Derived at runtime by joining active [Course]s with today's [IntakeLog]s.
/// Never persisted — fully recomputed on every stream emission.
@freezed
sealed class ScheduledIntake with _$ScheduledIntake {
  const factory ScheduledIntake({
    required String courseId,
    required String productId,

    /// Display name resolved from the [Product] catalogue.
    required String productName,
    required double servingSize,

    /// Duration from UTC midnight representing the scheduled time-of-day.
    required Duration timeOfDay,

    /// UTC timestamp for the scheduled slot (today's UTC midnight + [timeOfDay]).
    required DateTime scheduledAtUtc,

    /// Whether an [IntakeLog] exists for this course today.
    required bool isTaken,

    /// ID of the matching [IntakeLog] when [isTaken] is true.
    required String? intakeLogId,

    /// UTC timestamp the intake was actually recorded.
    required DateTime? takenAtUtc,
  }) = _ScheduledIntake;
}
