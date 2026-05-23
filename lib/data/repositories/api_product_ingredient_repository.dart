import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../../domain/models/product_ingredient.dart';
import '../../domain/repositories/i_product_ingredient_repository.dart';

/// Thin-client (Web/Desktop) implementation of [IProductIngredientRepository].
///
/// Stub — to be implemented in Phase 6 (Web/Thin client).
final class ApiProductIngredientRepository
    implements IProductIngredientRepository {
  const ApiProductIngredientRepository();

  @override
  Stream<List<ProductIngredient>> watchForProduct(String productId) =>
      throw UnimplementedError(
        'ApiProductIngredientRepository is not yet implemented.',
      );

  @override
  Future<List<ProductIngredient>> getForProduct(String productId) =>
      throw UnimplementedError(
        'ApiProductIngredientRepository is not yet implemented.',
      );

  @override
  Future<Result<Unit, AppFailure>> upsert(ProductIngredient ingredient) =>
      throw UnimplementedError(
        'ApiProductIngredientRepository is not yet implemented.',
      );

  @override
  Future<Result<Unit, AppFailure>> softDelete(String id, DateTime nowUtc) =>
      throw UnimplementedError(
        'ApiProductIngredientRepository is not yet implemented.',
      );
}
