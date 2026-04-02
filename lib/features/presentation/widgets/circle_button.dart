import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_primary_fab.dart';

@Deprecated('Use AppPrimaryFab')
class AppNextButtonCircle extends StatelessWidget {
  const AppNextButtonCircle({
    super.key,
    this.backgroundColor,
    this.iconColor,
    this.isBusy = false,
    required this.onPressed,
  });

  final Color? backgroundColor;
  final Color? iconColor;
  final bool isBusy;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppPrimaryFab(
      onPressed: onPressed,
      isBusy: isBusy,
      backgroundColor: backgroundColor,
      foregroundColor: iconColor,
    );
  }
}
