import '../../data/local/daos/global_ingredients_dao.dart';
import '../../domain/models/global_ingredient.dart';
import '../../domain/repositories/i_global_ingredient_repository.dart';
import 'mappers/global_ingredient_mapper.dart';

/// Drift (SQLite) implementation of [IGlobalIngredientRepository].
///
/// This repository is intentionally read-only from the app's perspective.
/// Writes to this table happen exclusively via the SyncEngine (Phase 5).
final class DriftGlobalIngredientRepository
    implements IGlobalIngredientRepository {
  const DriftGlobalIngredientRepository(this._dao);

  final GlobalIngredientsDao _dao;

  @override
  Stream<List<GlobalIngredient>> watchAll() {
    return _dao.watchAll().map(
      (rows) =>
          rows
              .where((r) => r.deletedAt == null)
              .map((r) => r.toDomain())
              .toList(),
    );
  }

  @override
  Future<GlobalIngredient?> getById(String id) async {
    final row = await _dao.getById(id);
    return row?.toDomain();
  }
}
