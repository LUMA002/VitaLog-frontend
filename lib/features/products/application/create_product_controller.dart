import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../domain/models/product.dart';
import '../../../i18n/strings.g.dart';
import '../../auth/application/auth_controller.dart';
import 'create_product_state.dart';

part 'create_product_controller.g.dart';

@riverpod
class CreateProductController extends _$CreateProductController {
  @override
  CreateProductState build() => const CreateProductState();

  void addIngredient(IngredientFormEntry entry) =>
      state = state.copyWith(ingredients: [...state.ingredients, entry]);

  void removeIngredient(int index) {
    final updated = [...state.ingredients]..removeAt(index);
    state = state.copyWith(ingredients: updated);
  }

  // ── Submit ─────────────────────────────────────────────────────────────────

  /// Validates the form, writes to the local DB inside a transaction, and
  /// returns the newly created [Product] on success, or `null` on failure.
  Future<Product?> submit({
    required String name,
    String? description,
  }) async {
    final trimmedName = name.trim();
    final trimmedDescription = description?.trim();

    if (trimmedName.isEmpty) {
      state = state.copyWith(nameError: t.validation.nameRequired);
      return null;
    }

    state = state.copyWith(isSubmitting: true, nameError: null);

    try {
      final clock = ref.read(clockProvider);
      final nowUtc = clock.nowUtc();
      final authState = ref.read(authControllerProvider).value;
      final userId = switch (authState) {
        Authenticated(:final userId) => userId,
        _ => null,
      };

      final dao = ref.read(productsDaoProvider);
      final entity = await dao.createProductWithIngredients(
        name: trimmedName,
        description:
            trimmedDescription?.isEmpty == true ? null : trimmedDescription,
        userId: userId,
        ingredients: state.ingredients,
        nowUtc: nowUtc,
      );

      // Map Drift entity → domain model (no Drift types crossing the boundary).
      return Product(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        creatorUserId: entity.creatorUserId,
        isLocalDraft: entity.isLocalDraft == 1,
        updatedAtUtc: entity.updatedAt,
        deletedAtUtc: entity.deletedAt,
      );
    } catch (e) {
      state = state.copyWith(isSubmitting: false, nameError: e.toString());
      return null;
    }
  }
}
