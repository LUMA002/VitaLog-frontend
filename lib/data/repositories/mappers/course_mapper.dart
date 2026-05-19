import 'package:drift/drift.dart';

import '../../../data/local/app_database.dart';
import '../../../domain/models/course.dart';

/// Maps between the Drift-generated [CoursesData] row and the [Course] domain model.
///
/// Date-only fields ([startDate], [endDate]) are stored as INTEGER epoch-days
/// (UTC millisecondsSinceEpoch ~/ 86_400_000). [timeOfDay] is stored as seconds
/// since midnight (0–86 399).
extension CourseDriftX on CoursesData {
  Course toDomain() => Course(
    id: id,
    userId: userId,
    productId: productId,
    servingSize: servingSize,
    timeOfDay: Duration(seconds: timeOfDay),
    startDateUtc: DateTime.fromMillisecondsSinceEpoch(
      startDate * 86400000,
      isUtc: true,
    ),
    endDateUtc: endDate == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(endDate! * 86400000, isUtc: true),
    updatedAtUtc: updatedAt,
    deletedAtUtc: deletedAt,
  );
}

extension CourseDomainX on Course {
  CoursesCompanion toDrift({required int pendingSync}) => CoursesCompanion(
    id: Value(id),
    userId: Value(userId),
    productId: Value(productId),
    servingSize: Value(servingSize),
    timeOfDay: Value(timeOfDay.inSeconds),
    startDate: Value(startDateUtc.toUtc().millisecondsSinceEpoch ~/ 86400000),
    endDate: Value(
      endDateUtc == null
          ? null
          : endDateUtc!.toUtc().millisecondsSinceEpoch ~/ 86400000,
    ),
    updatedAt: Value(updatedAtUtc),
    deletedAt: Value(deletedAtUtc),
    pendingSync: Value(pendingSync),
  );
}
