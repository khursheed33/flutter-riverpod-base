import 'package:flutter/material.dart';

/// Large decorative icon for empty auth / onboarding headers.
class AppHeroIconHeader extends StatelessWidget {
  const AppHeroIconHeader({
    super.key,
    required this.icon,
    this.size = 88,
    this.paddingTop = 0,
  });

  final IconData icon;
  final double size;
  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Icon(icon, size: size, color: cs.primary.withValues(alpha: 0.9)),
    );
  }
}
