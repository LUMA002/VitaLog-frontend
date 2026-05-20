import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../domain/models/intake_log.dart';
import '../../../domain/models/product.dart';
import '../../../i18n/strings.g.dart';
import '../../dashboard/presentation/widgets/time_slot_card.dart';
import '../application/logs_providers.dart';
import 'widgets/intake_log_tile.dart';
import 'widgets/wellbeing_log_tile.dart';

class LogsScreen extends ConsumerStatefulWidget {
  const LogsScreen({super.key});

  @override
  ConsumerState<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends ConsumerState<LogsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.logs.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: t.logs.tabs.intake),
            Tab(text: t.logs.tabs.wellbeing),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _IntakeLogsTab(),
          _WellbeingLogsTab(),
        ],
      ),
    );
  }
}

// ── Intake tab ────────────────────────────────────────────────────────────────

class _IntakeLogsTab extends ConsumerWidget {
  const _IntakeLogsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final logsAsync = ref.watch(intakeLogsControllerProvider);
    final productsAsync = ref.watch(allProductStreamProvider);
    final productsById = productsAsync.whenOrNull(
          data: (list) => {for (final Product p in list) p.id: p},
        ) ??
        {};

    return logsAsync.when(
      loading: () =>
          const Center(child: CircularProgressIndicator()),
      error: (e, _) => ErrorStateView(
        message: e.toString(),
        onRetry: () =>
            ref.invalidate(intakeLogsControllerProvider),
      ),
      data: (logs) {
        if (logs.isEmpty) {
          return EmptyStateView(
            message: t.logs.empty,
            icon: Icons.history_outlined,
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.only(top: 4, bottom: 80),
          itemCount: logs.length,
          itemBuilder: (_, i) {
            final log = logs[i];
            return _DismissibleIntakeLog(
              key: Key(log.id),
              log: log,
              productName:
                  productsById[log.courseId]?.name ?? '—',
            );
          },
        );
      },
    );
  }
}

class _DismissibleIntakeLog extends ConsumerWidget {
  const _DismissibleIntakeLog({
    super.key,
    required this.log,
    required this.productName,
  });

  final IntakeLog log;
  final String productName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IntakeLogTile(
      log: log,
      productName: productName,
      onDelete: () => ref
          .read(intakeLogsControllerProvider.notifier)
          .softDelete(log.id),
    );
  }
}

// ── Wellbeing tab ─────────────────────────────────────────────────────────────

class _WellbeingLogsTab extends ConsumerWidget {
  const _WellbeingLogsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final logsAsync = ref.watch(wellbeingLogsControllerProvider);

    return logsAsync.when(
      loading: () =>
          const Center(child: CircularProgressIndicator()),
      error: (e, _) => ErrorStateView(
        message: e.toString(),
        onRetry: () =>
            ref.invalidate(wellbeingLogsControllerProvider),
      ),
      data: (logs) {
        if (logs.isEmpty) {
          return EmptyStateView(
            message: t.logs.empty,
            icon: Icons.self_improvement_outlined,
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.only(top: 4, bottom: 80),
          itemCount: logs.length,
          itemBuilder: (_, i) {
            final log = logs[i];
            return WellbeingLogTile(
              key: Key(log.id),
              log: log,
              onDelete: () => ref
                  .read(wellbeingLogsControllerProvider.notifier)
                  .deleteById(log.id),
            );
          },
        );
      },
    );
  }
}
