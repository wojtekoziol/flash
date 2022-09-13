import 'package:bloc/bloc.dart';
import 'package:flash/data/models/deck.dart';
import 'package:flash/data/models/flashcard.dart';

class NewDeckCubit extends Cubit<Deck> {
  NewDeckCubit() : super(Deck.empty());

  void update({
    String? category,
    String? title,
    String? nickname,
  }) {
    emit(state.copyWith(
      category: category ?? state.category,
      title: title ?? state.title,
      nickname: nickname ?? state.nickname,
    ));
  }

  void addFlashcard() {
    final flashcards = state.flashcards;
    flashcards.add(Flashcard.empty(flashcards.length));
    emit(state.copyWith(
      flashcards: flashcards,
      defaultFlashcardsLength: flashcards.length,
    ));

    void updateFlashcard(int index, {String? question, String? answer}) {
      final flashcards = state.flashcards;
      final flashcard = flashcards.elementAt(index);
      flashcards.replaceRange(index, index + 1, [
        Flashcard(
          question: question ?? flashcard.question,
          answer: answer ?? flashcard.answer,
          index: index,
        )
      ]);
      emit(state.copyWith(flashcards: flashcards));
    }

    void saveDeck() {
      // TODO(wojtekoziol): Implement
      throw UnimplementedError();
    }
  }
}
