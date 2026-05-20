import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../i18n/strings.g.dart';
import '../../dashboard/presentation/widgets/time_slot_card.dart';
import '../application/courses_controller.dart';
import 'course_form_screen.dart';
import 'widgets/course_tile.dart';

class CoursesScreen extends ConsumerWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final coursesAsync = ref.watch(coursesControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.courses.title)),
      body: coursesAsync.when(
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorStateView(
          message: e.toString(),
          onRetry: () => ref.invalidate(coursesControllerProvider),
        ),
        data: (courses) {
          if (courses.isEmpty) {
            return EmptyStateView(
              message: t.courses.empty,
              icon: Icons.medication_outlined,
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 100),
            itemCount: courses.length,
            itemBuilder: (_, i) {
              final item = courses[i];
              return CourseTile(
                key: Key(item.course.id),
                item: item,
                onEdit: () => _openForm(context, item.course.id),
                onDelete: () => ref
                    .read(coursesControllerProvider.notifier)
                    .softDelete(item.course.id),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openForm(context, null),
        icon: const Icon(Icons.add_rounded),
        label: Text(t.courses.create),
      ),
    );
  }

  void _openForm(BuildContext context, String? courseId) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => CourseFormScreen(courseId: courseId),
      ),
    );
  }
}
