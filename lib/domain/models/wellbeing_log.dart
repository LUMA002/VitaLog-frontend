import 'package:freezed_annotation/freezed_annotation.dart';

part 'wellbeing_log.freezed.dart';

/// A local-only wellbeing journal entry.
///
/// [mood] and [energy] are 1–5 scales. [sleepHours] is 0–24 (nullable).
/// [notes] max 2 000 characters, enforced at the repository layer.
///
/// [syncFlags] is reserved for a future migration that promotes this entity
/// to a synced type — always 0 in V2. Do NOT use this field in UI logic.
///
/// No [fromJson]/[toJson] — this entity never leaves the device in V2.
@freezed
sealed class WellbeingLog with _$WellbeingLog {
  const factory WellbeingLog({
    required String id,
    required DateTime recordedAtUtc,
    required int mood,
    required int energy,
    required double? sleepHours,
    required String? notes,
    required DateTime createdAtUtc,
    required DateTime updatedAtUtc,
    required int syncFlags,
  }) = _WellbeingLog;
}
