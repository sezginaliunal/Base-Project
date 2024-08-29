import 'package:hive_flutter/hive_flutter.dart';
<<<<<<< HEAD
import 'package:test_project/core/config/constants/hive_boxes.dart';
import 'package:test_project/core/controllers/theme_controller.dart';
=======
import 'package:started_app/core/config/constants/hive_boxes.dart';
>>>>>>> Updated

Future<void> setupLocator() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveBoxConstants.theme.value);
}
