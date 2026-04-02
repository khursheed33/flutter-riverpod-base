/// Font sizes used only by [AppTheme] to build [TextTheme].
/// Widgets should read styles via `Theme.of(context).textTheme`, not these constants.
abstract final class AppTypographyScale {
  static const double displayLarge = 57;
  static const double displaySmall = 36;
  static const double headlineSmall = 24;
  static const double titleLarge = 22;
  static const double titleMedium = 18;
  static const double titleSmall = 16;
  static const double bodyLarge = 16;
  static const double bodyMedium = 14;
  static const double bodySmall = 12;
  static const double labelLarge = 14;
  static const double labelMedium = 12;
  static const double labelSmall = 11;
  /// Legacy [AppTitle] default (muted heading).
  static const double legacyTitle = 20;
}

/// Alpha values for semantic layering — used only when building [ThemeData] / extensions.
abstract final class AppAlpha {
  static const double mutedForeground = 0.45;
  static const double secondaryForeground = 0.65;
  static const double borderSubtle = 0.35;
  static const double borderMedium = 0.5;
  static const double overlaySubtle = 0.1;
}
