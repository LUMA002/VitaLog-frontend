import 'package:drift/drift.dart';

import '../../../data/local/app_database.dart';
import '../../../domain/models/global_ingredient.dart';
import '../../../domain/models/ingredient_category.dart';

/// Maps between [GlobalIngredientsData] and [GlobalIngredient].
///
/// [category] is stored as a 1-based INTEGER matching the backend contract
/// ([IngredientCategory.value]). Unknown values fall back to [supplement].
extension GlobalIngredientDriftX on GlobalIngredientsData {
  GlobalIngredient toDomain() => GlobalIngredient(
    id: id,
    name: name,
    defaultUnit: defaultUnit,
    category: IngredientCategory.fromValue(category),
    updatedAtUtc: updatedAt,
    deletedAtUtc: deletedAt,
  );
}

extension GlobalIngredientDomainX on GlobalIngredient {
  GlobalIngredientsCompanion toDrift({required int pendingSync}) =>
      GlobalIngredientsCompanion(
        id: Value(id),
        name: Value(name),
        defaultUnit: Value(defaultUnit),
        category: Value(category.value),
        updatedAt: Value(updatedAtUtc),
        deletedAt: Value(deletedAtUtc),
        pendingSync: Value(pendingSync),
      );
}
