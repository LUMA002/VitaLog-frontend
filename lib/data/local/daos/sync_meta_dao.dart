import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/sync_meta_table.dart';

part 'sync_meta_dao.g.dart';

/// Data access for the [SyncMeta] single-row table.
///
/// The row with `id = 1` is seeded in [AppDatabase.onCreate] and must never
/// be deleted. All writes are UPDATEs on that single row.
@DriftAccessor(tables: [SyncMeta])
class SyncMetaDao extends DatabaseAccessor<AppDatabase>
    with _$SyncMetaDaoMixin {
  SyncMetaDao(super.db);

  /// Reactive stream of the single sync-metadata row.
  Stream<SyncMetaData?> watchSyncMeta() =>
      (select(syncMeta)..where((t) => t.id.equals(1))).watchSingleOrNull();

  /// Reads the timestamp of the last successful sync. Null before first sync.
  Future<DateTime?> getLastSyncAt() async {
    final row =
        await (select(syncMeta)..where((t) => t.id.equals(1)))
            .getSingleOrNull();
    return row?.lastSyncAt;
  }

  /// Writes the result of a completed sync attempt.
  Future<void> updateSyncMeta({
    required DateTime? lastSyncAt,
    int? lastSyncDurationMs,
    String? lastSyncStatus,
  }) =>
      (update(syncMeta)..where((t) => t.id.equals(1))).write(
        SyncMetaCompanion(
          lastSyncAt: Value(lastSyncAt),
          lastSyncDurationMs: Value(lastSyncDurationMs),
          lastSyncStatus: Value(lastSyncStatus),
        ),
      );
}
