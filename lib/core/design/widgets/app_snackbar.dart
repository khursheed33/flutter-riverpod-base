import 'package:flutter/material.dart';

/// In-app messages via [SnackBar] and [MaterialBanner] (same [ScaffoldMessenger] as the shell).
abstract final class AppSnack {
  static void show(
    BuildContext context,
    String message, {
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 3),
  }) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    messenger?.clearSnackBars();
    messenger?.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        behavior: SnackBarBehavior.floating,
        action: action,
      ),
    );
  }

  static void error(BuildContext context, String message) {
    final cs = Theme.of(context).colorScheme;
    final messenger = ScaffoldMessenger.maybeOf(context);
    messenger?.clearSnackBars();
    messenger?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: cs.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Full-width banner under the app bar (good for non-blocking announcements).
  static void banner(
    BuildContext context,
    String message, {
    String dismissLabel = 'Dismiss',
    VoidCallback? onDismiss,
  }) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) return;
    messenger
      ..clearMaterialBanners()
      ..showMaterialBanner(
        MaterialBanner(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                messenger.hideCurrentMaterialBanner();
                onDismiss?.call();
              },
              child: Text(dismissLabel),
            ),
          ],
        ),
      );
  }
}
