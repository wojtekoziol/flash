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
    _emitPrevState();
  }

  final box = Hive.box<String>(kProfileBox);

  Future<void> _emitPrevState() async {
    final jsonString = box.get(kStateKey);
    if (jsonString == null) return;
    final prevState = ProfileState.fromJson(
      json.decode(jsonString) as Map<String, dynamic>,
    );
    final nextState = prevState.map(
      notCreated: (value) => value,
      created: (value) {
        final studiedCards = int.parse(box.get(_getDateKey()) ?? '0');
        return value.copyWith(studiedCards: studiedCards);
      },
    );
    emit(nextState);
    await _clearBox();
  }

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

  Future<void> saveStudiedCards(int n) async {
    final s = state.mapOrNull(created: (s) => s);
    if (s == null) return;
    final key = _getDateKey();
    final prevStudiedCards = int.parse(box.get(key) ?? '0');
    final studiedCards = prevStudiedCards + n;
    await box.put(key, '$studiedCards');
    emit(s.copyWith(studiedCards: studiedCards));
  }

  String _getDateKey() {
    final now = DateTime.now();
    final key = '${now.day}-${now.month}-${now.year}';
    return key;
  }

  Future<void> _clearBox() async {
    final stateJsonString = box.get(kStateKey);
    final dateKey = _getDateKey();
    final studiedCards = box.get(dateKey);
    await box.clear();
    if (stateJsonString != null) {
      await box.put(kStateKey, stateJsonString);
    }
    if (studiedCards != null) {
      await box.put(dateKey, studiedCards);
    }
  }
}
