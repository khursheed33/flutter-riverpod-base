import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_empty_state.dart';

@Deprecated('Use AppEmptyState')
class ResourceNotFound extends StatelessWidget {
  const ResourceNotFound({
    super.key,
    required this.title,
    this.icon,
    this.iconSize = 30,
    this.textColor,
  });

  final String title;
  final IconData? icon;
  final double iconSize;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return AppEmptyState(
      title: title,
      icon: icon ?? Icons.info_outline_rounded,
      iconSize: iconSize,
      isErrorStyle: true,
    );
  }
}
