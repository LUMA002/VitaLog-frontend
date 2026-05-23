import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/l10n/material_locale.dart';
import '../../../../app/theme/app_radii.dart';
import '../../../../app/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../../../courses/application/courses_controller.dart';
import '../../../products/presentation/widgets/product_ingredients_bottom_sheet.dart';

/// A swipe-to-delete tile displaying a [CourseItem] in the Courses list.
///
/// Shows the product name, time-of-day, serving size, and date range.
/// Swiping right → left triggers soft-deletion via [onDelete].
/// Tapping opens the edit form via [onEdit].
class CourseTile extends StatelessWidget {
  const CourseTile({
    super.key,
    required this.item,
    required this.onEdit,
    required this.onDelete,
  });

  final CourseItem item;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final colors = Theme.of(context).extension<SemanticColors>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final timeLabel = _formatTimeOfDay(context, item.course.timeOfDay);
    final dateRange = _formatDateRange(item.course.startDateUtc,
        item.course.endDateUtc);

    return Dismissible(
      key: Key('course-${item.course.id}'),
      direction: DismissDirection.endToStart,
      background: _DeleteBackground(),
      confirmDismiss: (_) async {
        return await _showDeleteConfirm(context);
      },
      onDismissed: (_) => onDelete(),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: InkWell(
          onTap: onEdit,
          borderRadius: const BorderRadius.all(AppRadii.card),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TimeIndicator(timeLabel: timeLabel),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.productName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.info_outline, size: 20),
                            tooltip: t.products.ingredientsTitle,
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 32,
                              minHeight: 32,
                            ),
                            onPressed: () => ProductIngredientsBottomSheet.show(
                              context,
                              productId: item.course.productId,
                              productName: item.productName,
                            ),
                          ),
                          const SizedBox(width: 6),
                          _ProductBadge(
                            label: item.isGlobalProduct
                                ? t.products.global
                                : t.products.custom,
                            isGlobal: item.isGlobalProduct,
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${_servingLabel(item.course.servingSize, t)}  ·  $dateRange',
                        style: TextStyle(
                          color: colors.pendingText,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: colorScheme.onSurface.withAlpha(0x66),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _showDeleteConfirm(BuildContext context) async {
    final t = Translations.of(context);
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.common.confirm),
        content: Text(t.courses.deleteConfirmContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(t.common.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(t.common.delete),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  String _servingLabel(double size, Translations t) {
    final s = size == size.truncateToDouble()
        ? size.toInt().toString()
        : size.toStringAsFixed(1);
    return '$s ${size == 1 ? t.courses.serving : t.courses.servings}';
  }

  String _formatTimeOfDay(BuildContext context, Duration d) {
    return TimeOfDay(
      hour: d.inHours % 24,
      minute: d.inMinutes % 60,
    ).format(context);
  }

  String _formatDateRange(DateTime start, DateTime? end) {
    final fmt = DateFormat.MMMd(resolveMaterialLocale().toString());
    final startStr = fmt.format(start.toLocal());
    if (end == null) return '$startStr →';
    return '$startStr – ${fmt.format(end.toLocal())}';
  }
}

class _TimeIndicator extends StatelessWidget {
  const _TimeIndicator({required this.timeLabel});

  final String timeLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 52,
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.primary.withAlpha(0x1A),
        borderRadius: const BorderRadius.all(AppRadii.r),
      ),
      child: Text(
        timeLabel,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: colorScheme.primary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ProductBadge extends StatelessWidget {
  const _ProductBadge({required this.label, required this.isGlobal});

  final String label;
  final bool isGlobal;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: isGlobal
            ? colorScheme.primary.withAlpha(0x22)
            : AppColors.secondary,
        borderRadius: const BorderRadius.all(AppRadii.pill),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isGlobal ? colorScheme.primary : AppColors.secondaryForeground,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _DeleteBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: const BoxDecoration(
        color: AppColors.destructive,
        borderRadius: BorderRadius.all(AppRadii.card),
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      child: const Icon(
        Icons.delete_outline_rounded,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
