part of 'flashcards_cubit.dart';

@freezed
class FlashcardsState with _$FlashcardsState {
  const factory FlashcardsState.question({
    required Deck deck,
    @Default(0) int index,
  }) = _Question;

  const factory FlashcardsState.answer({
    required Deck deck,
    @Default(0) int index,
  }) = _Answer;

  const factory FlashcardsState.finished({
    required Deck deck,
  }) = _Finished;
}
