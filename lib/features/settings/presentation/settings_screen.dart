import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../app/router/routes.dart';
import '../../../app/theme/app_theme.dart';
import '../../../i18n/strings.g.dart';
import '../../auth/application/auth_controller.dart';
import '../../sync/application/sync_service.dart';
import '../application/settings_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final authAsync = ref.watch(authControllerProvider);
    final authState = authAsync.value;
    final lastSyncAsync = ref.watch(lastSyncAtStreamProvider);
    final settingsAsync = ref.watch(settingsProvider);
    final syncAsync = ref.watch(syncServiceProvider);
    final isSyncing = syncAsync.isLoading;
    final currentLocale = LocaleSettings.currentLocale;

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(t.settings.title),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 40),
        children: [
          // ── Account ─────────────────────────────────────────────────────
          _SectionHeader(title: t.settings.account.title),
          switch (authState) {
            Authenticated(:final email) => _AccountTile(
              email: email,
              onLogout: () => _showLogoutDialog(context, ref),
            ),
            _ => _GuestTile(
              label: t.settings.account.guest,
              cta: t.settings.account.signInCta,
              onTap: () => context.push(AppRoutes.authLogin),
            ),
          },
          const Divider(height: 1),

          // ── Sync ─────────────────────────────────────────────────────────
          _SectionHeader(title: t.settings.sync.title),
          ListTile(
            leading: const Icon(Icons.cloud_sync_rounded),
            title: Text(t.settings.sync.syncNow),
            subtitle: Text(
              lastSyncAsync.when(
                data: (at) => at != null
                    ? DateFormat.yMd().add_jm().format(at.toLocal())
                    : t.settings.sync.never,
                loading: () => '…',
                error: (_, _) => t.settings.sync.never,
              ),
            ),
            enabled: authState is Authenticated && !isSyncing,
            onTap: authState is Authenticated
                ? () => ref.read(syncServiceProvider.notifier).runOnce()
                : null,
            trailing: _SyncTrailing(
              isSyncing: isSyncing,
              isGuest: authState is! Authenticated,
            ),
          ),
          settingsAsync.when(
            data: (settings) => SwitchListTile(
              secondary: const Icon(Icons.wifi_rounded),
              title: Text(t.settings.sync.wifiOnly),
              value: settings.wifiOnlySync,
              onChanged: (v) =>
                  ref.read(settingsProvider.notifier).setWifiOnlySync(v),
            ),
            loading: () => SwitchListTile(
              secondary: const Icon(Icons.wifi_rounded),
              title: Text(t.settings.sync.wifiOnly),
              value: false,
              onChanged: null,
            ),
            error: (_, _) => const SizedBox.shrink(),
          ),
          const Divider(height: 1),

          _SectionHeader(title: t.settings.language.title),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SegmentedButton<AppLocale>(
              segments: [
                ButtonSegment(
                  value: AppLocale.en,
                  label: Text(t.settings.language.en),
                ),
                ButtonSegment(
                  value: AppLocale.ua,
                  label: Text(t.settings.language.ua),
                ),
              ],
              selected: {currentLocale},
              onSelectionChanged: (selected) {
                LocaleSettings.setLocale(selected.first);
              },
            ),
          ),
          const Divider(height: 1),

          // ── Notifications ─────────────────────────────────────────────────
          _SectionHeader(title: t.settings.notifications.title),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: Text(t.settings.notifications.rebuild),
            onTap: () =>
                _stubAction(context, 'Rebuild notifications — Phase 5'),
          ),
          const Divider(height: 1),

          // ── Developer (debug builds only) ─────────────────────────────────
          if (kDebugMode) ...[
            _SectionHeader(title: t.settings.developer.title),
            ListTile(
              leading: const Icon(Icons.bug_report_outlined),
              title: Text(t.settings.developer.viewLogs),
              onTap: () => context.push(AppRoutes.devLogs),
            ),
            const Divider(height: 1),
          ],

          // ── Danger Zone ───────────────────────────────────────────────────
          _SectionHeader(title: t.settings.danger.title, isDestructive: true),
          ListTile(
            leading: Icon(
              Icons.delete_forever_rounded,
              color: Theme.of(context).extension<SemanticColors>()!.destructive,
            ),
            title: Text(
              t.settings.danger.eraseDb,
              style: TextStyle(
                color: Theme.of(
                  context,
                ).extension<SemanticColors>()!.destructive,
              ),
            ),
            onTap: () => _showEraseDbDialog(context, ref),
          ),
        ],
      ),
    );
  }

  void _stubAction(BuildContext context, String label) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$label: coming soon.')));
  }

  Future<void> _showLogoutDialog(BuildContext context, WidgetRef ref) async {
    final t = Translations.of(context);
    final choice = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.settings.account.logout),
        content: Text(t.settings.account.logoutDialogContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(null),
            child: Text(t.common.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(t.settings.account.eraseData),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(t.settings.account.keepData),
          ),
        ],
      ),
    );
    if (choice != null) {
      await ref
          .read(authControllerProvider.notifier)
          .logout(eraseData: !choice);
    }
  }

  Future<void> _showEraseDbDialog(BuildContext context, WidgetRef ref) async {
    final t = Translations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.settings.danger.eraseDb),
        content: Text(t.settings.danger.eraseDbConfirmContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(t.common.cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(
                context,
              ).extension<SemanticColors>()!.destructive,
            ),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(t.common.delete),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Database erase — Phase 5 implementation.'),
        ),
      );
    }
  }
}

class _SyncTrailing extends StatelessWidget {
  const _SyncTrailing({required this.isSyncing, required this.isGuest});

  final bool isSyncing;
  final bool isGuest;

  @override
  Widget build(BuildContext context) {
    if (isSyncing) {
      return const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }
    if (isGuest) {
      return Icon(
        Icons.lock_outline_rounded,
        size: 18,
        color: Theme.of(context).extension<SemanticColors>()!.pendingText,
      );
    }
    return const SizedBox.shrink();
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.isDestructive = false});

  final String title;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<SemanticColors>()!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: isDestructive ? colors.destructive : colors.pendingText,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

// ── Account tiles ─────────────────────────────────────────────────────────────

class _AccountTile extends StatelessWidget {
  const _AccountTile({required this.email, required this.onLogout});

  final String email;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person_rounded)),
      title: Text(email),
      subtitle: Text(t.settings.account.title),
      trailing: TextButton(
        onPressed: onLogout,
        child: Text(t.settings.account.logout),
      ),
    );
  }
}

class _GuestTile extends StatelessWidget {
  const _GuestTile({
    required this.label,
    required this.cta,
    required this.onTap,
  });

  final String label;
  final String cta;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person_outline_rounded)),
      title: Text(label),
      subtitle: Text(cta),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      onTap: onTap,
    );
  }
}
