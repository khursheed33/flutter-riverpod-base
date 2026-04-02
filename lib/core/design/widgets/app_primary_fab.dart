import 'package:flutter/material.dart';

/// Circular FAB with optional busy state (e.g. “next” step).
class AppPrimaryFab extends StatelessWidget {
  const AppPrimaryFab({
    super.key,
    this.onPressed,
    this.icon = Icons.arrow_forward_rounded,
    this.isBusy = false,
    this.backgroundColor,
    this.foregroundColor,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final bool isBusy;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return FloatingActionButton(
      onPressed: isBusy ? null : onPressed,
      backgroundColor: backgroundColor ?? cs.primary,
      foregroundColor: foregroundColor ?? cs.onPrimary,
      elevation: 2,
      child: isBusy
          ? SizedBox(
              width: 26,
              height: 26,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: foregroundColor ?? cs.onPrimary,
              ),
            )
          : Icon(icon),
    );
  }
}
