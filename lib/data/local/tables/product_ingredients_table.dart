import 'package:drift/drift.dart';

import 'products_table.dart';
import 'syncable.dart';

/// Ingredient line-items inside a [Products] row.
///
/// XOR constraint: exactly one of [ingredientId] or [customIngredientName]
/// must be non-NULL (mirrors the backend's check constraint). Enforced here
/// as a column-level SQLite CHECK (SQLite allows cross-column expressions in
/// column constraints). Also enforced at the repository/use-case layer.
@DataClassName('ProductIngredientsData')
class ProductIngredients extends Table with Syncable {
  TextColumn get productId => text().references(Products, #id)();

  /// FK to `GlobalIngredients.id`. NULL when using a custom ingredient name.
  TextColumn get ingredientId => text().nullable()();

  /// Free-text ingredient name. NULL when referencing a [GlobalIngredients] row.
  /// The CHECK here enforces the XOR rule with [ingredientId].
  TextColumn get customIngredientName => text().nullable().customConstraint(
      'NULL CHECK ((ingredient_id IS NULL) != (custom_ingredient_name IS NULL))')();

  /// Per-serving amount. Must be > 0.
  RealColumn get amount =>
      real().customConstraint('NOT NULL CHECK (amount > 0)')();

  TextColumn get unit => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
