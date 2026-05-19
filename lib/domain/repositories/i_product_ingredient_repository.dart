import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../models/product_ingredient.dart';

/// Thick/Thin chokepoint for product ingredient data access.
abstract interface class IProductIngredientRepository {
  /// Reactive stream of all active ingredients for [productId].
  Stream<List<ProductIngredient>> watchForProduct(String productId);

  /// Persists [ingredient] locally and marks it as pending sync.
  Future<Result<Unit, AppFailure>> upsert(ProductIngredient ingredient);

  /// Soft-deletes the ingredient with [id] by setting [deletedAt] to [nowUtc].
  Future<Result<Unit, AppFailure>> softDelete(String id, DateTime nowUtc);
}
