import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_ingredient.freezed.dart';

/// A single ingredient line-item inside a [Product].
///
/// XOR invariant: exactly one of [ingredientId] or [customIngredientName]
/// must be non-null. This mirrors the backend's check constraint and is
/// enforced at the repository/use-case layer.
///
/// No [fromJson]/[toJson] — serialization lives in DTOs (Phase 5).
@freezed
sealed class ProductIngredient with _$ProductIngredient {
  const factory ProductIngredient({
    required String id,
    required String productId,
    required String? ingredientId,
    required String? customIngredientName,
    required double amount,
    required String unit,
    required DateTime updatedAtUtc,
    required DateTime? deletedAtUtc,
  }) = _ProductIngredient;
}
