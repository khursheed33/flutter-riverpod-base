import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.filled = false,
    this.size = 40,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final bool filled;
  final double size;

  @override
  Widget build(BuildContext context) {
    final child = Icon(icon, size: size * 0.5);
    Widget btn = filled
        ? IconButton.filled(
            onPressed: onPressed,
            icon: child,
            style: IconButton.styleFrom(
              minimumSize: Size(size, size),
              maximumSize: Size(size, size),
            ),
          )
        : IconButton(
            onPressed: onPressed,
            icon: child,
            style: IconButton.styleFrom(
              minimumSize: Size(size, size),
              maximumSize: Size(size, size),
            ),
          );
    if (tooltip != null) {
      btn = Tooltip(message: tooltip!, child: btn);
    }
    return btn;
  }
}
