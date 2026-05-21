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
import '../application/settings_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final authAsync = ref.watch(authControllerProvider);
    final authState = authAsync.value;
    final lastSyncAsync = ref.watch(lastSyncAtStreamProvider);
    final wifiOnly = ref.watch(wifiOnlyProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.settings.title)),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 40),
        children: [
          // ── Account ─────────────────────────────────────────────────────
          _SectionHeader(title: t.settings.account.title),
          switch (authState) {
            Authenticated(:final email) => _AccountTile(
                email: email,
                onLogout: () =>
                    _showLogoutDialog(context, ref),
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
            leading: const Icon(Icons.sync_rounded),
            title: Text(t.settings.sync.lastSync),
            subtitle: Text(
              lastSyncAsync.when(
                data: (at) => at != null
                    ? DateFormat.yMd()
                        .add_jm()
                        .format(at.toLocal())
                    : t.settings.sync.never,
                loading: () => '…',
                error: (_, _) => t.settings.sync.never,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.cloud_sync_rounded),
            title: Text(t.settings.sync.syncNow),
            enabled: authState is Authenticated,
            onTap: authState is Authenticated
                ? () => _stubAction(context, 'Sync — Phase 5')
                : null,
            trailing: authState is! Authenticated
                ? Icon(
                    Icons.lock_outline_rounded,
                    size: 18,
                    color: Theme.of(context)
                        .extension<SemanticColors>()!
                        .pendingText,
                  )
                : null,
          ),
          SwitchListTile(
            secondary: const Icon(Icons.wifi_rounded),
            title: Text(t.settings.sync.wifiOnly),
            value: wifiOnly,
            onChanged: (v) =>
                ref.read(wifiOnlyProvider.notifier).set(v),
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
          _SectionHeader(
            title: t.settings.danger.title,
            isDestructive: true,
          ),
          ListTile(
            leading: Icon(
              Icons.delete_forever_rounded,
              color: Theme.of(context)
                  .extension<SemanticColors>()!
                  .destructive,
            ),
            title: Text(
              t.settings.danger.eraseDb,
              style: TextStyle(
                color: Theme.of(context)
                    .extension<SemanticColors>()!
                    .destructive,
              ),
            ),
            onTap: () => _showEraseDbDialog(context, ref),
          ),
        ],
      ),
    );
  }

  void _stubAction(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label: coming soon.')),
    );
  }

  Future<void> _showLogoutDialog(
      BuildContext context, WidgetRef ref) async {
    final t = Translations.of(context);
    final choice = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.settings.account.logout),
        content: const Text('How would you like to sign out?'),
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
      await ref.read(authControllerProvider.notifier).logout(
            eraseData: !choice,
          );
    }
  }

  Future<void> _showEraseDbDialog(
      BuildContext context, WidgetRef ref) async {
    final t = Translations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.settings.danger.eraseDb),
        content: const Text(
          'This will permanently delete all local data. '
          'Synced data can be recovered by signing in again.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(t.common.cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context)
                  .extension<SemanticColors>()!
                  .destructive,
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

// ── Shared section header ─────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    this.isDestructive = false,
  });

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
              color: isDestructive
                  ? colors.destructive
                  : colors.pendingText,
              letterSpacing: 1.2,
            ),
      ),
    );
  }
}

// ── Account tiles ─────────────────────────────────────────────────────────────

class _AccountTile extends StatelessWidget {
  const _AccountTile({
    required this.email,
    required this.onLogout,
  });

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
      leading: const CircleAvatar(
        child: Icon(Icons.person_outline_rounded),
      ),
      title: Text(label),
      subtitle: Text(cta),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      onTap: onTap,
    );
  }
}
