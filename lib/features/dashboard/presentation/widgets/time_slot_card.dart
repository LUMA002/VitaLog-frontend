import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_radii.dart';
import '../../../../app/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../../../products/presentation/widgets/product_ingredients_bottom_sheet.dart';
import '../../application/scheduled_intake.dart';

/// Displays a single scheduled supplement intake slot on the Dashboard.
///
/// Visual state:
/// - **Pending** → primary accent ring, pendingText colour.
/// - **Taken**   → muted background, completedText colour + taken timestamp.
///
/// Tapping a pending card logs the intake.
/// Tapping a taken card un-logs (soft-deletes) it.
class TimeSlotCard extends StatelessWidget {
  const TimeSlotCard({
    super.key,
    required this.intake,
    required this.onLog,
    required this.onUnlog,
  });

  final ScheduledIntake intake;
  final VoidCallback onLog;
  final VoidCallback onUnlog;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final colors = Theme.of(context).extension<SemanticColors>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final timeLabel = _formatTimeOfDay(context, intake.timeOfDay);

    final cardColor =
        intake.isTaken ? colors.completed : colorScheme.surface;
    final textColor =
        intake.isTaken ? colors.completedText : colorScheme.onSurface;
    final subColor =
        intake.isTaken ? colors.completedText : colors.pendingText;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        color: cardColor,
        child: InkWell(
          onTap: intake.isTaken ? onUnlog : onLog,
          borderRadius: const BorderRadius.all(AppRadii.card),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                _StatusDot(isTaken: intake.isTaken),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              intake.productName,
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.info_outline,
                              size: 20,
                              color: subColor,
                            ),
                            tooltip: t.products.ingredientsTitle,
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 32,
                              minHeight: 32,
                            ),
                            onPressed: () => ProductIngredientsBottomSheet.show(
                              context,
                              productId: intake.productId,
                              productName: intake.productName,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${_servingLabel(intake.servingSize)} · $timeLabel',
                        style: TextStyle(color: subColor, fontSize: 13),
                      ),
                      if (intake.isTaken && intake.takenAtUtc != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            t.dashboard.takenAt(
                              time: _formatTakenAt(
                                context,
                                intake.takenAtUtc!,
                              ),
                            ),
                            style: TextStyle(
                              color: colors.completedText,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _TimeBadge(
                  label: timeLabel,
                  isTaken: intake.isTaken,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _servingLabel(double size) {
    final formatted = size == size.truncateToDouble()
        ? size.toInt().toString()
        : size.toString();
    return '${formatted}x';
  }

  String _formatTimeOfDay(BuildContext context, Duration d) {
    final tod = TimeOfDay(hour: d.inHours % 24, minute: d.inMinutes % 60);
    return tod.format(context);
  }

  String _formatTakenAt(BuildContext context, DateTime utc) {
    final local = utc.toLocal();
    final tod = TimeOfDay(hour: local.hour, minute: local.minute);
    return tod.format(context);
  }
}

// ── Private sub-widgets ───────────────────────────────────────────────────────

class _StatusDot extends StatelessWidget {
  const _StatusDot({required this.isTaken});

  final bool isTaken;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<SemanticColors>()!;
    final colorScheme = Theme.of(context).colorScheme;

    if (isTaken) {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: colors.completed,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.check_rounded,
          size: 18,
          color: colors.completedText,
        ),
      );
    }

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: colorScheme.primary,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.primaryGlow,
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Icon(
        Icons.medication_outlined,
        size: 16,
        color: colorScheme.primary,
      ),
    );
  }
}

class _TimeBadge extends StatelessWidget {
  const _TimeBadge({required this.label, required this.isTaken});

  final String label;
  final bool isTaken;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<SemanticColors>()!;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isTaken ? colors.completed : colors.primaryGlow,
        borderRadius: const BorderRadius.all(AppRadii.pill),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isTaken ? colors.completedText : colorScheme.primary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Reusable empty-state widget used across multiple screens.
class EmptyStateView extends StatelessWidget {
  const EmptyStateView({
    super.key,
    required this.message,
    this.icon = Icons.inbox_outlined,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<SemanticColors>()!;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 56, color: AppColors.mutedForeground),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(color: colors.pendingText, fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Reusable error-state widget used across multiple screens.
class ErrorStateView extends StatelessWidget {
  const ErrorStateView({
    super.key,
    required this.message,
    this.onRetry,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<SemanticColors>()!;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 48,
            color: colors.destructive,
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: TextStyle(color: colors.pendingText),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 16),
            FilledButton.tonal(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ],
      ),
    );
  }
}
