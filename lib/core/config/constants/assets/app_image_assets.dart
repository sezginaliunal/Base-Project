import 'package:test_project/core/config/constants/app/app_infos.dart';

enum AppImageAssets {
  logo('logo.png'),
  background('background.jpg'),
  avatarPlaceholder('avatar_placeholder.png');

  final String fileName;

  const AppImageAssets(this.fileName);

  String get path => '${AppInfos.imagesBase}$fileName';
}
