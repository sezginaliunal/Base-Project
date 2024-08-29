import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:get/get.dart';
import 'package:test_project/core/config/constants/app_infos.dart';
import 'package:test_project/core/config/constants/navigation_route_pages.dart';
import 'package:test_project/core/config/constants/navigation_routes.dart';
import 'package:test_project/core/controllers/theme_controller.dart';
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:started_app/app/features/todo/todo_bloc.dart';
import 'package:started_app/app/features/todo/todo_service.dart';
import 'package:started_app/core/bloc/theme/theme_bloc.dart';
import 'package:started_app/core/config/constants/app_infos.dart';
import 'package:started_app/core/config/constants/navigation_route_pages.dart';
import 'package:started_app/core/config/constants/navigation_routes.dart';
>>>>>>> Updated

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
