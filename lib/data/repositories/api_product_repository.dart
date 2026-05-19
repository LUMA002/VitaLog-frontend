import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/i_product_repository.dart';

/// Thin-client (Web/Desktop) implementation of [IProductRepository].
///
/// Stub — to be implemented in Phase 6 (Web/Thin client).
final class ApiProductRepository implements IProductRepository {
  const ApiProductRepository();

  @override
  Stream<List<Product>> watchAll() =>
      throw UnimplementedError('ApiProductRepository is not yet implemented.');

  @override
  Future<Product?> getById(String id) =>
      throw UnimplementedError('ApiProductRepository is not yet implemented.');

  @override
  Future<Result<Unit, AppFailure>> upsert(Product product) =>
      throw UnimplementedError('ApiProductRepository is not yet implemented.');

  @override
  Future<Result<Unit, AppFailure>> softDelete(String id, DateTime nowUtc) =>
      throw UnimplementedError('ApiProductRepository is not yet implemented.');
}
