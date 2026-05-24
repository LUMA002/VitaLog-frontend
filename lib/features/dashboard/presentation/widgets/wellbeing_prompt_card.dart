import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/providers/repository_providers.dart';
import '../../../../app/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../../../logs/application/logs_providers.dart';
import '../../../logs/presentation/widgets/wellbeing_bottom_sheet.dart';

/// Dashboard Call to Action to open the wellbeing diary form for today.
class WellbeingPromptCard extends ConsumerWidget {
  const WellbeingPromptCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final colors = Theme.of(context).extension<SemanticColors>()!;
    final hasLogged = ref.watch(hasTodayWellbeingLogProvider);
    final today = ref.watch(clockProvider).nowUtc().toLocal();
    final prompt =
        hasLogged ? t.wellbeing.success : t.wellbeing.prompt;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.primaryContainer.withAlpha(0x55),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => WellbeingBottomSheet.show(
            context,
            recordDate: today,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Row(
              children: [
                Icon(
                  hasLogged
                      ? Icons.check_circle_outline_rounded
                      : Icons.edit_note_rounded,
                  color: Theme.of(context).colorScheme.primary,
                  size: 28,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    prompt,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: hasLogged
                              ? colors.completedText
                              : null,
                        ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: colors.pendingText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
