import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_theme.dart';
import '../../../../domain/models/intake_log.dart';

/// A swipe-to-delete tile for a single [IntakeLog] entry.
///
/// Swiping from right to left reveals the destructive delete action.
/// The actual soft-deletion is triggered via [onDelete].
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
      background: _DeleteBackground(),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.destructive,
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
