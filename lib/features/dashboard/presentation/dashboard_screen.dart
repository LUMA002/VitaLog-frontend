import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../app/theme/app_theme.dart';
import '../../../i18n/strings.g.dart';
import '../application/dashboard_controller.dart';
import '../application/scheduled_intake.dart';
import 'widgets/time_slot_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final scheduleAsync = ref.watch(dashboardScheduleProvider);
    final now = ref.watch(clockProvider).nowUtc().toLocal();
    final dateLabel = DateFormat.yMMMMEEEEd().format(now);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(t.dashboard.title),
            flexibleSpace: FlexibleSpaceBar(
              background: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 58),
                  child: Text(
                    dateLabel,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .extension<SemanticColors>()!
                              .timeText,
                        ),
                  ),
                ),
              ),
            ),
          ),
          scheduleAsync.when(
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => SliverFillRemaining(
              child: ErrorStateView(
                message: e.toString(),
                onRetry: () =>
                    ref.invalidate(dashboardScheduleProvider),
              ),
            ),
            data: (schedule) {
              if (schedule.isEmpty) {
                return SliverFillRemaining(
                  child: EmptyStateView(
                    message: t.dashboard.empty,
                    icon: Icons.event_available_outlined,
                  ),
                );
              }
              return SliverPadding(
                padding: const EdgeInsets.only(bottom: 100),
                sliver: SliverList.builder(
                  itemCount: schedule.length,
                  itemBuilder: (_, i) {
                    final intake = schedule[i];
                    return TimeSlotCard(
                      key: Key(intake.courseId),
                      intake: intake,
                      onLog: () => ref
                          .read(dashboardScheduleProvider.notifier)
                          .logIntake(intake.courseId),
                      onUnlog: () => ref
                          .read(dashboardScheduleProvider.notifier)
                          .unlogIntake(intake.courseId),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: scheduleAsync.whenOrNull(
        data: (schedule) {
          final pending =
              schedule.where((i) => !i.isTaken).toList();
          if (pending.isEmpty) return null;
          return _QuickLogFab(pendingIntakes: pending);
        },
      ),
    );
  }
}

// ── Quick Log FAB ─────────────────────────────────────────────────────────────

class _QuickLogFab extends ConsumerWidget {
  const _QuickLogFab({required this.pendingIntakes});

  final List<ScheduledIntake> pendingIntakes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    return FloatingActionButton.extended(
      onPressed: () => _handleTap(context, ref),
      icon: const Icon(Icons.add_rounded),
      label: Text(t.dashboard.quickLog),
    );
  }

  void _handleTap(BuildContext context, WidgetRef ref) {
    if (pendingIntakes.length == 1) {
      ref
          .read(dashboardScheduleProvider.notifier)
          .logIntake(pendingIntakes.first.courseId);
      return;
    }
    _showPickerSheet(context, ref);
  }

  void _showPickerSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .extension<SemanticColors>()!
                    .pendingText
                    .withAlpha(0x66),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 12),
            ...pendingIntakes.map(
              (intake) => ListTile(
                leading: const Icon(Icons.medication_outlined),
                title: Text(intake.productName),
                subtitle: Text(
                  TimeOfDay(
                    hour: intake.timeOfDay.inHours % 24,
                    minute: intake.timeOfDay.inMinutes % 60,
                  ).format(context),
                ),
                onTap: () {
                  Navigator.of(ctx).pop();
                  ref
                      .read(dashboardScheduleProvider.notifier)
                      .logIntake(intake.courseId);
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
