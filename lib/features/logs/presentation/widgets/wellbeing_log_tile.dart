import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_theme.dart';
import '../../../../domain/models/wellbeing_log.dart';
import '../../../../i18n/strings.g.dart';

/// A swipe-to-delete tile for a single [WellbeingLog] entry.
///
/// Wellbeing logs are local-only — swiping triggers a hard delete.
class WellbeingLogTile extends StatelessWidget {
  const WellbeingLogTile({
    super.key,
    required this.log,
    required this.onDelete,
  });

  final WellbeingLog log;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final colors = Theme.of(context).extension<SemanticColors>()!;
    final recordedLocal = log.recordedAtUtc.toLocal();
    final dateLabel = DateFormat.yMMMd().format(recordedLocal);
    final timeLabel = DateFormat.jm().format(recordedLocal);

    return Dismissible(
      key: Key('wellbeing-${log.id}'),
      direction: DismissDirection.endToStart,
      background: _DeleteBackground(),
      onDismissed: (_) => onDelete(),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: _MoodEnergy(mood: log.mood, energy: log.energy),
        title: Text(
          '$dateLabel · $timeLabel',
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${t.wellbeing.mood} ${_dots(log.mood)}  '
              '${t.wellbeing.energy} ${_dots(log.energy)}',
              style: TextStyle(color: colors.pendingText, fontSize: 13),
            ),
            if (log.sleepHours != null)
              Text(
                '${t.wellbeing.sleep}: '
                '${t.wellbeing.sleepValue(value: log.sleepHours!.toStringAsFixed(1))}',
                style: TextStyle(color: colors.pendingText, fontSize: 12),
              ),
            if (log.notes != null && log.notes!.isNotEmpty)
              Text(
                log.notes!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colors.pendingText, fontSize: 12),
              ),
          ],
        ),
        isThreeLine: log.sleepHours != null ||
            (log.notes != null && log.notes!.isNotEmpty),
      ),
    );
  }

  String _dots(int value) => '●' * value + '○' * (5 - value);
}

class _MoodEnergy extends StatelessWidget {
  const _MoodEnergy({required this.mood, required this.energy});

  final int mood;
  final int energy;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: colorScheme.primary.withAlpha(0x1A),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          _moodEmoji(mood),
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  String _moodEmoji(int mood) => switch (mood) {
        1 => '😞',
        2 => '😕',
        3 => '😐',
        4 => '🙂',
        _ => '😄',
      };
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
