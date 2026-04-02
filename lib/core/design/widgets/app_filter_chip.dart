import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_theme_context.dart';

class AppFilterChip extends StatelessWidget {
  const AppFilterChip({
    super.key,
    required this.label,
    required this.selected,
    this.onSelected,
    this.avatar,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool>? onSelected;
  final Widget? avatar;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
      avatar: avatar,
      showCheckmark: true,
    );
  }
}

class AppAssistChip extends StatelessWidget {
  const AppAssistChip({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
  });

  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dim = context.appDim;
    return ActionChip(
      avatar: icon != null ? Icon(icon, size: dim.iconSm) : null,
      label: Text(label),
      onPressed: onPressed,
    );
  }
}
