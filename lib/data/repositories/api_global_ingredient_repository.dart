import '../../domain/models/global_ingredient.dart';
import '../../domain/repositories/i_global_ingredient_repository.dart';

/// Thin-client (Web/Desktop) implementation of [IGlobalIngredientRepository].
///
/// Stub — to be implemented in Phase 6 (Web/Thin client).
final class ApiGlobalIngredientRepository
    implements IGlobalIngredientRepository {
  const ApiGlobalIngredientRepository();

  @override
  Stream<List<GlobalIngredient>> watchAll() =>
      throw UnimplementedError(
        'ApiGlobalIngredientRepository is not yet implemented.',
      );

  @override
  Future<GlobalIngredient?> getById(String id) =>
      throw UnimplementedError(
        'ApiGlobalIngredientRepository is not yet implemented.',
      );

  @override
  Future<List<GlobalIngredient>> search(String query) =>
      throw UnimplementedError(
        'ApiGlobalIngredientRepository is not yet implemented.',
      );
}
