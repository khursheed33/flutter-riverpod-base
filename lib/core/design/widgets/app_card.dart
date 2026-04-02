import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';

enum AppCardVariant { elevated, filled, outlined }

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.variant = AppCardVariant.filled,
    this.padding,
    this.margin,
    this.onTap,
    this.clipBehavior = Clip.antiAlias,
  });

  final Widget child;
  final AppCardVariant variant;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final radius = BorderRadius.circular(AppRadius.lg);
    final inner = Padding(
      padding: padding ?? const EdgeInsets.all(AppSpace.md),
      child: child,
    );
    Widget card = Card(
      elevation: variant == AppCardVariant.elevated ? 2 : 0,
      color: variant == AppCardVariant.filled
          ? cs.surfaceContainerLow
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: variant == AppCardVariant.outlined
            ? BorderSide(color: cs.outlineVariant.withValues(alpha: 0.6))
            : BorderSide.none,
      ),
      clipBehavior: clipBehavior,
      margin: margin ?? EdgeInsets.zero,
      child: onTap == null
          ? inner
          : InkWell(
              onTap: onTap,
              borderRadius: radius,
              child: inner,
            ),
    );
    return card;
  }
}
