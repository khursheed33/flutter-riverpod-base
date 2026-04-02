import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

/// Layout sizes for icons, progress, avatars — injected via [AppUiDimensions] theme extension.
/// Widgets must use [BuildContext.appDim], not [AppUiDimensions.standard] fields directly.
@immutable
class AppUiDimensions extends ThemeExtension<AppUiDimensions> {
  const AppUiDimensions({
    required this.iconSm,
    required this.iconMd,
    required this.iconLg,
    required this.iconHero,
    required this.spinnerSm,
    required this.spinnerMd,
    required this.progressHeight,
    required this.progressHeightDense,
    required this.avatarSm,
    required this.avatarMd,
    required this.avatarInitialFontFactor,
    required this.dialogIconSize,
    required this.badgeFontSize,
    required this.badgeFontSizeDense,
    required this.fabInnerSpinnerSize,
    required this.fabStrokeWidth,
    required this.emptyStateIconSize,
    required this.datePickerIconSize,
  });

  final double iconSm;
  final double iconMd;
  final double iconLg;
  final double iconHero;
  final double spinnerSm;
  final double spinnerMd;
  final double progressHeight;
  final double progressHeightDense;
  final double avatarSm;
  final double avatarMd;
  /// Initials text size as a fraction of [AppAvatar] radius.
  final double avatarInitialFontFactor;
  final double dialogIconSize;
  final double badgeFontSize;
  final double badgeFontSizeDense;
  final double fabInnerSpinnerSize;
  final double fabStrokeWidth;
  final double emptyStateIconSize;
  final double datePickerIconSize;

  static AppUiDimensions standard() {
    return const AppUiDimensions(
      iconSm: 18,
      iconMd: 22,
      iconLg: 26,
      iconHero: 88,
      spinnerSm: 28,
      spinnerMd: 40,
      progressHeight: 4,
      progressHeightDense: 2,
      avatarSm: 22,
      avatarMd: 28,
      avatarInitialFontFactor: 0.85,
      dialogIconSize: 40,
      badgeFontSize: 12,
      badgeFontSizeDense: 11,
      fabInnerSpinnerSize: 26,
      fabStrokeWidth: 2.5,
      emptyStateIconSize: 48,
      datePickerIconSize: 26,
    );
  }

  @override
  AppUiDimensions copyWith({
    double? iconSm,
    double? iconMd,
    double? iconLg,
    double? iconHero,
    double? spinnerSm,
    double? spinnerMd,
    double? progressHeight,
    double? progressHeightDense,
    double? avatarSm,
    double? avatarMd,
    double? avatarInitialFontFactor,
    double? dialogIconSize,
    double? badgeFontSize,
    double? badgeFontSizeDense,
    double? fabInnerSpinnerSize,
    double? fabStrokeWidth,
    double? emptyStateIconSize,
    double? datePickerIconSize,
  }) {
    return AppUiDimensions(
      iconSm: iconSm ?? this.iconSm,
      iconMd: iconMd ?? this.iconMd,
      iconLg: iconLg ?? this.iconLg,
      iconHero: iconHero ?? this.iconHero,
      spinnerSm: spinnerSm ?? this.spinnerSm,
      spinnerMd: spinnerMd ?? this.spinnerMd,
      progressHeight: progressHeight ?? this.progressHeight,
      progressHeightDense: progressHeightDense ?? this.progressHeightDense,
      avatarSm: avatarSm ?? this.avatarSm,
      avatarMd: avatarMd ?? this.avatarMd,
      avatarInitialFontFactor: avatarInitialFontFactor ?? this.avatarInitialFontFactor,
      dialogIconSize: dialogIconSize ?? this.dialogIconSize,
      badgeFontSize: badgeFontSize ?? this.badgeFontSize,
      badgeFontSizeDense: badgeFontSizeDense ?? this.badgeFontSizeDense,
      fabInnerSpinnerSize: fabInnerSpinnerSize ?? this.fabInnerSpinnerSize,
      fabStrokeWidth: fabStrokeWidth ?? this.fabStrokeWidth,
      emptyStateIconSize: emptyStateIconSize ?? this.emptyStateIconSize,
      datePickerIconSize: datePickerIconSize ?? this.datePickerIconSize,
    );
  }

  @override
  ThemeExtension<AppUiDimensions> lerp(ThemeExtension<AppUiDimensions>? other, double t) {
    if (other is! AppUiDimensions) return this;
    return AppUiDimensions(
      iconSm: lerpDouble(iconSm, other.iconSm, t)!,
      iconMd: lerpDouble(iconMd, other.iconMd, t)!,
      iconLg: lerpDouble(iconLg, other.iconLg, t)!,
      iconHero: lerpDouble(iconHero, other.iconHero, t)!,
      spinnerSm: lerpDouble(spinnerSm, other.spinnerSm, t)!,
      spinnerMd: lerpDouble(spinnerMd, other.spinnerMd, t)!,
      progressHeight: lerpDouble(progressHeight, other.progressHeight, t)!,
      progressHeightDense: lerpDouble(progressHeightDense, other.progressHeightDense, t)!,
      avatarSm: lerpDouble(avatarSm, other.avatarSm, t)!,
      avatarMd: lerpDouble(avatarMd, other.avatarMd, t)!,
      avatarInitialFontFactor: lerpDouble(avatarInitialFontFactor, other.avatarInitialFontFactor, t)!,
      dialogIconSize: lerpDouble(dialogIconSize, other.dialogIconSize, t)!,
      badgeFontSize: lerpDouble(badgeFontSize, other.badgeFontSize, t)!,
      badgeFontSizeDense: lerpDouble(badgeFontSizeDense, other.badgeFontSizeDense, t)!,
      fabInnerSpinnerSize: lerpDouble(fabInnerSpinnerSize, other.fabInnerSpinnerSize, t)!,
      fabStrokeWidth: lerpDouble(fabStrokeWidth, other.fabStrokeWidth, t)!,
      emptyStateIconSize: lerpDouble(emptyStateIconSize, other.emptyStateIconSize, t)!,
      datePickerIconSize: lerpDouble(datePickerIconSize, other.datePickerIconSize, t)!,
    );
  }
}
