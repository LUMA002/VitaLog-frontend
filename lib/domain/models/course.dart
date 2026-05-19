import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';

/// A user's scheduled supplement course.
///
/// [timeOfDay] is stored as a [Duration] from midnight (UTC-safe, unlike
/// Flutter's [TimeOfDay] which is local-time only).
///
/// [startDateUtc] and [endDateUtc] represent date-only values — time component
/// is always midnight UTC. [endDateUtc] null means an open-ended course.
///
/// No [fromJson]/[toJson] — serialization lives in DTOs (Phase 5).
@freezed
sealed class Course with _$Course {
  const factory Course({
    required String id,
    required String? userId,
    required String productId,
    required double servingSize,
    required Duration timeOfDay,
    required DateTime startDateUtc,
    required DateTime? endDateUtc,
    required DateTime updatedAtUtc,
    required DateTime? deletedAtUtc,
  }) = _Course;
}
