import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_radii.dart';
import '../../../../app/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../../application/wellbeing_form_controller.dart';

/// Modal form for logging mood, energy, sleep, and optional notes.
class WellbeingBottomSheet extends ConsumerStatefulWidget {
  const WellbeingBottomSheet({
    super.key,
    required this.recordDate,
  });

  /// Calendar day this entry describes (local or UTC - normalized on save).
  final DateTime recordDate;

  static Future<void> show(
    BuildContext context, {
    required DateTime recordDate,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => WellbeingBottomSheet(recordDate: recordDate),
    );
  }

  @override
  ConsumerState<WellbeingBottomSheet> createState() =>
      _WellbeingBottomSheetState();
}

class _WellbeingBottomSheetState extends ConsumerState<WellbeingBottomSheet> {
  late final TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController();
    Future.microtask(
      () => ref.invalidate(wellbeingFormControllerProvider),
    );
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    final saved = await ref
        .read(wellbeingFormControllerProvider.notifier)
        .saveLog();
    if (!mounted) return;
    if (saved) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final colors = Theme.of(context).extension<SemanticColors>()!;
    final form = ref.watch(wellbeingFormControllerProvider);
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: DraggableScrollableSheet(
        initialChildSize: 0.72,
        minChildSize: 0.45,
        maxChildSize: 0.92,
        expand: false,
        builder: (context, scrollController) {
          return Material(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            clipBehavior: Clip.antiAlias,
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              children: [
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
                const SizedBox(height: 16),
                Text(
                  t.wellbeing.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 20),
                _ScaleSlider(
                  label: t.wellbeing.mood,
                  emoji: _moodEmoji(form.mood),
                  value: form.mood.toDouble(),
                  min: 1,
                  max: 5,
                  divisions: 4,
                  displayValue: '${form.mood}',
                  onChanged: (v) => ref
                      .read(wellbeingFormControllerProvider.notifier)
                      .setMood(v.round()),
                ),
                const SizedBox(height: 16),
                _ScaleSlider(
                  label: t.wellbeing.energy,
                  emoji: _energyEmoji(form.energy),
                  value: form.energy.toDouble(),
                  min: 1,
                  max: 5,
                  divisions: 4,
                  displayValue: '${form.energy}',
                  onChanged: (v) => ref
                      .read(wellbeingFormControllerProvider.notifier)
                      .setEnergy(v.round()),
                ),
                const SizedBox(height: 16),
                _ScaleSlider(
                  label: t.wellbeing.sleep,
                  emoji: _sleepEmoji(form.sleepHours),
                  value: form.sleepHours,
                  min: 0,
                  max: 24,
                  divisions: 48,
                  displayValue: t.wellbeing.sleepValue(
                    value: form.sleepHours.toStringAsFixed(1),
                  ),
                  onChanged: (v) => ref
                      .read(wellbeingFormControllerProvider.notifier)
                      .setSleepHours(v),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _notesController,
                  maxLines: 3,
                  maxLength: 2000,
                  decoration: InputDecoration(
                    labelText: t.wellbeing.notes,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) => ref
                      .read(wellbeingFormControllerProvider.notifier)
                      .setNotes(value),
                ),
                if (form.errorMessage != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    form.errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 13,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: form.isSubmitting ? null : _onSave,
                  child: form.isSubmitting
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(t.wellbeing.save),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _moodEmoji(int mood) => switch (mood) {
        1 => '😭',
        2 => '😕',
        3 => '😐',
        4 => '🙂',
        _ => '🤩',
      };

  String _energyEmoji(int energy) => switch (energy) {
        1 => '🪫',
        2 => '😴',
        3 => '⚡',
        4 => '💪',
        _ => '🔥',
      };

  String _sleepEmoji(double hours) {
    if (hours < 4) return '😵‍💫';
    if (hours < 6) return '🥱';
    if (hours < 8) return '😌';
    if (hours < 10) return '😴';
    return '🛌';
  }
}

class _ScaleSlider extends StatelessWidget {
  const _ScaleSlider({
    required this.label,
    required this.emoji,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.displayValue,
    required this.onChanged,
  });

  final String label;
  final String emoji;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final String displayValue;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<SemanticColors>()!;

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(emoji, style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Text(
                  displayValue,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: colors.pendingText,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            Slider(
              value: value.clamp(min, max),
              min: min,
              max: max,
              divisions: divisions,
              label: displayValue,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
