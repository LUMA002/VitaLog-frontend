import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../app/theme/app_theme.dart';
import '../../../../domain/models/intake_log.dart';
import '../../../../i18n/strings.g.dart';

/// A swipe-to-delete tile for a single [IntakeLog] entry.
///
/// Swiping from right to left reveals the destructive delete action.
/// A confirmation dialog is shown before the actual deletion occurs.
class IntakeLogTile extends StatelessWidget {
  const IntakeLogTile({
    super.key,
    required this.log,
    required this.productName,
    required this.onDelete,
  });

  final IntakeLog log;
  final String productName;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<SemanticColors>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final local = log.takenAtUtc.toLocal();
    final timeLabel = TimeOfDay(
      hour: local.hour,
      minute: local.minute,
    ).format(context);
    final dateLabel = DateFormat.yMMMd().format(local);

    return Dismissible(
      key: Key('intake-${log.id}'),
      direction: DismissDirection.endToStart,
      background: const _DeleteBackground(),
      confirmDismiss: (_) => showDialog<bool>(
        context: context,
        builder: (ctx) {
          final dt = Translations.of(ctx);
          return AlertDialog(
            title: Text(dt.logs.deleteConfirmTitle),
            content: Text(dt.logs.deleteConfirmContent),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: Text(dt.common.cancel),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(ctx).colorScheme.error,
                ),
                onPressed: () => Navigator.of(ctx).pop(true),
                child: Text(dt.common.delete),
              ),
            ],
          );
        },
      ),
      onDismissed: (_) => onDelete(),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: colorScheme.primary.withAlpha(0x1A),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.medication_rounded,
            color: colorScheme.primary,
            size: 20,
          ),
        ),
        title: Text(
          productName,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '$dateLabel · $timeLabel',
          style: TextStyle(color: colors.pendingText, fontSize: 13),
        ),
        trailing: Text(
          '${log.actualServingSize}x',
          style: TextStyle(
            color: colors.pendingText,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _DeleteBackground extends StatelessWidget {
  const _DeleteBackground();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<SemanticColors>()!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            colors.destructive.withAlpha(0x00),
            colors.destructive,
          ],
        ),
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
