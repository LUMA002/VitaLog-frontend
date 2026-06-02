import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../app/theme/app_theme.dart';
import '../../../core/l10n/material_locale.dart';
import '../../../domain/models/product.dart';
import '../../../domain/models/product_scope.dart';
import '../../../i18n/strings.g.dart';
import '../../products/presentation/create_product_screen.dart';
import '../application/course_form_controller.dart';
import '../application/course_form_state.dart';

/// Full-screen form for creating (courseId == null) or editing a course.
///
/// Uses [ConsumerStatefulWidget] for the [TextEditingController] lifecycle.
/// All state mutations go through [CourseFormController]; the widget only
/// dispatches events and reads the current form state.
class CourseFormScreen extends ConsumerStatefulWidget {
  const CourseFormScreen({super.key, this.courseId});

  /// null = create mode, non-null = edit mode.
  final String? courseId;

  @override
  ConsumerState<CourseFormScreen> createState() =>
      _CourseFormScreenState();
}

class _CourseFormScreenState extends ConsumerState<CourseFormScreen> {
  late final TextEditingController _servingSizeController;

  @override
  void initState() {
    super.initState();
    _servingSizeController = TextEditingController();
  }

  @override
  void dispose() {
    _servingSizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final formAsync =
        ref.watch(courseFormControllerProvider(widget.courseId));

    // Sync TextEditingController with the form state on load / external change.
    formAsync.whenData((form) {
      if (_servingSizeController.text != form.servingSizeInput) {
        _servingSizeController.value = TextEditingValue(
          text: form.servingSizeInput,
          selection: TextSelection.collapsed(
              offset: form.servingSizeInput.length),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.courseId == null ? t.courses.create : t.courses.edit,
        ),
      ),
      body: formAsync.when(
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (e, _) =>
            Center(child: Text(e.toString())),
        data: (form) => _FormBody(
          form: form,
          servingSizeController: _servingSizeController,
          courseId: widget.courseId,
          onSubmit: () => _submit(context),
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context) async {
    final t = Translations.of(context);
    final saved = await ref
        .read(courseFormControllerProvider(widget.courseId).notifier)
        .submit();
    if (saved && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.check_circle_outline_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(t.courses.savedSuccess),
            ],
          ),
        ),
      );
      context.pop();
    }
  }
}

// ── Form body ─────────────────────────────────────────────────────────────────

class _FormBody extends ConsumerWidget {
  const _FormBody({
    required this.form,
    required this.servingSizeController,
    required this.courseId,
    required this.onSubmit,
  });

  final CourseFormState form;
  final TextEditingController servingSizeController;
  final String? courseId;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // ── Product picker ──────────────────────────────────────────────
        _SectionLabel(label: t.courses.fields.product),
        _ProductPickerTile(courseId: courseId),
        if (form.fieldErrors['product'] != null)
          _FieldError(message: form.fieldErrors['product']!),
        const SizedBox(height: 16),

        // ── Serving size ────────────────────────────────────────────────
        _SectionLabel(label: t.courses.fields.servingSize),
        TextField(
          controller: servingSizeController,
          keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(
                RegExp(r'^\d*\.?\d*')),
          ],
          decoration: InputDecoration(
            hintText: '1.0',
            errorText: form.fieldErrors['servingSize'],
          ),
          onChanged: (v) => ref
              .read(courseFormControllerProvider(courseId).notifier)
              .setServingSize(v),
        ),
        const SizedBox(height: 16),

        // ── Time of day ─────────────────────────────────────────────────
        _SectionLabel(label: t.courses.fields.timeOfDay),
        _TimePickerTile(courseId: courseId),
        const SizedBox(height: 16),

        // ── Start date ──────────────────────────────────────────────────
        _SectionLabel(label: t.courses.fields.startDate),
        _DatePickerTile(courseId: courseId, isEndDate: false),
        const SizedBox(height: 16),

        // ── End date (optional) ─────────────────────────────────────────
        _SectionLabel(label: t.courses.fields.endDate),
        _DatePickerTile(courseId: courseId, isEndDate: true),
        if (form.fieldErrors['endDate'] != null)
          _FieldError(message: form.fieldErrors['endDate']!),
        const SizedBox(height: 16),

        // ── Global submit error ─────────────────────────────────────────
        if (form.fieldErrors['_global'] != null)
          _FieldError(
            message: form.fieldErrors['_global']!,
            isGlobal: true,
          ),
        const SizedBox(height: 8),

        // ── Save button ─────────────────────────────────────────────────
        FilledButton(
          onPressed: form.isSubmitting ? null : onSubmit,
          child: form.isSubmitting
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(t.common.save),
        ),
      ],
    );
  }
}

// ── Product picker tile ───────────────────────────────────────────────────────

class _ProductPickerTile extends ConsumerWidget {
  const _ProductPickerTile({required this.courseId});

  final String? courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final form = ref
        .watch(courseFormControllerProvider(courseId))
        .value;
    final productName = form?.productName ?? '';

    return Card(
      child: ListTile(
        title: Text(
          productName.isEmpty
              ? t.courses.fields.product
              : productName,
          style: TextStyle(
            color: productName.isEmpty ? Theme.of(context).hintColor : null,
          ),
        ),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: () => _showProductPicker(context, ref),
      ),
    );
  }

  void _showProductPicker(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        expand: false,
        builder: (ctx, scrollController) => _ProductListSheet(
          scrollController: scrollController,
          onSelect: (id, name) {
            Navigator.of(ctx).pop();
            ref
                .read(courseFormControllerProvider(courseId).notifier)
                .setProduct(id, name);
          },
        ),
      ),
    );
  }
}

