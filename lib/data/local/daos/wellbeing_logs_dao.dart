import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/wellbeing_logs_table.dart';

part 'wellbeing_logs_dao.g.dart';

/// Data access for the local-only [WellbeingLogs] journal.
///
/// No sync methods (no [pendingSync] column). All mutations are local-only
/// in V2. The [syncFlags] column in the table is reserved for a future
/// migration that promotes wellbeing logs to synced entities.
@DriftAccessor(tables: [WellbeingLogs])
class WellbeingLogsDao extends DatabaseAccessor<AppDatabase>
    with _$WellbeingLogsDaoMixin {
  WellbeingLogsDao(super.db);

  /// Reactive stream of all entries, newest first.
  Stream<List<WellbeingLogData>> watchAll() =>
      (select(wellbeingLogs)
            ..orderBy([(t) => OrderingTerm.desc(t.recordedAt)]))
          .watch();

  /// Single entry by UUID. Returns null if not found.
  Future<WellbeingLogData?> getById(String id) =>
      (select(wellbeingLogs)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Inserts a new wellbeing log entry.
  Future<void> insertLog(WellbeingLogsCompanion row) =>
      into(wellbeingLogs).insert(row);

  /// Updates an existing entry. Returns true if a row was affected.
  Future<bool> updateLog(WellbeingLogsCompanion row) =>
      update(wellbeingLogs).replace(row);

  /// Deletes an entry by UUID. Returns the number of rows deleted (0 or 1).
  Future<int> deleteById(String id) =>
      (delete(wellbeingLogs)..where((t) => t.id.equals(id))).go();

  /// Hard-deletes all wellbeing journal rows (logout erase).
  ///
  /// V2 schema has no [userId] on this table; entries are device-local only.
  Future<int> deleteAll() => delete(wellbeingLogs).go();
}
