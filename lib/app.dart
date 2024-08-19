import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/core/config/constants/app_infos.dart';
import 'package:test_project/core/config/constants/navigation_route_pages.dart';
import 'package:test_project/core/config/constants/navigation_routes.dart';
import 'package:test_project/core/controllers/theme_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(
      () => GetMaterialApp(
        title: AppInfos.appName,
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.INITIAL_ROUTE,
        theme: themeController.getThemeData(),
        getPages: AppRouter().getPages,
      ),
    );
  }
}
