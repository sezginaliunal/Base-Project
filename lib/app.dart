import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app/features/todo/todo_bloc.dart';
import 'package:test_project/app/features/todo/todo_service.dart';
import 'package:test_project/core/bloc/theme/theme_bloc.dart';
import 'package:test_project/core/config/constants/app_infos.dart';
import 'package:test_project/core/config/constants/navigation_route_pages.dart';
import 'package:test_project/core/config/constants/navigation_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoBloc(todoService: TodoService()),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(), // ThemeCubit ekleniyor
        ),
      ],
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: (context, theme) {
          return MaterialApp(
            title: AppInfos.appName,
            debugShowCheckedModeBanner: false,
            theme: context
                .read<ThemeCubit>()
                .getThemeData(), // Tema verisi buradan alınır
            initialRoute: RoutesName.INITIAL_ROUTE,
            onGenerateRoute: AppRouter().generateRoute,
            onUnknownRoute: AppRouter().unknownRoute,
          );
        },
      ),
    );
  }
}
