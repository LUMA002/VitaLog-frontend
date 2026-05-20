import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../domain/models/intake_log.dart';
import '../../../domain/models/wellbeing_log.dart';
import '../../auth/application/auth_controller.dart';

part 'logs_providers.g.dart';

// ── Intake Logs ───────────────────────────────────────────────────────────────

/// Manages the full intake-log list for the current user.
///
/// Delegates soft-deletion to [IIntakeLogRepository] — streams auto-refresh
/// the UI via the underlying Drift subscription.
@riverpod
class IntakeLogsController extends _$IntakeLogsController {
  @override
  FutureOr<List<IntakeLog>> build() async {
    final authState = ref.watch(authControllerProvider).value;
    final userId = switch (authState) {
      Authenticated(:final userId) => userId,
      _ => null,
    };

    // Sort newest first for the history list.
    final logs =
        await ref.watch(userIntakeLogStreamProvider(userId).future);
    return logs
      ..sort((a, b) => b.takenAtUtc.compareTo(a.takenAtUtc));
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
