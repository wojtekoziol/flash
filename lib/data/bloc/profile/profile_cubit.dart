import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flash/config/constants.dart';
import 'package:flash/data/models/deck.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';
part 'profile_cubit.g.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.notCreated()) {
    final prev = box.get(kStateKey);
    if (prev == null) return;
    final j = json.decode(prev) as Map<String, dynamic>;
    emit(ProfileState.fromJson(j));
  }

  final box = Hive.box<String>(kProfileBox);

  @override
  void onChange(Change<ProfileState> change) {
    super.onChange(change);
    final jsonString = json.encode(change.nextState.toJson());
    box.put(kStateKey, jsonString);
  }

  void create({required String nickname}) {
    emit(ProfileState.created(nickname: nickname));
  }

  void update({required String nickname}) {
    state.map(
      notCreated: (_) => create(nickname: nickname),
      created: (s) => emit(s.copyWith(nickname: nickname)),
    );
  }
}
