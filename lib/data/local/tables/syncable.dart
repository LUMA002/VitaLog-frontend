import 'package:drift/drift.dart';

import '../converters/microsecond_datetime_converter.dart';

/// Shared columns for every entity that participates in server sync.
///
/// - [id]          — UUID v4 string, primary key declared per-table.
/// - [updatedAt]   — microsecond-precision UTC timestamp; the LWW arbiter.
/// - [deletedAt]   — nullable; non-null means soft-deleted.
/// - [pendingSync] — 1 = row is dirty (needs push), 0 = acknowledged by server.
mixin Syncable on Table {
  /// UUID v4. Each concrete table must declare `{id}` in its [primaryKey].
  TextColumn get id => text().withLength(min: 36, max: 36)();

  /// Stored as INTEGER microsecondsSinceEpoch (UTC). See [MicrosecondDateTimeConverter].
  /// Return type is `Column<int>` (the SQL storage type); the [MicrosecondDateTimeConverter]
  /// makes data-class properties typed as `DateTime`.
  Column<int> get updatedAt =>
      integer().map(const MicrosecondDateTimeConverter())();

  /// NULL = alive row. Non-null = soft-deleted (matches backend semantics).
  Column<int> get deletedAt =>
      integer().map(const MicrosecondDateTimeConverter()).nullable()();

  /// Dirty flag: 1 = needs to be pushed to server, 0 = in sync with server.
  IntColumn get pendingSync =>
      integer().withDefault(const Constant(1))();
}
