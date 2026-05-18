import 'package:drift/drift.dart';

import '../converters/microsecond_datetime_converter.dart';

/// Single-row metadata table for the sync engine.
///
/// Enforced single-row via `CHECK (id = 1)`. The row is inserted with `id = 1`
/// in [AppDatabase.onCreate] and must never be deleted; use UPDATE only.
@DataClassName('SyncMetaData')
class SyncMeta extends Table {
  /// Fixed to 1. The CHECK constraint prevents accidental multi-row inserts.
  IntColumn get id =>
      integer().customConstraint('NOT NULL CHECK (id = 1)')();

  /// UTC timestamp of the last successful sync. NULL before first sync.
  /// `Column<int>` = SQL INTEGER; data class exposes `DateTime?` via converter.
  Column<int> get lastSyncAt =>
      integer().map(const MicrosecondDateTimeConverter()).nullable()();

  /// Duration of the last sync operation in milliseconds.
  IntColumn get lastSyncDurationMs => integer().nullable()();

  /// Human-readable outcome: `'success'` | `'error'`.
  TextColumn get lastSyncStatus => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
