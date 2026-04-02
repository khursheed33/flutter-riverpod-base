import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.color,
    this.margin,
    this.onPressed,
  });

  final Color? color;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SafeArea(
      child: Padding(
        padding: margin ?? const EdgeInsets.all(AppSpace.sm),
        child: Material(
          color: cs.surfaceContainerHighest.withValues(alpha: 0.6),
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: IconButton(
            onPressed: onPressed ?? () => Navigator.maybeOf(context)?.pop(),
            icon: Icon(Icons.arrow_back_rounded, color: color ?? cs.onSurface),
          ),
        ),
      ),
    );
  }
}
