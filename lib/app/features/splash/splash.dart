import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:started_app/core/config/constants/navigation_routes.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              context.route.navigateName(RoutesName.TEST_VIEW, data: ''),
          child: const Text('data'),
        ),
      ),
    );
  }
}

class TestView extends StatelessWidget {
  // Veriyi tutacak bir alan
  const TestView({super.key, this.data});
  final String? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data ?? 'No data'), // Veriyi ekrana basıyoruz
      ),
    );
  }
}
