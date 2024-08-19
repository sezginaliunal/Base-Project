import 'package:get/get.dart';
import 'package:test_project/app/features/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(SplashController.new);
  }
}
