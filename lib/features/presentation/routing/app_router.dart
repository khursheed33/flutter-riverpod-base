import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/core/enums/view_state.dart';
import 'package:flutter_riverpod_base/features/presentation/home/app_route_paths.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/demo_session_provider.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/preferences_state_provider.dart';
import 'package:flutter_riverpod_base/features/presentation/routing/go_router_refresh.dart';
import 'package:flutter_riverpod_base/features/presentation/screens/authentication/authenitication_screen.dart';
import 'package:flutter_riverpod_base/features/presentation/screens/error_screen.dart';
import 'package:flutter_riverpod_base/features/presentation/screens/gallery/app_widget_gallery_screen.dart';
import 'package:flutter_riverpod_base/features/presentation/screens/home/app_home_shell.dart';
import 'package:flutter_riverpod_base/features/presentation/screens/managed_users/managed_user_detail_screen.dart';
import 'package:flutter_riverpod_base/features/presentation/screens/managed_users/managed_user_form_screen.dart';
import 'package:flutter_riverpod_base/features/presentation/screens/managed_users/managed_users_list_screen.dart';
import 'package:flutter_riverpod_base/features/presentation/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final goRouterRefreshProvider = Provider<GoRouterRefresh>((ref) {
  return GoRouterRefresh(ref);
});

final goRouterProvider = Provider<GoRouter>((ref) {
  final refresh = ref.watch(goRouterRefreshProvider);
  return GoRouter(
    initialLocation: AppRoutePaths.splash,
    refreshListenable: refresh,
    redirect: (context, state) {
      final prefsVm = ref.read(appPreferencesViewModelProvider);
      final loading = prefsVm.state == ViewState.Loading;
      final loc = state.matchedLocation;

      if (loading) {
        return loc == AppRoutePaths.splash ? null : AppRoutePaths.splash;
      }

      final signedIn = ref.read(demoGallerySignedInProvider);
      if (!signedIn) {
        if (loc == AppRoutePaths.login) return null;
        return AppRoutePaths.login;
      }

      if (signedIn &&
          (loc == AppRoutePaths.login || loc == AppRoutePaths.splash)) {
        return AppRoutePaths.homeGallery;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutePaths.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.login,
        name: 'login',
        builder: (context, state) => const AuthenticationScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => AppHomeShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutePaths.homeGallery,
            name: 'gallery',
            builder: (context, state) => const AppWidgetGalleryScreen(),
          ),
          GoRoute(
            path: AppRoutePaths.homeUsersNew,
            name: 'usersNew',
            builder: (context, state) => const ManagedUserFormScreen(),
          ),
          GoRoute(
            path: '/home/users/:userId/edit',
            name: 'userEdit',
            builder: (context, state) {
              final id = state.pathParameters['userId']!;
              return ManagedUserFormScreen(userId: id);
            },
          ),
          GoRoute(
            path: '/home/users/:userId',
            name: 'userDetail',
            builder: (context, state) {
              final id = state.pathParameters['userId']!;
              return ManagedUserDetailScreen(userId: id);
            },
          ),
          GoRoute(
            path: AppRoutePaths.homeUsers,
            name: 'users',
            builder: (context, state) => const ManagedUsersListScreen(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(
      errorMessage: state.error?.toString() ?? 'Route not found',
    ),
  );
});
