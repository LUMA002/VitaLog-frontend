// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_ingredients_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Fetches active ingredients for [productId], resolving global catalog names.

@ProviderFor(productIngredients)
final productIngredientsProvider = ProductIngredientsFamily._();

/// Fetches active ingredients for [productId], resolving global catalog names.

final class ProductIngredientsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProductIngredientItem>>,
          List<ProductIngredientItem>,
          FutureOr<List<ProductIngredientItem>>
        >
    with
        $FutureModifier<List<ProductIngredientItem>>,
        $FutureProvider<List<ProductIngredientItem>> {
  /// Fetches active ingredients for [productId], resolving global catalog names.
  ProductIngredientsProvider._({
    required ProductIngredientsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productIngredientsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productIngredientsHash();

  @override
  String toString() {
    return r'productIngredientsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ProductIngredientItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProductIngredientItem>> create(Ref ref) {
    final argument = this.argument as String;
    return productIngredients(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductIngredientsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productIngredientsHash() =>
    r'134cffba4d4987c23a0fadd56d03f7d5008bcc67';

/// Fetches active ingredients for [productId], resolving global catalog names.

final class ProductIngredientsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<ProductIngredientItem>>,
          String
        > {
  ProductIngredientsFamily._()
    : super(
        retry: null,
        name: r'productIngredientsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Fetches active ingredients for [productId], resolving global catalog names.

  ProductIngredientsProvider call(String productId) =>
      ProductIngredientsProvider._(argument: productId, from: this);

  @override
  String toString() => r'productIngredientsProvider';
}
