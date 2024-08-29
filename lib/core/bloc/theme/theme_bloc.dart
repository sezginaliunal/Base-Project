import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:test_project/core/config/constants/hive_boxes.dart';
import 'package:test_project/core/config/theme/base_theme.dart';

enum AppTheme { Light, Dark }

// ThemeCubit sınıfı, temayı yönetmek için kullanılır
class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(AppTheme.Light) {
    final themeIndex =
        box.get(HiveBoxConstants.theme.value, defaultValue: 0) as int;
    emit(AppTheme.values[themeIndex]);
  }

  final Box<dynamic> box = Hive.box(HiveBoxConstants.theme.value);

  /// Tema ayarlama metodu
  void setTheme(AppTheme theme) {
    emit(theme);
    box.put(HiveBoxConstants.theme.value, theme.index);
  }

  /// Temayı değiştirme metodu
  void switchTheme() {
    final newTheme = state == AppTheme.Light ? AppTheme.Dark : AppTheme.Light;
    emit(newTheme);
    box.put(HiveBoxConstants.theme.value, newTheme.index);
  }

  /// Geçerli tema verisini alma
  ThemeData getThemeData() {
    switch (state) {
      case AppTheme.Light:
        return Themes().lightTheme;
      case AppTheme.Dark:
        return Themes().darkTheme;
      default:
        return Themes().lightTheme;
    }
  }

  /// Karanlık modda olup olmadığını kontrol etme
  bool isDarkMode() => state == AppTheme.Dark;
}
