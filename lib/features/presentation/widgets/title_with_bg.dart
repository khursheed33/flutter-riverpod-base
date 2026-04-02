import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_title_banner.dart';
import 'package:flutter_riverpod_base/features/presentation/widgets/app_title.dart';

@Deprecated('Use AppTitleBanner')
class AppTitleWithBG extends StatelessWidget {
  const AppTitleWithBG({
    super.key,
    this.bgColor,
    required this.title,
    this.fontSize,
    this.textAlign,
  });

  final Color? bgColor;
  final String title;
  final double? fontSize;
  final AlignmentGeometry? textAlign;

  @override
  Widget build(BuildContext context) {
    return AppTitleBanner(
      title: title,
      backgroundColor: bgColor,
      alignment: textAlign ?? Alignment.centerLeft,
      titleVariant: AppTitleVariant.legacy,
      fontSize: fontSize,
    );
  }
}
