import 'package:freezed_annotation/freezed_annotation.dart';

part 'intake_log.freezed.dart';

/// Records a single supplement intake event.
///
/// [takenAtUtc] is the exact moment the user took the supplement (UTC).
/// It is independent from [updatedAtUtc] (which tracks mutation time for LWW).
///
/// [userId] is denormalized from the parent [Course] for fast delta-sync
/// queries. It is null while the app is in Guest mode.
///
/// No [fromJson]/[toJson] — serialization lives in DTOs (Phase 5).
@freezed
sealed class IntakeLog with _$IntakeLog {
  const factory IntakeLog({
    required String id,
    required String courseId,
    required String? userId,
    required double actualServingSize,
    required DateTime takenAtUtc,
    required DateTime updatedAtUtc,
    required DateTime? deletedAtUtc,
  }) = _IntakeLog;
}
