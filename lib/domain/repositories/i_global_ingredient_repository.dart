import '../models/global_ingredient.dart';

/// Thick/Thin chokepoint for the server-seeded ingredient catalog.
///
/// This repository is read-only from the app's perspective. Writes occur
/// exclusively through the sync pull path (SyncEngine).
abstract interface class IGlobalIngredientRepository {
  /// Reactive stream of all active global ingredients.
  Stream<List<GlobalIngredient>> watchAll();

  /// Returns a single ingredient by [id], or null if not found.
  Future<GlobalIngredient?> getById(String id);
}
