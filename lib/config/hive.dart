import 'dart:io';

import 'package:flash/config/constants.dart';
import 'package:flash/data/bloc/user/user_cubit.dart';
import 'package:flash/data/models/deck.dart';
import 'package:flash/data/models/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserStateAdapter()); // typeId: 0
  Hive.registerAdapter(UserAdapter()); // typeId: 1
  Hive.registerAdapter(DeckAdapter()); // typeId: 2
  Hive.registerAdapter(FileAdapter()); // typeId: 3

  await Hive.openBox<Object>(kProfileBox);
}

class FileAdapter extends TypeAdapter<File> {
  @override
  int get typeId => 3;

  @override
  File read(BinaryReader reader) {
    return File(reader.read() as String);
  }

  @override
  void write(BinaryWriter writer, File obj) {
    writer.write(obj.path);
  }
}
