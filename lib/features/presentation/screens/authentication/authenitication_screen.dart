import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/demo_session_provider.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/preferences_state_provider.dart';
import 'package:flutter_riverpod_base/index.dart';

/// Authentication Screen with Form and validation
class AuthenticationScreen extends ConsumerWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final isBusy = ref.watch(
      appPreferencesViewModelProvider.select((m) => m.state == ViewState.Loading),
    );
    final gradientColors = isDark
        ? [scheme.surfaceContainerHighest, scheme.surface]
        : [
            scheme.primaryContainer.withValues(alpha: AppAlpha.overlaySubtle * 3.5),
            scheme.surface,
          ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientColors,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: AppTitle(
                'Authentication',
                variant: AppTitleVariant.headline,
              ),
            ),
            const SizedBox(height: AppSpace.md),
            AppButton(
              isLoading: isBusy,
              onPressed: () {
                ref.read(demoGallerySignedInProvider.notifier).state = true;
              },
              label: 'Login',
            ),
            const SizedBox(height: AppSpace.md),
            AppButton(
              onPressed: () {
                ref.read(appPreferencesViewModelProvider).toggleThemeType();
              },
              label: 'Toggle theme',
              variant: AppButtonVariant.outlined,
              expandWidth: false,
            ),
            const SizedBox(height: AppSpace.md),
            Padding(
              padding: appSymmetricPadding(horizontal: AppSpace.lg, vertical: AppSpace.sm),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: scheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  border: Border.all(
                    color: scheme.outlineVariant.withValues(alpha: AppAlpha.borderMedium),
                  ),
                ),
                child: Padding(
                  padding: appSymmetricPadding(horizontal: AppSpace.md, vertical: AppSpace.sm),
                  child: AppTitle(
                    'Sign in to open the widget gallery demo.',
                    textAlign: TextAlign.center,
                    variant: AppTitleVariant.body,
                    color: scheme.onSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
