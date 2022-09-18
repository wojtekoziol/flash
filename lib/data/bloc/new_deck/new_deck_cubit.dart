import 'package:bloc/bloc.dart';
import 'package:flash/config/get_it.dart';
import 'package:flash/data/models/deck.dart';
import 'package:flash/data/models/flashcard.dart';
import 'package:flash/data/repository/gdrive_repo.dart';

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
    final flashcards = List<Flashcard>.from(state.flashcards);
    flashcards.add(Flashcard.empty(flashcards.length));
    emit(state.copyWith(
      flashcards: flashcards,
      defaultFlashcardsLength: flashcards.length,
    ));
  }

  void removeFlashcard(int index) {
    final flashcards = List<Flashcard>.from(state.flashcards);
    flashcards.removeAt(index);
    emit(state.copyWith(
      flashcards: flashcards,
      defaultFlashcardsLength: flashcards.length,
    ));
  }

  void updateFlashcard(int index, {String? question, String? answer}) {
    final flashcards = List<Flashcard>.from(state.flashcards);
    final flashcard = flashcards.elementAt(index);
    flashcards.removeAt(index);
    flashcards.insert(
      index,
      Flashcard(
        question: question ?? flashcard.question,
        answer: answer ?? flashcard.answer,
        index: index,
      ),
    );
    emit(state.copyWith(flashcards: flashcards));
  }

  Future<void> saveDeck() async {
    await getIt<GDriveRepo>().saveDeck(state);
  }
}
