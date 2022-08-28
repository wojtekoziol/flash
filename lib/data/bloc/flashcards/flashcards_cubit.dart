import 'package:bloc/bloc.dart';
import 'package:flash/data/models/flashcard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcards_state.dart';
part 'flashcards_cubit.freezed.dart';

class FlashcardsCubit extends Cubit<FlashcardsState> {
  FlashcardsCubit(List<Flashcard> flashcards)
      : super(
          flashcards.isNotEmpty
              ? FlashcardsState.question(flashcards: flashcards)
              : const FlashcardsState.finished(),
        );

  void flip() {
    state.whenOrNull(
      question: (flashcards, index) {
        emit(FlashcardsState.answer(flashcards: flashcards, index: index));
      },
    );
  }

  void nextQuestion() {
    state.whenOrNull(
      answer: (flashcards, index) {
        if (index + 1 >= flashcards.length) {
          emit(const FlashcardsState.finished());
          return;
        }
        emit(FlashcardsState.question(flashcards: flashcards, index: ++index));
      },
    );
  }
}
