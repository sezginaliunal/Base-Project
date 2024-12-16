import 'package:flutter/material.dart';
import 'package:test_project/core/config/theme/color_schemes.dart';
import 'package:test_project/core/config/theme/colors/dark_colors.dart';
import 'package:test_project/core/config/theme/colors/light_colors.dart';

class AppThemes {
  static ThemeData get light => ThemeData(
        fontFamily: 'Kanit',
        useMaterial3: true,
        colorScheme: AppColorScheme.light,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: LightColors.appBarColor,
        ),
        cardTheme: const CardTheme(
          color: LightColors.cardColor,
          shadowColor: LightColors.cardShadowColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: LightColors.buttonColor,
            foregroundColor: LightColors.background,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: LightColors.bottomNavBarColor,
          selectedItemColor: LightColors.bottomNavBarSelectedColor,
          unselectedItemColor: LightColors.bottomNavBarUnselectedColor,
        ),
        dividerColor: LightColors.dividerColor,
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        fontFamily: 'Kanit',
        colorScheme: AppColorScheme.dark,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: DarkColors.appBarColor,
        ),
        cardTheme: const CardTheme(
          elevation: 2,
          margin: EdgeInsets.all(8),
          color: DarkColors.cardColor,
          shadowColor: DarkColors.cardShadowColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            backgroundColor: DarkColors.buttonColor,
            foregroundColor: DarkColors.buttonTextColor,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: DarkColors.bottomNavBarColor,
          selectedItemColor: DarkColors.bottomNavBarSelectedColor,
          unselectedItemColor: DarkColors.bottomNavBarUnselectedColor,
        ),
        dividerColor: DarkColors.dividerColor,
      );
}
