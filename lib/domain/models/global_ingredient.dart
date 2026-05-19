import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredient_category.dart';

part 'global_ingredient.freezed.dart';

/// A server-seeded catalog entry for a known nutrient (e.g. "Vitamin C").
///
/// This entity is read-mostly on the client. All writes occur exclusively
/// through the sync pull path.
///
/// No [fromJson]/[toJson] — serialization lives in DTOs (Phase 5).
@freezed
sealed class GlobalIngredient with _$GlobalIngredient {
  const factory GlobalIngredient({
    required String id,
    required String name,
    required String defaultUnit,
    required IngredientCategory category,
    required DateTime updatedAtUtc,
    required DateTime? deletedAtUtc,
  }) = _GlobalIngredient;
}
