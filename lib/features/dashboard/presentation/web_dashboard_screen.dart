import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/application/auth_controller.dart';

/// Thin-Client landing page shown to authenticated web users.
///
/// Full offline features (local Drift DB, Drafts, push notifications) are
/// deliberately unavailable here - the web platform is an online-only
/// Bento-style dashboard that talks directly to the .NET API.
class WebDashboardScreen extends ConsumerWidget {
  const WebDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('VitaLog Web')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ── Header ────────────────────────────────────────────────
                Icon(
                  Icons.monitor_heart_outlined,
                  size: 72,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 24),
                Text(
                  'VitaLog Web (Thin Client)',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'Placeholder for Bento-style Dashboard.',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                // ── Info card ─────────────────────────────────────────────
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: theme.colorScheme.secondary,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Full offline features — Drafts, local database, '
                            'and push notifications — are available on the '
                            'Mobile and Desktop clients.',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // ── Sign out ──────────────────────────────────────────────
                FilledButton.icon(
                  onPressed: () => ref
                      .read(authControllerProvider.notifier)
                      .logout(eraseData: false),
                  icon: const Icon(Icons.logout),
                  label: const Text('Sign Out'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
