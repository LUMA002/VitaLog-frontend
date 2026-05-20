import 'intake_log.dart';

/// Intake log row for the history list with a resolved product label.
class IntakeLogHistoryEntry {
  const IntakeLogHistoryEntry({
    required this.log,
    required this.productName,
  });

  final IntakeLog log;
  final String productName;
}
