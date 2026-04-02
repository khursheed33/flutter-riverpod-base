import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_button.dart';

@Deprecated('Prefer AppButton from package:flutter_riverpod_base/core/design/design.dart')
class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.icon,
    this.color,
    this.radius,
    this.fontSize,
    this.iconSize,
    this.textColor,
    this.fontWeight,
    this.borderColor,
    required this.title,
    this.elevation = 0.0,
    this.iconRight = false,
    this.darkBorder = false,
    this.isLoading = false,
    this.lightBorder = false,
    required this.onPressed,
  });

  final Color? color;
  final String title;
  final double? radius;
  final IconData? icon;
  final bool? iconRight;
  final bool isLoading;
  final bool darkBorder;
  final double? iconSize;
  final Color? textColor;
  final double elevation;
  final double? fontSize;
  final bool lightBorder;
  final Color? borderColor;
  final FontWeight? fontWeight;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: title,
      onPressed: onPressed,
      isLoading: isLoading,
      icon: icon != null && iconRight != true ? icon : null,
      iconAfter: icon != null && iconRight == true ? icon : null,
      variant: darkBorder || lightBorder
          ? AppButtonVariant.outlined
          : AppButtonVariant.filled,
      expandWidth: true,
    );
  }
}
