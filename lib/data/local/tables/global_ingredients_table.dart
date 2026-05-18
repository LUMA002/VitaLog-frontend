import 'package:drift/drift.dart';

import 'syncable.dart';

/// Server-seeded catalog of known nutrients (Vitamin C, Magnesium, etc.).
///
/// [category] maps to the backend's `IngredientCategory` enum by index:
///   0 = Vitamin, 1 = Mineral, 2 = Supplement, 3 = Nootropic.
///
/// This table is read-mostly on the client. Writes happen exclusively via
/// the sync pull path ([GlobalIngredientsDao.upsertBatch]).
@DataClassName('GlobalIngredientsData')
class GlobalIngredients extends Table with Syncable {
  TextColumn get name => text()();
  TextColumn get defaultUnit => text()();

  /// [IngredientCategory] enum index. See domain model for mapping.
  IntColumn get category => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
