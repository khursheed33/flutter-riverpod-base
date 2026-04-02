import 'package:flutter/material.dart';

/// Spacing scale for padding, margin, and gaps.
abstract final class AppSpace {
  static const double xxs = 2;
  static const double xs = 6;
  static const double sm = 10;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

/// Corner radii for surfaces and controls.
abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double pill = 999;
}

/// Standard animation durations.
abstract final class AppMotion {
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 250);
}

/// T-shirt sizes for buttons and fields.
enum AppControlSize { sm, md, lg }

double appControlHeight(AppControlSize size) {
  return switch (size) {
    AppControlSize.sm => 36,
    AppControlSize.md => 48,
    AppControlSize.lg => 56,
  };
}

EdgeInsets appSymmetricPadding({
  double horizontal = AppSpace.md,
  double vertical = AppSpace.sm,
}) =>
    EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

/// Border / focus ring widths — use in [AppTheme] only unless building custom borders.
abstract final class AppStroke {
  static const double thin = 1;
  static const double focus = 2;
}
