import 'package:drift/drift.dart';

import '../../../data/local/app_database.dart';
import '../../../domain/models/product_ingredient.dart';

/// Maps between [ProductIngredientsData] and [ProductIngredient].
extension ProductIngredientDriftX on ProductIngredientsData {
  ProductIngredient toDomain() => ProductIngredient(
    id: id,
    productId: productId,
    ingredientId: ingredientId,
    customIngredientName: customIngredientName,
    amount: amount,
    unit: unit,
    updatedAtUtc: updatedAt,
    deletedAtUtc: deletedAt,
  );
}

extension ProductIngredientDomainX on ProductIngredient {
  ProductIngredientsCompanion toDrift({required int pendingSync}) =>
      ProductIngredientsCompanion(
        id: Value(id),
        productId: Value(productId),
        ingredientId: Value(ingredientId),
        customIngredientName: Value(customIngredientName),
        amount: Value(amount),
        unit: Value(unit),
        updatedAt: Value(updatedAtUtc),
        deletedAt: Value(deletedAtUtc),
        pendingSync: Value(pendingSync),
      );
}
