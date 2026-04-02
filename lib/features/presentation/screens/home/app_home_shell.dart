import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/features/presentation/home/app_route_paths.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/demo_session_provider.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/preferences_state_provider.dart';
import 'package:go_router/go_router.dart';

/// Shell for signed-in area: rail (wide) / bottom nav (narrow) + shared app bar.
class AppHomeShell extends ConsumerWidget {
  const AppHomeShell({super.key, required this.child});

  final Widget child;

  static int _indexForPath(String path) {
    if (path.startsWith(AppRoutePaths.homeUsers)) return 1;
    return 0;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = GoRouterState.of(context).uri.path;
    final index = _indexForPath(path);
    final wide = MediaQuery.sizeOf(context).width >= 720;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    void goIndex(int i) {
      if (i == 0) {
        context.go(AppRoutePaths.homeGallery);
      } else {
        context.go(AppRoutePaths.homeUsers);
      }
    }

    final destinations = [
      const NavigationDestination(
        icon: Icon(Icons.widgets_outlined),
        selectedIcon: Icon(Icons.widgets),
        label: 'Components',
      ),
      const NavigationDestination(
        icon: Icon(Icons.people_outline),
        selectedIcon: Icon(Icons.people),
        label: 'Users',
      ),
    ];

    if (wide) {
      return Scaffold(
        appBar: AppBar(
          title: Text(index == 0 ? 'Components' : 'Manage users'),
          actions: [
            IconButton(
              tooltip: isDark ? 'Use light theme' : 'Use dark theme',
              icon: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
              onPressed: () {
                ref.read(appPreferencesViewModelProvider).toggleThemeType();
              },
            ),
            TextButton(
              onPressed: () {
                ref.read(demoGallerySignedInProvider.notifier).state = false;
                context.go(AppRoutePaths.login);
              },
              child: const Text('Sign out'),
            ),
          ],
        ),
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: index,
              onDestinationSelected: goIndex,
              labelType: NavigationRailLabelType.all,
              destinations: [
                NavigationRailDestination(
                  icon: destinations[0].icon,
                  selectedIcon: destinations[0].selectedIcon,
                  label: Text(destinations[0].label),
                ),
                NavigationRailDestination(
                  icon: destinations[1].icon,
                  selectedIcon: destinations[1].selectedIcon,
                  label: Text(destinations[1].label),
                ),
              ],
            ),
            const VerticalDivider(width: 1),
            Expanded(child: child),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(index == 0 ? 'Components' : 'Manage users'),
        actions: [
          IconButton(
            tooltip: isDark ? 'Use light theme' : 'Use dark theme',
            icon: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            onPressed: () {
              ref.read(appPreferencesViewModelProvider).toggleThemeType();
            },
          ),
          TextButton(
            onPressed: () {
              ref.read(demoGallerySignedInProvider.notifier).state = false;
              context.go(AppRoutePaths.login);
            },
            child: const Text('Sign out'),
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: goIndex,
        destinations: destinations,
      ),
    );
  }
}
