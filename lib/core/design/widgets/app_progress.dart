import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_theme_context.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';

/// Circular busy indicator — uses [Theme.colorScheme.primary] by default.
class AppSpinner extends StatelessWidget {
  const AppSpinner({
    super.key,
    this.size,
    this.color,
    this.strokeWidth,
    this.elevatedSurface = false,
  });

  final double? size;
  final Color? color;
  final double? strokeWidth;
  final bool elevatedSurface;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final dim = context.appDim;
    final s = size ?? dim.spinnerMd;
    final sw = strokeWidth ?? dim.fabStrokeWidth;
    final indicator = SizedBox(
      width: s,
      height: s,
      child: CircularProgressIndicator(
        strokeWidth: sw,
        color: color ?? cs.primary,
      ),
    );
    if (!elevatedSurface) {
      return Padding(padding: const EdgeInsets.all(AppSpace.sm), child: indicator);
    }
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      color: cs.surfaceContainerHighest,
      child: Padding(padding: const EdgeInsets.all(AppSpace.md), child: indicator),
    );
  }
}

/// Themed linear progress; optional [value] for determinate mode.
class AppLinearProgressBar extends StatelessWidget {
  const AppLinearProgressBar({super.key, this.value, this.minHeight});

  final double? value;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    final dim = context.appDim;
    final h = minHeight ?? dim.progressHeight;
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.sm),
      child: LinearProgressIndicator(
        value: value,
        minHeight: h,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
    );
  }
}
