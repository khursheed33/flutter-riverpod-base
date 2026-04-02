import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/core/design/design.dart';
import 'package:flutter_riverpod_base/features/presentation/home/app_route_paths.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/managed_users_notifier.dart';
import 'package:flutter_riverpod_base/features/presentation/widgets/app_title.dart';
import 'package:go_router/go_router.dart';

class ManagedUserDetailScreen extends ConsumerWidget {
  const ManagedUserDetailScreen({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(managedUserDetailProvider(userId));

    return asyncUser.when(
      loading: () => const Center(child: AppSpinner()),
      error: (_, __) => AppEmptyState(
        title: 'Something went wrong',
        icon: Icons.error_outline,
        actionLabel: 'Back',
        onAction: () => context.pop(),
      ),
      data: (user) {
        if (user == null) {
          return AppEmptyState(
            title: 'User not found',
            icon: Icons.person_off_outlined,
            actionLabel: 'Back to list',
            onAction: () => context.go(AppRoutePaths.homeUsers),
          );
        }
        return ListView(
          padding: const EdgeInsets.all(AppSpace.lg),
          children: [
            AppTitle('${user.name} ${user.surname}', variant: AppTitleVariant.headline),
            const SizedBox(height: AppSpace.sm),
            AppKeyValueLine(label: 'Email', value: user.email),
            const SizedBox(height: AppSpace.xs),
            AppKeyValueLine(
              label: 'Updated',
              value: user.updatedAt.toLocal().toString(),
            ),
            const SizedBox(height: AppSpace.lg),
            AppButton(
              label: 'Edit',
              onPressed: () => context.push(AppRoutePaths.homeUserEdit(user.id)),
              variant: AppButtonVariant.filled,
            ),
            const SizedBox(height: AppSpace.sm),
            AppButton(
              label: 'Delete',
              onPressed: () async {
                final ok = await AppDialog.confirm(
                  context,
                  title: 'Delete user?',
                  message: 'This removes the user from local storage.',
                  confirmLabel: 'Delete',
                  isError: true,
                );
                if (ok == true && context.mounted) {
                  final err = await ref.read(managedUsersNotifierProvider.notifier).delete(user.id);
                  if (context.mounted) {
                    if (err != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
                    } else {
                      ref.invalidate(managedUserDetailProvider(userId));
                      ref.invalidate(managedUsersNotifierProvider);
                      context.go(AppRoutePaths.homeUsers);
                    }
                  }
                }
              },
              variant: AppButtonVariant.danger,
            ),
          ],
        );
      },
    );
  }
}
