import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../app/theme/app_theme.dart';
import '../../../i18n/strings.g.dart';
import '../application/dashboard_controller.dart';
import 'widgets/time_slot_card.dart';
import 'widgets/wellbeing_prompt_card.dart';

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
                return SliverMainAxisGroup(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: EmptyStateView(
                        message: t.dashboard.empty,
                        icon: Icons.event_available_outlined,
                      ),
                    ),
                    const SliverToBoxAdapter(child: WellbeingPromptCard()),
                    const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  ],
                );
              }
              return SliverMainAxisGroup(
                slivers: [
                  SliverList.builder(
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
                  const SliverToBoxAdapter(child: WellbeingPromptCard()),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
