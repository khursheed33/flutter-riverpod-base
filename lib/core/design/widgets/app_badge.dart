import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_theme_context.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';

class AppBadge extends StatelessWidget {
  const AppBadge({
    super.key,
    required this.label,
    this.color,
    this.textColor,
    this.small = false,
  });

  final String label;
  final Color? color;
  final Color? textColor;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final dim = context.appDim;
    final bg = color ?? cs.primaryContainer;
    final fg = textColor ?? cs.onPrimaryContainer;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? AppSpace.xs : AppSpace.sm,
        vertical: small ? 2 : AppSpace.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: fg,
          fontSize: small ? dim.badgeFontSizeDense : dim.badgeFontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
