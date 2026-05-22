import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/application/auth_controller.dart';
import '../../features/notifications/application/notification_service.dart';
import '../../features/sync/application/sync_service.dart';

class AppLifecycleSync extends ConsumerStatefulWidget {
  const AppLifecycleSync({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<AppLifecycleSync> createState() => _AppLifecycleSyncState();
}

class _AppLifecycleSyncState extends ConsumerState<AppLifecycleSync>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Request permissions and build the initial schedule after the first frame
    // so the ProviderScope is fully mounted before we read providers.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final svc = ref.read(notificationServiceProvider);
      svc.requestPermissions();
      svc.scheduleNextIntakes();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;

    ref.read(notificationServiceProvider).scheduleNextIntakes();

    final auth = ref.read(authControllerProvider).value;
    if (auth is! Authenticated) return;

    ref.read(syncServiceProvider.notifier).runOnce();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
