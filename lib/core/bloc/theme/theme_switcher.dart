// Tema değişimini dinleyen widget
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:started_app/core/bloc/theme/theme_bloc.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, theme) {
        return MaterialApp(
          theme: context.read<ThemeCubit>().getThemeData(),
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Theme Switcher'),
            ),
            body: Center(
              child: ElevatedButton(
                onPressed: () => context.read<ThemeCubit>().switchTheme(),
                child: const Text('Switch Theme'),
              ),
            ),
          ),
        );
      },
    );
  }
}
