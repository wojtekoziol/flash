import 'package:bloc/bloc.dart';
import 'package:flash/flashcards/models/flashcard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcards_state.dart';
part 'flashcards_cubit.freezed.dart';

class FlashcardsCubit extends Cubit<FlashcardsState> {
  FlashcardsCubit(List<Flashcard> deck)
      : super(
          deck.isNotEmpty
              ? FlashcardsState.question(deck: deck)
              : const FlashcardsState.finished(),
        );

  void flip() {
    state.whenOrNull(
      question: (deck, index) {
        emit(FlashcardsState.answer(deck: deck, index: index));
      },
    );
  }

  void nextQuestion() {
    state.whenOrNull(
      answer: (deck, index) {
        if (index + 1 >= deck.length) {
          emit(const FlashcardsState.finished());
          return;
        }
        emit(FlashcardsState.question(deck: deck, index: ++index));
      },
    );
  }
}
