import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/application/auth_controller.dart';
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
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;

    final auth = ref.read(authControllerProvider).value;
    if (auth is! Authenticated) return;

    ref.read(syncServiceProvider.notifier).runOnce();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
