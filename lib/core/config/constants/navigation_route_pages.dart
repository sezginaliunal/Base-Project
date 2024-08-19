import 'package:get/get.dart';
import 'package:test_project/app/features/splash/splash_view.dart';
import 'package:test_project/core/components/unknown_view.dart';
import 'package:test_project/core/config/constants/navigation_routes.dart';

class AppRouter {
  // Singleton instance
  factory AppRouter() => _instance;
  AppRouter._privateConstructor();
  static final AppRouter _instance = AppRouter._privateConstructor();

  // GetPages listesi ile rotaları tanımlıyoruz
  List<GetPage<dynamic>> getPages = [
    GetPage(
      name: RoutesName.INITIAL_ROUTE,
      page: SplashView.new,
    ),

    // Tanımlanmayan rotalar için bir yönlendirme yapıyoruz
    GetPage(
      name: RoutesName.UNKNOWN,
      page: () => const UnknownView(),
    ),
  ];
}
