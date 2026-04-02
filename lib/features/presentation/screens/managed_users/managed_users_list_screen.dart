import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/core/design/design.dart';
import 'package:flutter_riverpod_base/features/presentation/home/app_route_paths.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/managed_users_notifier.dart';
import 'package:flutter_riverpod_base/features/presentation/widgets/app_title.dart';
import 'package:go_router/go_router.dart';

class ManagedUsersListScreen extends ConsumerWidget {
  const ManagedUsersListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(managedUsersNotifierProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(AppRoutePaths.homeUsersNew),
        icon: const Icon(Icons.person_add_rounded),
        label: const Text('Add user'),
      ),
      body: async.when(
        loading: () => const Center(child: AppSpinner()),
        error: (e, _) => AppEmptyState(
          title: 'Could not load users',
          message: e.toString(),
          icon: Icons.error_outline,
          actionLabel: 'Retry',
          onAction: () => ref.invalidate(managedUsersNotifierProvider),
        ),
        data: (users) {
          if (users.isEmpty) {
            return Center(
              child: AppEmptyState(
                title: 'No users yet',
                message: 'Create a user — data is stored locally in Hive.',
                icon: Icons.person_add_outlined,
                actionLabel: 'Add user',
                onAction: () => context.push(AppRoutePaths.homeUsersNew),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpace.md),
            itemCount: users.length,
            separatorBuilder: (_, __) => const SizedBox(height: AppSpace.sm),
            itemBuilder: (context, i) {
              final u = users[i];
              return AppCard(
                onTap: () => context.push(AppRoutePaths.homeUser(u.id)),
                child: ListTile(
                  title: AppTitle('${u.name} ${u.surname}', variant: AppTitleVariant.title),
                  subtitle: AppTitle(
                    u.email,
                    variant: AppTitleVariant.body,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
