import 'package:drift/drift.dart';

import '../converters/microsecond_datetime_converter.dart';
import 'courses_table.dart';
import 'syncable.dart';

/// Records a single supplement intake event.
///
/// [userId] is denormalized from the parent [Courses] row for fast delta sync
/// queries (`WHERE user_id = ? AND updated_at > ?`). This matches the backend
/// schema which denormalizes [userId] on [IntakeLogs] for the same reason.
///
/// [takenAt] is the actual moment the user took the supplement (UTC,
/// microsecond precision). It is independent from [updatedAt] (which tracks
/// record mutation time for LWW sync).
@DataClassName('IntakeLogsData')
class IntakeLogs extends Table with Syncable {
  TextColumn get courseId => text().references(Courses, #id)();

  /// Denormalized from parent course. NULL while in guest mode.
  TextColumn get userId => text().nullable()();

  /// Snapshot of the serving size at the time of intake. Must be > 0.
  RealColumn get actualServingSize => real()
      .customConstraint('NOT NULL CHECK (actual_serving_size > 0)')();

  /// Exact UTC moment the supplement was taken.
  /// `Column<int>` = SQL INTEGER; data class exposes `DateTime` via converter.
  Column<int> get takenAt =>
      integer().map(const MicrosecondDateTimeConverter())();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
