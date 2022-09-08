part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.notCreated() = _NotCreated;
  @HiveType(typeId: 0, adapterName: 'UserStateAdapter')
  const factory UserState.created({
    @HiveField(0) required User user,
    @HiveField(1) @Default(0) int studiedCards,
  }) = _Created;
}
