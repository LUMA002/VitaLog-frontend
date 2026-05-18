import 'package:drift/drift.dart';

import '../converters/microsecond_datetime_converter.dart';

/// Local-only wellbeing journal entries. Does NOT use [Syncable] — this table
/// is intentionally offline-only for V2.
///
/// [syncFlags] (default 0) is a reserved column so this table can be promoted
/// to a synced entity in a future migration without a destructive schema change.
///
/// CHECK constraints for [mood] and [energy] (1–5 scale) and [sleepHours]
/// (0–24) are column-level SQLite constraints enforced at the DB layer.
@DataClassName('WellbeingLogData')
class WellbeingLogs extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();

  /// The date this entry describes (not the time it was created).
  /// `Column<int>` = SQL INTEGER; data class exposes `DateTime` via converter.
  Column<int> get recordedAt =>
      integer().map(const MicrosecondDateTimeConverter())();

  /// Subjective mood score: 1 (terrible) – 5 (great).
  IntColumn get mood =>
      integer().customConstraint('NOT NULL CHECK (mood BETWEEN 1 AND 5)')();

  /// Subjective energy score: 1 (exhausted) – 5 (energized).
  IntColumn get energy =>
      integer().customConstraint('NOT NULL CHECK (energy BETWEEN 1 AND 5)')();

  /// Hours of sleep. NULL = not recorded. Clamped to 0–24.
  RealColumn get sleepHours => real().nullable().customConstraint(
      'NULL CHECK (sleep_hours IS NULL OR sleep_hours BETWEEN 0 AND 24)')();

  /// Free-form notes. Max 2 000 characters (enforced at repository layer).
  TextColumn get notes => text().withLength(max: 2000).nullable()();

  Column<int> get createdAt =>
      integer().map(const MicrosecondDateTimeConverter())();

  Column<int> get updatedAt =>
      integer().map(const MicrosecondDateTimeConverter())();

  /// Reserved for future sync promotion. Always 0 in V2.
  IntColumn get syncFlags => integer().withDefault(const Constant(0))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
