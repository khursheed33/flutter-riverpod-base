import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_text_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@Deprecated('Use AppTextIconButton')
class AppCreateNewButton extends StatelessWidget {
  const AppCreateNewButton({
    super.key,
    required this.onPressed,
    this.title,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.iconSize,
  });

  final VoidCallback? onPressed;
  final String? title;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).textTheme.labelLarge;
    return AppTextIconButton(
      label: title ?? 'New',
      onPressed: onPressed,
      icon: icon ?? FontAwesomeIcons.circlePlus,
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
      iconSize: iconSize,
      textStyle: (fontSize != null || fontWeight != null)
          ? base?.copyWith(fontSize: fontSize, fontWeight: fontWeight)
          : null,
    );
  }
}
