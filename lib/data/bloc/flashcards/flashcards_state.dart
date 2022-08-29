part of 'flashcards_cubit.dart';

@freezed
class FlashcardsState with _$FlashcardsState {
  const factory FlashcardsState.question({
    required List<Flashcard> flashcards,
    @Default(0) int index,
  }) = _Question;

  const factory FlashcardsState.answer({
    required List<Flashcard> flashcards,
    @Default(0) int index,
  }) = _Answer;

  const factory FlashcardsState.finished() = _Finished;
}
