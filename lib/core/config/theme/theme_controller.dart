import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:test_project/core/config/app_theme.dart';
import 'package:test_project/core/config/constants/hive_boxes.dart';

enum AppTheme { Light, Dark, Blue, Red }

class ThemeController extends GetxController {
  ThemeController() {
    final themeIndex =
        box.get(HiveBoxConstants.theme.value, defaultValue: 0) as int;
    _currentTheme.value = AppTheme.values[themeIndex];
  }
  // Reactive property for current theme
  final _currentTheme = AppTheme.Light.obs;

  final Box<dynamic> box = Hive.box(HiveBoxConstants.theme.value);

  ///Get current theme
  AppTheme get currentTheme => _currentTheme.value;

  ///Set Theme Method
  void setTheme(AppTheme theme) {
    _currentTheme.value = theme;
    box.put(HiveBoxConstants.theme.value, theme.index);
  }

  ///Get Theme Data
  ThemeData getThemeData() {
    switch (_currentTheme.value) {
      case AppTheme.Light:
        return AppThemes.light;
      case AppTheme.Dark:
        return AppThemes.dark;
      case AppTheme.Blue:
        return AppThemes.blue;
      case AppTheme.Red:
        return AppThemes.red;
      default:
        return AppThemes.light;
    }
  }

  ///Switch Theme method
  void switchTheme() {
    // Şu anki temanın indexini al
    final currentIndex = _currentTheme.value.index;

    // Sonraki temanın indexini belirle, eğer son temadaysa sıfırla
    final nextIndex = (currentIndex + 1) % AppTheme.values.length;

    // Yeni temayı ayarla
    _currentTheme.value = AppTheme.values[nextIndex];

    // Hive'a yeni temayı kaydet
    box.put(HiveBoxConstants.theme.value, _currentTheme.value.index);
  }

  ///isDarkMode bool value
  bool isDarkMode() => _currentTheme.value == AppTheme.Dark;
}
