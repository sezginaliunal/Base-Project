import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/app/features/init/init_controller.dart';
import 'package:test_project/core/config/theme/theme_controller.dart';

class InitPage extends GetView<InitController> {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switcher Demo'),
        actions: [
          IconButton(
            onPressed: () => _showThemeSelector(context, themeController),
            icon: const Icon(Icons.color_lens),
          ),
        ],
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: IconButton(
                onPressed: themeController.switchTheme,
                icon: Icon(
                  _getIconForTheme(themeController.currentTheme),
                  size: 40,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.all(16),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'This is a Card Widget',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('aaaa')),
            Container(
              height: 100,
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'This is a Container',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// BottomSheet for theme selection
  void _showThemeSelector(
    BuildContext context,
    ThemeController themeController,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: AppTheme.values.map((theme) {
              return ListTile(
                leading: Icon(_getIconForTheme(theme)),
                title: Text(theme.toString().split('.').last),
                onTap: () {
                  themeController.setTheme(theme);
                  Get.back(); // Close the BottomSheet
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  /// Get Icon for each theme
  IconData _getIconForTheme(AppTheme theme) {
    switch (theme) {
      case AppTheme.Light:
        return Icons.light_mode;
      case AppTheme.Dark:
        return Icons.dark_mode;

      default:
        return Icons.light_mode;
    }
  }
}
