import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../domain/models/course.dart';
import '../../../domain/models/product.dart';
import '../../auth/application/auth_controller.dart';
import '../../notifications/application/notification_service.dart';

part 'courses_controller.g.dart';

// ── View model ───────────────────────────────────────────────────────────────

/// A presentation-layer tuple combining a [Course] with its resolved product
/// metadata. Not persisted — rebuilt on every stream update.
final class CourseItem {
  const CourseItem({
    required this.course,
    required this.productName,

    /// True when the product is global (not local draft and no owner).
    required this.isGlobalProduct,
  });

  final Course course;
  final String productName;
  final bool isGlobalProduct;
}

// ── Controller ───────────────────────────────────────────────────────────────

/// Provides the list of active courses for the current user, enriched with
/// product metadata for display.
@riverpod
class CoursesController extends _$CoursesController {
  @override
  FutureOr<List<CourseItem>> build() async {
    final authState = ref.watch(authControllerProvider).value;
    final userId = switch (authState) {
      Authenticated(:final userId) => userId,
      _ => null,
    };

    final courses =
        await ref.watch(activeCourseStreamProvider(userId).future);
    final products = await ref.watch(allProductStreamProvider.future);

    final productsById = {for (final Product p in products) p.id: p};

    return courses.map((c) {
      final product = productsById[c.productId];
      final isCustom = product != null &&
          (product.isLocalDraft || product.creatorUserId != null);
      return CourseItem(
        course: c,
        productName: product?.name ?? '—',
        isGlobalProduct: !isCustom,
      );
    }).toList()
      ..sort((a, b) => a.course.timeOfDay.compareTo(b.course.timeOfDay));
  }

  Future<void> softDelete(String courseId) async {
    final clock = ref.read(clockProvider);
    await ref
        .read(courseRepositoryProvider)
        .softDelete(courseId, clock.nowUtc());
    ref.read(notificationServiceProvider).scheduleNextIntakes();
  }
}
