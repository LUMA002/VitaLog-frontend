import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../app/theme/app_theme.dart';
import '../../../domain/models/global_ingredient.dart';
import '../../../domain/models/product.dart';
import '../../../i18n/strings.g.dart';
import '../application/create_product_controller.dart';
import '../application/create_product_state.dart';

/// Full-screen form for creating a custom product with relational ingredients.
///
/// Pop result is [Product] on success so the caller (Course Form) can
/// auto-select it without re-querying.
class CreateProductScreen extends ConsumerStatefulWidget {
  const CreateProductScreen({super.key});

  @override
  ConsumerState<CreateProductScreen> createState() =>
      _CreateProductScreenState();
}

class _CreateProductScreenState extends ConsumerState<CreateProductScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final product = await ref
        .read(createProductControllerProvider.notifier)
        .submit(
          name: _nameController.text,
          description: _descriptionController.text,
        );
    if (product != null && mounted) {
      Navigator.of(context).pop(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final isSubmitting = ref.watch(
      createProductControllerProvider.select((s) => s.isSubmitting),
    );
    final nameError = ref.watch(
      createProductControllerProvider.select((s) => s.nameError),
    );
    final ingredients = ref.watch(
      createProductControllerProvider.select((s) => s.ingredients),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(t.products.createTitle),
        actions: [
          TextButton(
            onPressed: isSubmitting ? null : _save,
            child: Text(t.common.save),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
        children: [
          // ── Name ──────────────────────────────────────────────────────────
          TextField(
            controller: _nameController,
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText: t.products.nameLabel,
              errorText: nameError,
            ),
          ),
          const SizedBox(height: 12),

          // ── Description ───────────────────────────────────────────────────
          TextField(
            controller: _descriptionController,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: t.products.descriptionLabel,
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 24),

          // ── Ingredients section ───────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: Text(
                  t.products.addIngredient,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context)
                            .extension<SemanticColors>()!
                            .pendingText,
                      ),
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () => _showIngredientSheet(context),
                icon: const Icon(Icons.add_rounded, size: 18),
                label: Text(t.products.addIngredient),
              ),
            ],
          ),
          const SizedBox(height: 8),

          if (ingredients.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  t.products.noIngredients,
                  style: TextStyle(color: Theme.of(context).hintColor),
                ),
              ),
            )
          else
            ...ingredients.asMap().entries.map(
              (e) => _IngredientTile(
                entry: e.value,
                onRemove: () => ref
                    .read(createProductControllerProvider.notifier)
                    .removeIngredient(e.key),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: isSubmitting ? null : _save,
        icon: isSubmitting
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.check_rounded),
        label: Text(t.products.saveProduct),
      ),
    );
  }

  void _showIngredientSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _IngredientSearchSheet(
        onAdd: (entry) =>
            ref.read(createProductControllerProvider.notifier).addIngredient(entry),
      ),
    );
  }
}

// ── Ingredient tile ───────────────────────────────────────────────────────────

class _IngredientTile extends StatelessWidget {
  const _IngredientTile({required this.entry, required this.onRemove});

  final IngredientFormEntry entry;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final name = entry.globalIngredient?.name ?? entry.customName ?? '';
    final isCustom = entry.globalIngredient == null;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          isCustom ? Icons.edit_note_rounded : Icons.science_outlined,
          size: 20,
        ),
        title: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(
          '${_formatAmount(entry.amount)} ${entry.unit}',
          style: const TextStyle(fontSize: 12),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline_rounded, size: 20),
          onPressed: onRemove,
          color: Theme.of(context).extension<SemanticColors>()!.destructive,
        ),
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
      ),
    );
  }

  String _formatAmount(double v) =>
      v == v.truncateToDouble() ? v.toInt().toString() : v.toStringAsFixed(1);
}

// ── Ingredient search bottom sheet ────────────────────────────────────────────

class _IngredientSearchSheet extends ConsumerStatefulWidget {
  const _IngredientSearchSheet({required this.onAdd});

  final ValueChanged<IngredientFormEntry> onAdd;

  @override
  ConsumerState<_IngredientSearchSheet> createState() =>
      _IngredientSearchSheetState();
}

class _IngredientSearchSheetState
    extends ConsumerState<_IngredientSearchSheet> {
  final _searchController = TextEditingController();
  List<GlobalIngredient> _results = [];
  Timer? _debounce;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onQueryChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onQueryChanged() {
    _debounce?.cancel();
    _debounce =
        Timer(const Duration(milliseconds: 300), _runSearch);
  }

  Future<void> _runSearch() async {
    if (!mounted) return;
    setState(() => _isLoading = true);
    try {
      final query = _searchController.text.trim();
      final results =
          await ref.read(globalIngredientRepositoryProvider).search(query);
      if (mounted) setState(() => _results = results);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _pickGlobal(BuildContext context, GlobalIngredient ingredient) {
    _showAmountDialog(
      context: context,
      suggestedUnit: ingredient.defaultUnit,
      onConfirm: (amount, unit) {
        widget.onAdd(
          IngredientFormEntry(
            globalIngredient: ingredient,
            customName: null,
            amount: amount,
            unit: unit,
          ),
        );
        Navigator.of(context).pop();
      },
    );
  }

  void _pickCustom(BuildContext context, String customName) {
    _showAmountDialog(
      context: context,
      suggestedUnit: '',
      onConfirm: (amount, unit) {
        widget.onAdd(
          IngredientFormEntry(
            globalIngredient: null,
            customName: customName,
            amount: amount,
            unit: unit,
          ),
        );
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final query = _searchController.text.trim();

    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.45,
      maxChildSize: 0.92,
      expand: false,
      builder: (ctx, scrollController) => Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: t.products.ingredientSearchHint,
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      )
                    : null,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              children: [
                if (query.isNotEmpty)
                  ListTile(
                    leading: const Icon(Icons.add_circle_outline_rounded),
                    title: Text(
                      t.products.addCustomIngredient(query: query),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    onTap: () => _pickCustom(context, query),
                  ),
                if (query.isNotEmpty && _results.isNotEmpty)
                  const Divider(height: 1),
                ..._results.map(
                  (ingredient) => ListTile(
                    leading: const Icon(Icons.science_outlined),
                    title: Text(ingredient.name),
                    subtitle: Text(
                      ingredient.defaultUnit,
                      style: const TextStyle(fontSize: 12),
                    ),
                    onTap: () => _pickGlobal(context, ingredient),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showAmountDialog({
    required BuildContext context,
    required String suggestedUnit,
    required void Function(double amount, String unit) onConfirm,
  }) {
    final t = Translations.of(context);
    final amountCtrl = TextEditingController();
    final unitCtrl = TextEditingController(text: suggestedUnit);

    return showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.products.addIngredient),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: amountCtrl,
              autofocus: true,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              decoration: InputDecoration(labelText: t.products.amountLabel),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: unitCtrl,
              decoration:
                  InputDecoration(labelText: t.products.unitLabel),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(t.common.cancel),
          ),
          FilledButton(
            onPressed: () {
              final amount = double.tryParse(amountCtrl.text);
              final unit = unitCtrl.text.trim();
              if (amount == null || amount <= 0 || unit.isEmpty) return;
              Navigator.of(ctx).pop();
              onConfirm(amount, unit);
            },
            child: Text(t.common.confirm),
          ),
        ],
      ),
    );
  }
}
