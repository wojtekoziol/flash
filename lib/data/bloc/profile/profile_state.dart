part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.notCreated() = _NotCreated;
  const factory ProfileState.created({
    required String nickname,
    @Default([]) List<Deck> decks,
  }) = _Created;
}
