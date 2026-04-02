import 'package:flutter/material.dart';

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
}
