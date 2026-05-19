import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../models/product.dart';

/// Thick/Thin chokepoint for product data access.
abstract interface class IProductRepository {
  /// Reactive stream of all products (active and soft-deleted excluded by repo).
  Stream<List<Product>> watchAll();

  /// Returns a single product by [id], or null if not found.
  Future<Product?> getById(String id);

  /// Persists [product] locally and marks it as pending sync.
  Future<Result<Unit, AppFailure>> upsert(Product product);

  /// Soft-deletes the product with [id] by setting [deletedAt] to [nowUtc].
  Future<Result<Unit, AppFailure>> softDelete(String id, DateTime nowUtc);
}
