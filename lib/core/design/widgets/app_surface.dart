import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';

/// Generic rounded surface (card-like) — backgrounds, pickers, panels.
class AppSurface extends StatelessWidget {
  const AppSurface({
    super.key,
    required this.child,
    this.color,
    this.width,
    this.maxWidth,
    this.maxHeight,
    this.radius,
    this.padding,
    this.margin,
    this.borderColor,
    this.borderWidth = 0,
    this.shadows,
    this.onTap,
  });

  final Widget child;
  final Color? color;
  final double? width;
  final double? maxWidth;
  final double? maxHeight;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final double borderWidth;
  final List<BoxShadow>? shadows;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final r = radius ?? AppRadius.md;
    final decoration = BoxDecoration(
      color: color ?? cs.surfaceContainerLow,
      borderRadius: BorderRadius.circular(r),
      boxShadow: shadows,
      border: borderWidth > 0
          ? Border.all(
              width: borderWidth,
              color: borderColor ?? cs.outlineVariant.withValues(alpha: 0.5),
            )
          : null,
    );
    Widget w = Container(
      width: width,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
        maxHeight: maxHeight ?? double.infinity,
      ),
      margin: margin,
      padding: padding ?? const EdgeInsets.all(AppSpace.sm),
      decoration: decoration,
      child: child,
    );
    if (onTap != null) {
      w = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(r),
          child: w,
        ),
      );
    }
    return w;
  }
}
