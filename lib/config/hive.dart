import 'package:flash/config/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(kProfileBox);
}
