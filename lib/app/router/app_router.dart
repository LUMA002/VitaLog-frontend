import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../core/logger/talker.dart';
import '../../features/auth/application/auth_controller.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/register_screen.dart';
import '../../features/courses/presentation/course_form_screen.dart';
import '../../features/products/presentation/create_product_screen.dart';
import '../../features/courses/presentation/courses_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/dashboard/presentation/web_dashboard_screen.dart';
import '../../features/logs/presentation/logs_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../i18n/strings.g.dart';
import 'routes.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final router = GoRouter(
    debugLogDiagnostics: true,
    observers: [TalkerRouteObserver(talker)],
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) =>
            _ShellScaffold(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.dashboard,
                builder: (context, state) =>
                    const DashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.logs,
                builder: (context, state) => const LogsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.courses,
                builder: (context, state) => const CoursesScreen(),
                routes: [
                  GoRoute(
                    path: 'new',
                    builder: (context, state) =>
                        const CourseFormScreen(),
                  ),
                  GoRoute(
                    path: ':id/edit',
                    builder: (context, state) => CourseFormScreen(
                      courseId: state.pathParameters['id'],
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.settings,
                builder: (context, state) =>
                    const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.productNew,
        builder: (context, state) => const CreateProductScreen(),
      ),
      GoRoute(
        path: '/products/:id',
        builder: (context, state) =>
            const _PlaceholderScreen(title: 'Product Detail'),
      ),
      GoRoute(
        path: AppRoutes.webDashboard,
        builder: (context, state) => const WebDashboardScreen(),
      ),
      GoRoute(
        path: AppRoutes.authLogin,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.authRegister,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.devLogs,
        builder: (context, state) => TalkerScreen(talker: talker),
      ),
    ],
    redirect: (context, state) {
      final authState = ref.read(authControllerProvider).value;
      final location = state.matchedLocation;

      // On web, authenticated users must stay on the web dashboard.
      // Routes that depend on Drift (/, /logs, /courses) are mobile-only.
      if (kIsWeb) {
        if (authState is Authenticated && location != AppRoutes.webDashboard) {
          return AppRoutes.webDashboard;
        }
        return null;
      }

      // Guest mode is always allowed on mobile/desktop -
      // only the sync sub-route requires authentication.
      if (location == AppRoutes.settingsSync && authState is! Authenticated) {
        return AppRoutes.authLogin;
      }

      return null;
    },
  );

  // Refresh the router (re-runs redirect) whenever auth state changes.
  ref.listen(authControllerProvider, (_, _) => router.refresh());

  ref.onDispose(router.dispose);
  return router;
}

// ── Shell scaffold (adaptive) ─────────────────────────────────────────────────

class _ShellScaffold extends StatelessWidget {
  const _ShellScaffold({required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final width = MediaQuery.of(context).size.width;

    final destinations = [
      (
        icon: Icons.today_outlined,
        selectedIcon: Icons.today_rounded,
        label: t.nav.today,
      ),
      (
        icon: Icons.history_outlined,
        selectedIcon: Icons.history_rounded,
        label: t.nav.history,
      ),
      (
        icon: Icons.medication_outlined,
        selectedIcon: Icons.medication_rounded,
        label: t.nav.courses,
      ),
      (
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings_rounded,
        label: t.nav.settings,
      ),
    ];

    if (width >= 600) {
      // Tablet / Desktop: NavigationRail on the left.
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: shell.currentIndex,
              onDestinationSelected: shell.goBranch,
              extended: width >= 1000,
              destinations: destinations
                  .map(
                    (d) => NavigationRailDestination(
                      icon: Icon(d.icon),
                      selectedIcon: Icon(d.selectedIcon),
                      label: Text(d.label),
                    ),
                  )
                  .toList(),
            ),
            const VerticalDivider(width: 1, thickness: 1),
            Expanded(child: shell),
          ],
        ),
      );
    }

    // Mobile: bottom NavigationBar.
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: shell.goBranch,
        destinations: destinations
            .map(
              (d) => NavigationDestination(
                icon: Icon(d.icon),
                selectedIcon: Icon(d.selectedIcon),
                label: d.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

// ── Placeholder ───────────────────────────────────────────────────────────────

class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