class _ProductListSheet extends ConsumerWidget {
  const _ProductListSheet({
    required this.scrollController,
    required this.onSelect,
  });

  final ScrollController scrollController;
  final void Function(String id, String name) onSelect;

  Future<void> _openCreateProductScreen(
    BuildContext context,
  ) async {
    final product = await Navigator.of(context).push<Product>(
      MaterialPageRoute<Product>(
        fullscreenDialog: true,
        builder: (_) => const CreateProductScreen(),
      ),
    );

    if (!context.mounted || product == null) return;

    // Delegate to the parent's onSelect callback so the course form picks up
    // the newly created product without coupling to courseId from here.
    onSelect(product.id, product.name);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final productsAsync = ref.watch(allProductStreamProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    t.products.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_rounded),
                tooltip: t.products.create,
                onPressed: () => _openCreateProductScreen(context),
              ),
            ],
          ),
        ),
        const Divider(height: 16),
        Expanded(
          child: productsAsync.when(
            loading: () =>
                const Center(child: CircularProgressIndicator()),
            error: (e, _) =>
                Center(child: Text(e.toString())),
            data: (products) => ListView.builder(
              controller: scrollController,
              itemCount: products.length,
              itemBuilder: (_, i) {
                final p = products[i];
                final isCustom = p.isCustomProduct;
                return ListTile(
                  leading: Icon(
                    isCustom
                        ? Icons.person_rounded
                        : Icons.public_rounded,
                  ),
                  title: Text(p.name),
                  subtitle: Text(
                    isCustom ? t.products.custom : t.products.global,
                    style: const TextStyle(fontSize: 12),
                  ),
                  onTap: () => onSelect(p.id, p.name),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

// ── Time picker tile ──────────────────────────────────────────────────────────

class _TimePickerTile extends ConsumerWidget {
  const _TimePickerTile({required this.courseId});

  final String? courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref
        .watch(courseFormControllerProvider(courseId))
        .value;
    final timeOfDay = form?.timeOfDay ?? const Duration(hours: 8);
    final tod = TimeOfDay(
      hour: timeOfDay.inHours % 24,
      minute: timeOfDay.inMinutes % 60,
    );

    return Card(
      child: ListTile(
        leading: const Icon(Icons.access_time_rounded),
        title: Text(tod.format(context)),
        trailing: const Icon(Icons.edit_outlined, size: 18),
        onTap: () async {
          final locale = resolveMaterialLocale();
          final picked = await showTimePicker(
            context: context,
            initialTime: tod,
            builder: (ctx, child) => Localizations.override(
              context: ctx,
              locale: locale,
              child: child!,
            ),
          );
          if (picked != null && context.mounted) {
            ref
                .read(courseFormControllerProvider(courseId).notifier)
                .setTimeOfDay(
                    Duration(hours: picked.hour, minutes: picked.minute));
          }
        },
      ),
    );
  }
}

// ── Date picker tile ──────────────────────────────────────────────────────────

class _DatePickerTile extends ConsumerWidget {
  const _DatePickerTile({
    required this.courseId,
    required this.isEndDate,
  });

  final String? courseId;
  final bool isEndDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final form = ref
        .watch(courseFormControllerProvider(courseId))
        .value;
    final date =
        isEndDate ? form?.endDateUtc : form?.startDateUtc;
    final startDate =
        form?.startDateUtc ?? DateTime.utc(2020);

    final label = date != null
        ? formatDateShort(date.toLocal())
        : (isEndDate ? t.courses.fields.endDate : '—');

    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_today_outlined),
        title: Text(label),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isEndDate && date != null)
              IconButton(
                icon: const Icon(Icons.clear_rounded, size: 18),
                onPressed: () => ref
                    .read(courseFormControllerProvider(courseId)
                        .notifier)
                    .setEndDate(null),
              ),
            const Icon(Icons.edit_outlined, size: 18),
          ],
        ),
        onTap: () async {
          final now = DateTime.now();
          final initial = date ?? now;
          final picked = await showDatePicker(
            context: context,
            locale: resolveMaterialLocale(),
            initialDate: initial,
            firstDate:
                isEndDate ? startDate : DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (picked != null && context.mounted) {
            final utcMidnight =
                DateTime.utc(picked.year, picked.month, picked.day);
            if (isEndDate) {
              ref
                  .read(courseFormControllerProvider(courseId)
                      .notifier)
                  .setEndDate(utcMidnight);
            } else {
              ref
                  .read(courseFormControllerProvider(courseId)
                      .notifier)
                  .setStartDate(utcMidnight);
            }
          }
        },
      ),
    );
  }
}

// ── Helper widgets ────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context)
                  .extension<SemanticColors>()!
                  .pendingText,
            ),
      ),
    );
  }
}

class _FieldError extends StatelessWidget {
  const _FieldError({required this.message, this.isGlobal = false});

  final String message;
  final bool isGlobal;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<SemanticColors>()!;
    return Padding(
      padding: EdgeInsets.only(
        top: isGlobal ? 8 : 4,
        bottom: isGlobal ? 8 : 0,
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 14,
            color: colors.destructive,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              message,
              style:
                  TextStyle(color: colors.destructive, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
