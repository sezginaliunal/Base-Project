import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/app/features/splash/splash_controller.dart';
import 'package:test_project/app/todo/todo_service.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final ts = TodoService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: ts.fetchAllTodos,
          child: const Text('data'),
        ),
      ),
    );
  }
}
