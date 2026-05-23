import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../../data/local/daos/products_dao.dart';
import '../../domain/models/product_ingredient.dart';
import '../../domain/repositories/i_product_ingredient_repository.dart';
import 'mappers/product_ingredient_mapper.dart';

/// Drift (SQLite) implementation of [IProductIngredientRepository].
final class DriftProductIngredientRepository
    implements IProductIngredientRepository {
  const DriftProductIngredientRepository(this._dao);

  final ProductsDao _dao;

  @override
  Stream<List<ProductIngredient>> watchForProduct(String productId) {
    return _dao.watchForProduct(productId).map(
      (rows) =>
          rows
              .where((r) => r.deletedAt == null)
              .map((r) => r.toDomain())
              .toList(),
    );
  }

  @override
  Future<List<ProductIngredient>> getForProduct(String productId) async {
    final rows = await _dao.getIngredientsForProduct(productId);
    return rows.map((r) => r.toDomain()).toList();
  }

  @override
  Future<Result<Unit, AppFailure>> upsert(ProductIngredient ingredient) async {
    try {
      await _dao.upsertIngredientBatch([ingredient.toDrift(pendingSync: 1)]);
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
      final existing = await _dao.getIngredientById(id);
      if (existing == null) {
        return const Failure(DbFailure(message: 'ProductIngredient not found.'));
      }
      final updated = existing.toDomain().copyWith(
        deletedAtUtc: nowUtc,
        updatedAtUtc: nowUtc,
      );
      await _dao.upsertIngredientBatch([updated.toDrift(pendingSync: 1)]);
      return const Success(Unit.instance);
    } catch (e) {
      return Failure(DbFailure(message: e.toString(), cause: e));
    }
  }
}
