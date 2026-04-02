import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_theme_context.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.image,
    this.initials,
    this.radius = 22,
    this.backgroundColor,
  });

  final ImageProvider? image;
  final String? initials;
  final double radius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    if (image != null) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: image,
      );
    }
    final text = (initials == null || initials!.isEmpty) ? '?' : initials!.substring(0, 1).toUpperCase();
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? cs.primaryContainer,
      foregroundColor: cs.onPrimaryContainer,
      child: Text(
        text,
        style: (Theme.of(context).textTheme.titleSmall ??
                TextStyle(color: cs.onPrimaryContainer))
            .copyWith(
              fontSize: radius * context.appDim.avatarInitialFontFactor,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
