import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_theme_context.dart';
import 'package:flutter_riverpod_base/core/design/app_typography_scale.dart';
import 'package:flutter_riverpod_base/core/enums/font_type.dart';

/// Typography role when not using [AppTitleVariant.legacy].
enum AppTitleVariant {
  /// Previous default: muted color, 20px — keeps existing screens stable.
  legacy,
  display,
  headline,
  title,
  body,
  label,
  caption,
}

/// Theme-aware text with optional typography role. Uses `app_` prefix per project convention.
///
/// Defaults preserve the original [AppTitle] appearance ([AppTitleVariant.legacy]).
class AppTitle extends StatelessWidget {
  const AppTitle(
    this.title, {
    super.key,
    this.variant = AppTitleVariant.legacy,
    this.style,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.textAlign,
    this.letterSpacing,
    this.fontWeight,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
  });

  final String title;
  final AppTitleVariant variant;
  final TextStyle? style;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final String? semanticsLabel;

  TextStyle? _themedStyle(TextTheme t) {
    return switch (variant) {
      AppTitleVariant.legacy => null,
      AppTitleVariant.display => t.displaySmall,
      AppTitleVariant.headline => t.headlineSmall,
      AppTitleVariant.title => t.titleMedium,
      AppTitleVariant.body => t.bodyLarge,
      AppTitleVariant.label => t.labelLarge,
      AppTitleVariant.caption => t.bodySmall,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (variant == AppTitleVariant.legacy) {
      final legacy = context.appTextOverrides.legacyTitle;
      return Text(
        title,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        semanticsLabel: semanticsLabel,
        style: legacy.merge(style).copyWith(
              fontFamily: fontFamily ?? FontType.Sarabun.name,
              color: color ?? legacy.color,
              fontWeight: fontWeight ?? legacy.fontWeight,
              fontSize: fontSize ?? legacy.fontSize,
              letterSpacing: letterSpacing,
            ),
      );
    }

    final base = _themedStyle(theme.textTheme);
    final fallback = theme.textTheme.bodyLarge ??
        TextStyle(
          fontSize: AppTypographyScale.bodyLarge,
          color: theme.colorScheme.onSurface
              .withValues(alpha: AppAlpha.secondaryForeground),
        );
    final merged = base?.merge(style).copyWith(
          color: color ?? base.color,
          fontSize: fontSize,
          fontFamily: fontFamily ?? FontType.Sarabun.name,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
        ) ??
        fallback.merge(style).copyWith(
              color: color,
              fontSize: fontSize,
              fontFamily: fontFamily ?? FontType.Sarabun.name,
              fontWeight: fontWeight ?? FontWeight.w400,
              letterSpacing: letterSpacing,
            );

    return Text(
      title,
      style: merged,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
    );
  }
}
