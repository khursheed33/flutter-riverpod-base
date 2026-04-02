import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_theme_context.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Compact "icon + label" pill — create / add actions.
class AppTextIconButton extends StatelessWidget {
  const AppTextIconButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon = FontAwesomeIcons.circlePlus,
    this.backgroundColor,
    this.foregroundColor,
    this.iconSize,
    this.textStyle,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? iconSize;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final dim = context.appDim;
    final resolvedIconSize = iconSize ?? dim.iconMd;
    final base = textStyle ?? tt.labelLarge;
    final labelStyle = (base ?? TextStyle(fontSize: dim.badgeFontSize, color: cs.onPrimaryContainer))
        .copyWith(fontWeight: FontWeight.w600);
    return FilledButton.tonal(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: AppSpace.sm),
        backgroundColor: backgroundColor ?? cs.primaryContainer,
        foregroundColor: foregroundColor ?? cs.onPrimaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: resolvedIconSize),
          const SizedBox(width: AppSpace.xs),
          Text(label, style: labelStyle),
        ],
      ),
    );
  }
}
