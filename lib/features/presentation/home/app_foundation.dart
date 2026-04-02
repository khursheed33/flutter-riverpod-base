import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/preferences_state_provider.dart';
import 'package:flutter_riverpod_base/features/presentation/routing/app_router.dart';
import 'package:flutter_riverpod_base/index.dart';

class AppFoundation extends ConsumerWidget {
  const AppFoundation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = ref.watch(
      appPreferencesViewModelProvider.select((m) => m.userPreferences.themeType),
    );
    final theme =
        themeType == ThemeType.dark ? AppTheme.dark() : AppTheme.light();
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: AppText.appName,
      theme: theme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
