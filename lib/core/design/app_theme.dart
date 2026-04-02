import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_text_overrides.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';
import 'package:flutter_riverpod_base/core/design/app_typography_scale.dart';
import 'package:flutter_riverpod_base/core/design/app_ui_dimensions.dart';

/// Light/dark [ThemeData] — single place for colors, typography, and component sizing.
abstract final class AppTheme {
  static const Color _seed = Color(0xFF2563EB);

  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(
      seedColor: _seed,
      brightness: Brightness.light,
    );
    return _base(scheme: scheme);
  }

  static ThemeData dark() {
    final scheme = ColorScheme.fromSeed(
      seedColor: _seed,
      brightness: Brightness.dark,
    );
    return _base(scheme: scheme);
  }

  static TextTheme _textTheme(ColorScheme scheme) {
    final on = scheme.onSurface;
    final onVar = scheme.onSurfaceVariant;
    return TextTheme(
      displaySmall: TextStyle(
        fontSize: AppTypographyScale.displaySmall,
        fontWeight: FontWeight.w400,
        height: 1.2,
        color: on,
      ),
      headlineSmall: TextStyle(
        fontSize: AppTypographyScale.headlineSmall,
        fontWeight: FontWeight.w600,
        color: on,
      ),
      titleLarge: TextStyle(
        fontSize: AppTypographyScale.titleLarge,
        fontWeight: FontWeight.w600,
        color: on,
      ),
      titleMedium: TextStyle(
        fontSize: AppTypographyScale.titleMedium,
        fontWeight: FontWeight.w600,
        color: on,
      ),
      titleSmall: TextStyle(
        fontSize: AppTypographyScale.titleSmall,
        fontWeight: FontWeight.w600,
        color: on,
      ),
      bodyLarge: TextStyle(
        fontSize: AppTypographyScale.bodyLarge,
        fontWeight: FontWeight.w400,
        color: on,
      ),
      bodyMedium: TextStyle(
        fontSize: AppTypographyScale.bodyMedium,
        fontWeight: FontWeight.w400,
        color: on,
      ),
      bodySmall: TextStyle(
        fontSize: AppTypographyScale.bodySmall,
        fontWeight: FontWeight.w400,
        color: onVar,
      ),
      labelLarge: TextStyle(
        fontSize: AppTypographyScale.labelLarge,
        fontWeight: FontWeight.w600,
        color: on,
      ),
      labelMedium: TextStyle(
        fontSize: AppTypographyScale.labelMedium,
        fontWeight: FontWeight.w500,
        color: onVar,
      ),
      labelSmall: TextStyle(
        fontSize: AppTypographyScale.labelSmall,
        fontWeight: FontWeight.w500,
        color: onVar,
      ),
    );
  }

  static ThemeData _base({required ColorScheme scheme}) {
    final textTheme = _textTheme(scheme);
    final radius = BorderRadius.circular(AppRadius.md);
    final dims = AppUiDimensions.standard();
    final textOverrides = AppTextOverrides.fromScheme(scheme, textTheme);
    // Use width 0 — [Size.fromHeight] sets width to infinity and breaks AppBar [TextButton] actions.
    final buttonMinSize = Size(0, appControlHeight(AppControlSize.md));

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: scheme.surface,
      splashFactory: InkSparkle.splashFactory,
      extensions: <ThemeExtension<dynamic>>[
        dims,
        textOverrides,
      ],
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 2,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: scheme.surfaceTint,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          side: BorderSide(
            color: scheme.outlineVariant.withValues(alpha: AppAlpha.borderSubtle),
          ),
        ),
        color: scheme.surfaceContainerLow,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: buttonMinSize,
          padding: appSymmetricPadding(horizontal: AppSpace.lg, vertical: AppSpace.sm),
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: buttonMinSize,
          padding: appSymmetricPadding(horizontal: AppSpace.lg, vertical: AppSpace.sm),
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: buttonMinSize,
          padding: appSymmetricPadding(horizontal: AppSpace.md, vertical: AppSpace.xs),
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(borderRadius: radius),
        enabledBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(
            color: scheme.outline.withValues(alpha: AppAlpha.borderMedium),
            width: AppStroke.thin,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: scheme.primary, width: AppStroke.focus),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: scheme.error, width: AppStroke.focus),
        ),
        contentPadding: appSymmetricPadding(horizontal: AppSpace.md, vertical: AppSpace.sm),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: AppSpace.xs),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant.withValues(alpha: AppAlpha.borderMedium),
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
      ),
    );
  }
}
