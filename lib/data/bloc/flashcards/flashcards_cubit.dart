import 'package:bloc/bloc.dart';
import 'package:flash/data/models/flashcard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcards_state.dart';
part 'flashcards_cubit.freezed.dart';

class FlashcardsCubit extends Cubit<FlashcardsState> {
  FlashcardsCubit(List<Flashcard> flashcards)
      : super(
          flashcards.isNotEmpty
              ? FlashcardsState.question(
                  flashcards: List.from(flashcards)..shuffle(),
                )
              : const FlashcardsState.finished(),
        );

  void flip() {
    state.whenOrNull(
      question: (flashcards, index) {
        emit(FlashcardsState.answer(flashcards: flashcards, index: index));
      },
    );
  }

  void know() {
    state.whenOrNull(
      answer: (flashcards, index) {
        final cards = List<Flashcard>.from(flashcards)..removeAt(index);

        if (cards.isEmpty) {
          emit(const FlashcardsState.finished());
          return;
        }

        if (index + 1 >= cards.length) {
          emit(FlashcardsState.question(
            flashcards: cards..shuffle(),
          ));
          return;
        }

        emit(FlashcardsState.question(
          flashcards: cards,
          index: index,
        ));
      },
    );
  }

  void dontKnow() {
    state.whenOrNull(
      answer: (flashcards, index) {
        if (index + 1 >= flashcards.length) {
          emit(FlashcardsState.question(
            flashcards: List.from(flashcards)..shuffle(),
          ));
          return;
        }

        emit(FlashcardsState.question(
          flashcards: flashcards,
          index: ++index,
        ));
      },
    );
  }
}
