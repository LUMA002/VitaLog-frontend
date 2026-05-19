import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../../data/local/daos/products_dao.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/i_product_repository.dart';
import 'mappers/product_mapper.dart';

/// Drift (SQLite) implementation of [IProductRepository].
final class DriftProductRepository implements IProductRepository {
  const DriftProductRepository(this._dao);

  final ProductsDao _dao;

  @override
  Stream<List<Product>> watchAll() {
    return _dao.watchAll().map(
      (rows) =>
          rows
              .where((r) => r.deletedAt == null)
              .map((r) => r.toDomain())
              .toList(),
    );
  }

  @override
  Future<Product?> getById(String id) async {
    final row = await _dao.getById(id);
    return row?.toDomain();
  }

  @override
  Future<Result<Unit, AppFailure>> upsert(Product product) async {
    try {
      await _dao.upsertBatch([product.toDrift(pendingSync: 1)]);
      return const Success(Unit.instance);
    } catch (e) {
      return Failure(DbFailure(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Result<Unit, AppFailure>> softDelete(
    String id,
    DateTime nowUtc,
  ) async {
    try {
      final existing = await _dao.getById(id);
      if (existing == null) {
        return const Failure(DbFailure(message: 'Product not found.'));
      }
      final updated = existing.toDomain().copyWith(
        deletedAtUtc: nowUtc,
        updatedAtUtc: nowUtc,
      );
      await _dao.upsertBatch([updated.toDrift(pendingSync: 1)]);
      return const Success(Unit.instance);
    } catch (e) {
      return Failure(DbFailure(message: e.toString(), cause: e));
    }
  }
}
