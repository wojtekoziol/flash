import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flash/config/constants.dart';
import 'package:flash/data/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';
part 'user_cubit.g.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState.notCreated()) {
    _emitPrevState();
  }

  final box = Hive.box<Object>(kProfileBox);

  Future<void> _emitPrevState() async {
    final prevState = box.get(kStateKey) as UserState?;
    if (prevState == null) return;
    final nextState = prevState.map(
      notCreated: (value) => value,
      created: (value) {
        final studiedCards = box.get(_getDateKey()) as int? ?? 0;
        return value.copyWith(studiedCards: studiedCards);
      },
    );
    emit(nextState);
    await _clearBox();
  }

  @override
  void onChange(Change<UserState> change) {
    super.onChange(change);
    box.put(kStateKey, change.nextState);
  }

  void create({required String nickname}) {
    emit(UserState.created(user: User(nickname: nickname)));
  }

  void update({String? nickname, File? profilePictureFile}) {
    state.when(
      notCreated: () {
        if (nickname == null) return;
        create(nickname: nickname);
      },
      created: (user, studiedCards) {
        emit(UserState.created(
          user: User(
            nickname: nickname ?? user.nickname,
            profilePictureFile: profilePictureFile ?? user.profilePictureFile,
          ),
          studiedCards: studiedCards,
        ));
      },
    );
  }

  Future<void> saveStudiedCards(int n) async {
    final s = state.mapOrNull(created: (s) => s);
    if (s == null) return;
    final key = _getDateKey();
    final prevStudiedCards = box.get(key) as int? ?? 0;
    final studiedCards = prevStudiedCards + n;
    await box.put(key, studiedCards);
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
