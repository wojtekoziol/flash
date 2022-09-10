import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clock/clock.dart';
import 'package:flash/config/constants.dart';
import 'package:flash/data/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';
part 'user_cubit.g.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.box) : super(const UserState.notCreated()) {
    _emitPrevState();
  }

  final Box<Object> box;

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
  }

  @override
  void onChange(Change<UserState> change) {
    super.onChange(change);
    box.put(kStateKey, change.nextState);
  }

  void create({required String nickname}) {
    final isCreated = state.mapOrNull(created: (_) => true) ?? false;
    if (isCreated) return;
    emit(UserState.created(user: User(nickname: nickname)));
  }

  void update({String? nickname, File? profilePictureFile}) {
    final created = state.mapOrNull(created: (s) => s);
    if (created == null) return;
    final newState = created.copyWith(
      user: created.user.copyWith(
        nickname: nickname ?? created.user.nickname,
        profilePictureFile:
            profilePictureFile ?? created.user.profilePictureFile,
      ),
    );
    emit(newState);
  }

  Future<void> saveStudiedCards(int n) async {
    final s = state.mapOrNull(created: (s) => s);
    if (s == null) return;
    final studiedCards = s.studiedCards + n;
    await box.clear();
    await box.put(_getDateKey(), studiedCards);
    emit(s.copyWith(studiedCards: studiedCards));
  }

  String _getDateKey() {
    final now = clock.now();
    final key = '${now.day}-${now.month}-${now.year}';
    return key;
  }
}
