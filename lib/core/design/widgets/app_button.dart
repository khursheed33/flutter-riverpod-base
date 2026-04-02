import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_theme_context.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';

enum AppButtonVariant { filled, tonal, outlined, text, danger }

/// Primary actions — maps to [FilledButton], [OutlinedButton], [TextButton] using [Theme].
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.filled,
    this.icon,
    this.iconAfter,
    this.isLoading = false,
    this.expandWidth = true,
    this.size = AppControlSize.md,
    this.margin,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? icon;
  final IconData? iconAfter;
  final bool isLoading;
  final bool expandWidth;
  final AppControlSize size;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final h = appControlHeight(size);
    final busy = isLoading || onPressed == null;
    final child = _buildChild(context, cs, h);

    Widget button;
    switch (variant) {
      case AppButtonVariant.filled:
        button = FilledButton(
          onPressed: busy && !isLoading ? null : (isLoading ? null : onPressed),
          style: FilledButton.styleFrom(minimumSize: Size(0, h)),
          child: child,
        );
        break;
      case AppButtonVariant.tonal:
        button = FilledButton.tonal(
          onPressed: busy && !isLoading ? null : (isLoading ? null : onPressed),
          style: FilledButton.styleFrom(minimumSize: Size(0, h)),
          child: child,
        );
        break;
      case AppButtonVariant.outlined:
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(minimumSize: Size(0, h)),
          child: child,
        );
        break;
      case AppButtonVariant.text:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(minimumSize: Size(0, h)),
          child: child,
        );
        break;
      case AppButtonVariant.danger:
        button = FilledButton(
          onPressed: isLoading ? null : onPressed,
          style: FilledButton.styleFrom(
            minimumSize: Size(0, h),
            backgroundColor: cs.error,
            foregroundColor: cs.onError,
          ),
          child: child,
        );
        break;
    }

    if (expandWidth) {
      button = SizedBox(width: double.infinity, child: button);
    }
    if (margin != null) {
      button = Padding(padding: margin!, child: button);
    } else if (expandWidth) {
      button = Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: AppSpace.xs),
        child: button,
      );
    }
    return button;
  }

  Widget _buildChild(BuildContext context, ColorScheme cs, double h) {
    final dim = context.appDim;
    final fg = switch (variant) {
      AppButtonVariant.danger => cs.onError,
      _ => null,
    };
    if (isLoading) {
      return SizedBox(
        height: h - AppSpace.md,
        width: dim.spinnerSm,
        child: CircularProgressIndicator.adaptive(
          strokeWidth: AppStroke.thin + 1,
          valueColor: AlwaysStoppedAnimation<Color?>(fg ?? cs.onPrimary),
        ),
      );
    }
    final text = Text(label, textAlign: TextAlign.center);
    if (icon == null && iconAfter == null) return text;
    final iconSize = dim.iconSm;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: iconSize),
          const SizedBox(width: AppSpace.xs),
        ],
        Flexible(child: text),
        if (iconAfter != null) ...[
          const SizedBox(width: AppSpace.xs),
          Icon(iconAfter, size: iconSize),
        ],
      ],
    );
  }
}
