import 'package:drift/drift.dart';

import '../../../data/local/app_database.dart';
import '../../../domain/models/wellbeing_log.dart';

/// Maps between [WellbeingLogData] and [WellbeingLog].
///
/// [recordedAt], [createdAt], and [updatedAt] in the Drift row already carry
/// [DateTime] (UTC) values via [MicrosecondDateTimeConverter].
extension WellbeingLogDriftX on WellbeingLogData {
  WellbeingLog toDomain() => WellbeingLog(
    id: id,
    recordedAtUtc: recordedAt,
    mood: mood,
    energy: energy,
    sleepHours: sleepHours,
    notes: notes,
    createdAtUtc: createdAt,
    updatedAtUtc: updatedAt,
    syncFlags: syncFlags,
  );
}

extension WellbeingLogDomainX on WellbeingLog {
  WellbeingLogsCompanion toDrift() => WellbeingLogsCompanion(
    id: Value(id),
    recordedAt: Value(recordedAtUtc),
    mood: Value(mood),
    energy: Value(energy),
    sleepHours: Value(sleepHours),
    notes: Value(notes),
    createdAt: Value(createdAtUtc),
    updatedAt: Value(updatedAtUtc),
    syncFlags: Value(syncFlags),
  );
}
