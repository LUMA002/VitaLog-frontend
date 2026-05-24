import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../domain/models/intake_log.dart';
import '../../../domain/models/wellbeing_log.dart';
import '../../auth/application/auth_controller.dart';

part 'logs_providers.g.dart';

// ── Intake log list item ──────────────────────────────────────────────────────

/// Intake log row enriched with the resolved product name (via course).
class IntakeLogItem {
  const IntakeLogItem({required this.log, required this.productName});

  final IntakeLog log;
  final String productName;
}

// ── Intake Logs ───────────────────────────────────────────────────────────────

/// Manages the full intake-log list for the current user.
///
/// Joins intake logs with courses and products so the history UI can show
/// product names without duplicating lookup logic in widgets.
@riverpod
class IntakeLogsController extends _$IntakeLogsController {
  @override
  FutureOr<List<IntakeLogItem>> build() async {
    final authState = ref.watch(authControllerProvider).value;
    final userId = switch (authState) {
      Authenticated(:final userId) => userId,
      _ => null,
    };

    final entries =
        await ref.watch(intakeHistoryStreamProvider(userId).future);

    final items = entries
        .map(
          (e) => IntakeLogItem(log: e.log, productName: e.productName),
        )
        .toList()
      ..sort((a, b) => b.log.takenAtUtc.compareTo(a.log.takenAtUtc));

    return items;
  }

  Future<void> softDelete(String id) async {
    final clock = ref.read(clockProvider);
    await ref
        .read(intakeLogRepositoryProvider)
        .softDelete(id, clock.nowUtc());
  }
}

// ── Wellbeing Logs ────────────────────────────────────────────────────────────

/// Manages the local-only wellbeing journal list.
///
/// Uses a hard delete ([deleteById]) since wellbeing logs are never synced.
@riverpod
class WellbeingLogsController extends _$WellbeingLogsController {
  @override
  FutureOr<List<WellbeingLog>> build() async {
    return ref.watch(allWellbeingLogStreamProvider.future);
  }

  Future<void> deleteById(String id) async {
    await ref.read(wellbeingLogRepositoryProvider).deleteById(id);
  }
}

/// Whether a wellbeing entry exists for the device's current local calendar day.
@riverpod
bool hasTodayWellbeingLog(Ref ref) {
  final clock = ref.watch(clockProvider);
  final logsAsync = ref.watch(allWellbeingLogStreamProvider);
  return logsAsync.maybeWhen(
    data: (List<WellbeingLog> logs) {
      final today = clock.nowUtc().toLocal();
      return logs.any((log) {
        final recorded = log.recordedAtUtc.toLocal();
        return recorded.year == today.year &&
            recorded.month == today.month &&
            recorded.day == today.day;
      });
    },
    orElse: () => false,
  );
}
