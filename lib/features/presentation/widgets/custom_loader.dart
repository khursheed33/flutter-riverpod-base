import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_progress.dart';

@Deprecated('Prefer AppSpinner')
class AppCircularProgress extends StatelessWidget {
  const AppCircularProgress({
    super.key,
    this.size,
    this.color,
    this.needElevation = false,
  });

  final double? size;
  final Color? color;
  final bool needElevation;

  @override
  Widget build(BuildContext context) {
    return AppSpinner(
      size: size,
      color: color,
      elevatedSurface: needElevation,
    );
  }
}
