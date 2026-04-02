import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';
import 'package:flutter_riverpod_base/features/presentation/widgets/app_title.dart';

/// Title on a soft tinted strip — section headers, banners.
class AppTitleBanner extends StatelessWidget {
  const AppTitleBanner({
    super.key,
    required this.title,
    this.backgroundColor,
    this.alignment = Alignment.centerLeft,
    this.padding,
    this.titleVariant = AppTitleVariant.title,
    this.fontSize,
  });

  final String title;
  final Color? backgroundColor;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry? padding;
  final AppTitleVariant titleVariant;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSpace.xs),
      alignment: alignment,
      padding: padding ?? const EdgeInsets.symmetric(vertical: AppSpace.sm, horizontal: AppSpace.sm),
      decoration: BoxDecoration(
        color: backgroundColor ?? cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: AppTitle(title, variant: titleVariant, fontSize: fontSize),
    );
  }
}
