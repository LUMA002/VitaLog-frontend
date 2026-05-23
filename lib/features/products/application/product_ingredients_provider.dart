import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers/repository_providers.dart';

part 'product_ingredients_provider.g.dart';

/// Presentation model for a resolved product ingredient line-item.
final class ProductIngredientItem {
  const ProductIngredientItem({
    required this.name,
    required this.amount,
    required this.unit,
  });

  final String name;
  final double amount;
  final String unit;
}

/// Fetches active ingredients for [productId], resolving global catalog names.
@riverpod
Future<List<ProductIngredientItem>> productIngredients(
  Ref ref,
  String productId,
) async {
  final ingredients = await ref
      .read(productIngredientRepositoryProvider)
      .getForProduct(productId);

  if (ingredients.isEmpty) return const [];

  final globals = await ref
      .read(globalIngredientRepositoryProvider)
      .watchAll()
      .first;
  final globalNames = {for (final g in globals) g.id: g.name};

  return ingredients
      .map(
        (ingredient) => ProductIngredientItem(
          name: ingredient.customIngredientName ??
              globalNames[ingredient.ingredientId] ??
              '—',
          amount: ingredient.amount,
          unit: ingredient.unit,
        ),
      )
      .toList();
}
