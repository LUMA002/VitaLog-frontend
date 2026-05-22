import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/global_ingredients_table.dart';

part 'global_ingredients_dao.g.dart';

/// Data access for the server-seeded [GlobalIngredients] catalog.
///
/// Read-mostly on the client. Writes occur exclusively via the sync pull path.
@DriftAccessor(tables: [GlobalIngredients])
class GlobalIngredientsDao extends DatabaseAccessor<AppDatabase>
    with _$GlobalIngredientsDaoMixin {
  GlobalIngredientsDao(super.db);

  /// Reactive stream of all global ingredients (filter deletedAt in repo).
  Stream<List<GlobalIngredientsData>> watchAll() =>
      select(globalIngredients).watch();

  /// Ingredient by UUID. Returns null if not found.
  Future<GlobalIngredientsData?> getById(String id) =>
      (select(globalIngredients)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  /// Dirty ingredients awaiting push. In practice these are server-owned rows
  /// so [pendingSync] should always be 0; included for completeness.
  Future<List<GlobalIngredientsData>> getPendingSync() =>
      (select(globalIngredients)
            ..where((t) => t.pendingSync.equals(1))
            ..orderBy([(t) => OrderingTerm.asc(t.updatedAt)]))
          .get();

  /// Insert or replace a batch. Called with the full pull payload from sync.
  /// Profile target: ≤ 250 ms for hundreds of rows on mid-tier Android.
  Future<void> upsertBatch(List<GlobalIngredientsCompanion> rows) =>
      batch((b) => b.insertAllOnConflictUpdate(globalIngredients, rows));

  /// Case-insensitive LIKE search over [name]. Excludes soft-deleted rows.
  Future<List<GlobalIngredientsData>> search(String query) =>
      (select(globalIngredients)
            ..where(
              (t) => t.name.like('%$query%') & t.deletedAt.isNull(),
            )
            ..orderBy([(t) => OrderingTerm.asc(t.name)]))
          .get();
}
