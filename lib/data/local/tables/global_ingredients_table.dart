import 'package:drift/drift.dart';

import 'syncable.dart';

/// Server-seeded catalog of known nutrients (Vitamin C, Magnesium, etc.).
///
/// [category] maps to the backend's `IngredientCategory` enum (1-based):
///   1 = Vitamin, 2 = Mineral, 3 = Supplement.
///
/// This table is read-mostly on the client. Writes happen exclusively via
/// the sync pull path ([GlobalIngredientsDao.upsertBatch]).
@DataClassName('GlobalIngredientsData')
class GlobalIngredients extends Table with Syncable {
  TextColumn get name => text()();
  TextColumn get defaultUnit => text()();

  /// Backend [IngredientCategory] value (1 = vitamin, 2 = mineral, 3 = supplement).
  IntColumn get category => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
