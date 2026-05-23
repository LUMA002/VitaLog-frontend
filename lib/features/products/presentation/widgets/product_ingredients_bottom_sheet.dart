import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_radii.dart';
import '../../../../app/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../../application/product_ingredients_provider.dart';

/// Read-only bottom sheet listing a product's ingredient composition.
class ProductIngredientsBottomSheet extends ConsumerWidget {
  const ProductIngredientsBottomSheet({
    super.key,
    required this.productId,
    required this.productName,
  });

  final String productId;
  final String productName;

  static void show(
    BuildContext context, {
    required String productId,
    required String productName,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => ProductIngredientsBottomSheet(
        productId: productId,
        productName: productName,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final colors = Theme.of(context).extension<SemanticColors>()!;
    final ingredientsAsync = ref.watch(productIngredientsProvider(productId));

    return DraggableScrollableSheet(
      initialChildSize: 0.45,
      minChildSize: 0.3,
      maxChildSize: 0.85,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: colors.pendingText.withAlpha(0x55),
                  borderRadius: const BorderRadius.all(AppRadii.pill),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.products.ingredientsTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    productName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colors.pendingText,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ingredientsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      error.toString(),
                      style: TextStyle(color: colors.pendingText),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                data: (ingredients) {
                  if (ingredients.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          t.products.noSpecificIngredients,
                          style: TextStyle(color: colors.pendingText),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    controller: scrollController,
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                    itemCount: ingredients.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 8),
                    itemBuilder: (_, index) {
                      final item = ingredients[index];
                      return _IngredientRow(item: item);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _IngredientRow extends StatelessWidget {
  const _IngredientRow({required this.item});

  final ProductIngredientItem item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<SemanticColors>()!;

    return Card(
      child: ListTile(
        leading: const Icon(Icons.science_outlined, size: 20),
        title: Text(
          item.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${_formatAmount(item.amount)} ${item.unit}',
          style: TextStyle(color: colors.pendingText, fontSize: 13),
        ),
      ),
    );
  }

  String _formatAmount(double value) =>
      value == value.truncateToDouble()
          ? value.toInt().toString()
          : value.toStringAsFixed(1);
}
