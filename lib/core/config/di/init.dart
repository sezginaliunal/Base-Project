import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_project/core/config/constants/hive_boxes.dart';

Future<void> setupLocator() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveBoxConstants.theme.value);
}
