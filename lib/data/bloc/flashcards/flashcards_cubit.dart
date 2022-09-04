import 'package:bloc/bloc.dart';
import 'package:flash/data/models/deck.dart';
import 'package:flash/data/models/flashcard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcards_state.dart';
part 'flashcards_cubit.freezed.dart';

class FlashcardsCubit extends Cubit<FlashcardsState> {
  FlashcardsCubit(Deck deck)
      : super(
          deck.flashcards.isEmpty
              ? FlashcardsState.finished(deck: deck)
              : FlashcardsState.question(deck: deck),
        );

  void flip() {
    final question = state.mapOrNull(question: (value) => value);
    if (question == null) return;
    emit(FlashcardsState.answer(
      deck: question.deck,
      index: question.index,
    ));
  }

  void know() {
    final answer = state.mapOrNull(answer: (value) => value);
    if (answer == null) return;

    final cards = List<Flashcard>.from(answer.deck.flashcards)
      ..removeAt(answer.index);

    if (cards.isEmpty) {
      emit(FlashcardsState.finished(
        deck: answer.deck.copyWith(flashcards: cards),
      ));
      return;
    }

    if (answer.index + 1 >= cards.length) {
      emit(FlashcardsState.question(
        deck: answer.deck.copyWith(
          flashcards: cards..shuffle(),
        ),
      ));
      return;
    }

    emit(FlashcardsState.question(
      deck: answer.deck.copyWith(
        flashcards: cards..shuffle(),
      ),
      index: answer.index,
    ));
  }

  void dontKnow() {
    final answer = state.mapOrNull(answer: (value) => value);
    if (answer == null) return;

    if (answer.index + 1 >= answer.deck.flashcards.length) {
      emit(FlashcardsState.question(
        deck: answer.deck.copyWith(
          flashcards: List.from(answer.deck.flashcards)..shuffle(),
        ),
      ));
      return;
    }

    emit(FlashcardsState.question(
      deck: answer.deck,
      index: answer.index + 1,
    ));
  }
}
