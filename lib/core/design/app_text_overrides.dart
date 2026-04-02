import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_typography_scale.dart';

/// Extra text styles not covered by standard [TextTheme] roles.
@immutable
class AppTextOverrides extends ThemeExtension<AppTextOverrides> {
  const AppTextOverrides({
    required this.legacyTitle,
    required this.sectionHeader,
    required this.dialogBody,
    required this.dropdownValue,
  });

  /// Previous default [AppTitle] look.
  final TextStyle legacyTitle;

  /// [AppSectionHeader] title line.
  final TextStyle sectionHeader;

  /// [AppDialog] subtitle.
  final TextStyle dialogBody;

  /// [AppDropdownSheetField] value line.
  final TextStyle dropdownValue;

  static AppTextOverrides fromScheme(ColorScheme scheme, TextTheme textTheme) {
    final onVar = scheme.onSurfaceVariant;
    final onSurf = scheme.onSurface;
    return AppTextOverrides(
      legacyTitle: TextStyle(
        fontSize: AppTypographyScale.legacyTitle,
        fontWeight: FontWeight.w400,
        color: onSurf.withValues(alpha: AppAlpha.mutedForeground),
      ),
      sectionHeader: textTheme.titleSmall ?? TextStyle(
        fontSize: AppTypographyScale.titleSmall,
        fontWeight: FontWeight.w600,
        color: onSurf,
      ),
      dialogBody: textTheme.bodyMedium?.copyWith(
        fontSize: AppTypographyScale.bodyMedium,
        color: onVar,
      ) ??
          TextStyle(
            fontSize: AppTypographyScale.bodyMedium,
            color: onVar,
          ),
      dropdownValue: textTheme.bodyLarge?.copyWith(
        fontSize: AppTypographyScale.bodyLarge,
        color: onSurf,
      ) ??
          TextStyle(fontSize: AppTypographyScale.bodyLarge, color: onSurf),
    );
  }

  @override
  AppTextOverrides copyWith({
    TextStyle? legacyTitle,
    TextStyle? sectionHeader,
    TextStyle? dialogBody,
    TextStyle? dropdownValue,
  }) {
    return AppTextOverrides(
      legacyTitle: legacyTitle ?? this.legacyTitle,
      sectionHeader: sectionHeader ?? this.sectionHeader,
      dialogBody: dialogBody ?? this.dialogBody,
      dropdownValue: dropdownValue ?? this.dropdownValue,
    );
  }

  @override
  ThemeExtension<AppTextOverrides> lerp(ThemeExtension<AppTextOverrides>? other, double t) {
    if (other is! AppTextOverrides) return this;
    return AppTextOverrides(
      legacyTitle: TextStyle.lerp(legacyTitle, other.legacyTitle, t)!,
      sectionHeader: TextStyle.lerp(sectionHeader, other.sectionHeader, t)!,
      dialogBody: TextStyle.lerp(dialogBody, other.dialogBody, t)!,
      dropdownValue: TextStyle.lerp(dropdownValue, other.dropdownValue, t)!,
    );
  }
}
