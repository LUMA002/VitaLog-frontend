import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/global_ingredient.dart';

part 'create_product_state.freezed.dart';

/// A single ingredient row being built inside the "Create Product" form.
///
/// XOR rule (enforced by the DAO layer and the DB check constraint):
///   - [globalIngredient] non-null → references the catalog; [customName] must be null.
///   - [customName] non-null      → free-text entry; [globalIngredient] must be null.
@freezed
sealed class IngredientFormEntry with _$IngredientFormEntry {
  const factory IngredientFormEntry({
    GlobalIngredient? globalIngredient,
    String? customName,
    required double amount,
    required String unit,
  }) = _IngredientFormEntry;
}

/// Immutable UI state for the "Create Product" full-screen form.
///
/// Name and description live in [TextEditingController]s on the screen so
/// keystrokes do not rebuild the widget tree (avoids Windows keyboard glitches).
@freezed
sealed class CreateProductState with _$CreateProductState {
  const factory CreateProductState({
    @Default([]) List<IngredientFormEntry> ingredients,
    @Default(false) bool isSubmitting,
    String? nameError,
  }) = _CreateProductState;
}
