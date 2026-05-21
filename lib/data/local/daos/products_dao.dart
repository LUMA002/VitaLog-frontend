import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/product_ingredients_table.dart';
import '../tables/products_table.dart';

part 'products_dao.g.dart';

/// Data access for [Products] and their [ProductIngredients].
///
/// Exposes stream-based reactive queries and bulk write helpers for sync.
/// No business logic lives here — that belongs in repositories (Phase 3).
@DriftAccessor(tables: [Products, ProductIngredients])
class ProductsDao extends DatabaseAccessor<AppDatabase>
    with _$ProductsDaoMixin {
  ProductsDao(super.db);

  // ─── Products ────────────────────────────────────────────────────────────

  /// Reactive stream of all products (including soft-deleted — filter in repo).
  Stream<List<ProductsData>> watchAll() => select(products).watch();

  /// Single product by UUID. Returns null if not found.
  Future<ProductsData?> getById(String id) =>
      (select(products)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Rows awaiting push to the server (`pendingSync = 1`), oldest first.
  Future<List<ProductsData>> getPendingSync() =>
      (select(products)
            ..where((t) => t.pendingSync.equals(1))
            ..orderBy([(t) => OrderingTerm.asc(t.updatedAt)]))
          .get();

  /// Insert or replace a batch of products (used by sync pull & local writes).
  Future<void> upsertBatch(List<ProductsCompanion> rows) =>
      batch((b) => b.insertAllOnConflictUpdate(products, rows));

  /// Stamps guest draft products with [userId] and marks them for sync.
  Future<int> claimGuestDraftProducts(String userId) => (update(products)
        ..where(
          (t) => t.creatorUserId.isNull() & t.isLocalDraft.equals(1),
        ))
      .write(
        ProductsCompanion(
          creatorUserId: Value(userId),
          pendingSync: const Value(1),
        ),
      );

  /// Hard-deletes local draft products created by [userId] (logout erase).
  Future<int> deleteLocalDraftsForUser(String userId) => (delete(products)
        ..where(
          (t) =>
              t.creatorUserId.equals(userId) & t.isLocalDraft.equals(1),
        ))
      .go();

  // ─── ProductIngredients ───────────────────────────────────────────────────

  /// All ingredient rows for a given product.
  Stream<List<ProductIngredientsData>> watchForProduct(String productId) =>
      (select(productIngredients)
            ..where((t) => t.productId.equals(productId)))
          .watch();

  /// Single product ingredient by UUID. Returns null if not found.
  Future<ProductIngredientsData?> getIngredientById(String id) =>
      (select(productIngredients)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  /// Ingredient rows awaiting push, oldest first.
  Future<List<ProductIngredientsData>> getPendingIngredientSync() =>
      (select(productIngredients)
            ..where((t) => t.pendingSync.equals(1))
            ..orderBy([(t) => OrderingTerm.asc(t.updatedAt)]))
          .get();

  /// Insert or replace a batch of product ingredients.
  Future<void> upsertIngredientBatch(
    List<ProductIngredientsCompanion> rows,
  ) =>
      batch((b) => b.insertAllOnConflictUpdate(productIngredients, rows));
}
