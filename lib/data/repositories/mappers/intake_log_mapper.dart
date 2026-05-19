import 'package:drift/drift.dart';

import '../../../data/local/app_database.dart';
import '../../../domain/models/intake_log.dart';

/// Maps between [IntakeLogsData] and [IntakeLog].
///
/// [takenAt] in the Drift row already carries a [DateTime] (UTC) via the
/// [MicrosecondDateTimeConverter] — no manual epoch conversion needed.
extension IntakeLogDriftX on IntakeLogsData {
  IntakeLog toDomain() => IntakeLog(
    id: id,
    courseId: courseId,
    userId: userId,
    actualServingSize: actualServingSize,
    takenAtUtc: takenAt,
    updatedAtUtc: updatedAt,
    deletedAtUtc: deletedAt,
  );
}

extension IntakeLogDomainX on IntakeLog {
  IntakeLogsCompanion toDrift({required int pendingSync}) => IntakeLogsCompanion(
    id: Value(id),
    courseId: Value(courseId),
    userId: Value(userId),
    actualServingSize: Value(actualServingSize),
    takenAt: Value(takenAtUtc),
    updatedAt: Value(updatedAtUtc),
    deletedAt: Value(deletedAtUtc),
    pendingSync: Value(pendingSync),
  );
}
