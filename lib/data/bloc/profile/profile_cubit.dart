import 'package:bloc/bloc.dart';
import 'package:flash/data/models/deck.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.notCreated());

  void create({required String nickname}) {
    emit(ProfileState.created(nickname: nickname));
  }

  void update({required String nickname}) {
    state.map(
      notCreated: (_) => create(nickname: nickname),
      created: (s) => s.copyWith(nickname: nickname),
    );
  }
}
