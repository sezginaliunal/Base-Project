import 'package:flutter/material.dart';
import 'package:test_project/core/config/theme/colors/dark_colors.dart';
import 'package:test_project/core/config/theme/colors/light_colors.dart';

class AppColorScheme {
  static ColorScheme get light => const ColorScheme(
        brightness: Brightness.light,
        primary: LightColors.primary,
        onPrimary: LightColors.onPrimary,
        primaryContainer: LightColors.primaryContainer,
        onPrimaryContainer: LightColors.onPrimaryContainer,
        secondary: LightColors.secondary,
        onSecondary: LightColors.onSecondary,
        secondaryContainer: LightColors.secondaryContainer,
        onSecondaryContainer: LightColors.onSecondaryContainer,
        surface: LightColors.surface,
        onSurface: LightColors.onSurface,
        error: LightColors.error,
        onError: LightColors.onError,
        errorContainer: LightColors.errorContainer,
        onErrorContainer: LightColors.onErrorContainer,
      );

  static ColorScheme get dark => const ColorScheme(
        brightness: Brightness.dark,
        primary: DarkColors.primary,
        onPrimary: DarkColors.onPrimary,
        primaryContainer: DarkColors.primaryContainer,
        onPrimaryContainer: DarkColors.onPrimaryContainer,
        secondary: DarkColors.secondary,
        onSecondary: DarkColors.onSecondary,
        secondaryContainer: DarkColors.secondaryContainer,
        onSecondaryContainer: DarkColors.onSecondaryContainer,
        surface: DarkColors.surface,
        onSurface: DarkColors.onSurface,
        error: DarkColors.error,
        onError: DarkColors.onError,
        errorContainer: DarkColors.errorContainer,
        onErrorContainer: DarkColors.onErrorContainer,
      );
}
