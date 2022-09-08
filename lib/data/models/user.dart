import 'dart:io';

import 'package:flash/data/models/deck.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @HiveType(typeId: 1)
  const factory User({
    @HiveField(0) required String nickname,
    @HiveField(1) @JsonKey(ignore: true) File? profilePictureFile,
    @HiveField(2) @Default([]) List<Deck> decks,
  }) = _User;
}
