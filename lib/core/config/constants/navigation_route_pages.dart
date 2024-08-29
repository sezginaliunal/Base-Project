import 'package:flutter/material.dart';
import 'package:test_project/app/features/todo/todo_view.dart';
import 'package:test_project/core/components/unknown_view.dart';
import 'package:test_project/core/config/constants/navigation_routes.dart';

class AppRouter {
  // Singleton instance
  factory AppRouter() => _instance;
  AppRouter._privateConstructor();
  static final AppRouter _instance = AppRouter._privateConstructor();

  // Route generator
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.INITIAL_ROUTE:
        return MaterialPageRoute(builder: (_) => const TodoPage());
      case RoutesName.TEST_VIEW:
        return MaterialPageRoute(builder: (_) => const TodoPage());

      // final data = settings.arguments as String?; // Data alıyoruz
      // return MaterialPageRoute(
      //   builder: (_) =>
      //       TestView(data: data), // Data'yı TestView'e geçiriyoruz
      // );

      default:
        return MaterialPageRoute(builder: (_) => const UnknownView());
    }
  }

  // Unknown route handling
  Route<dynamic> unknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => const UnknownView());
  }
}
