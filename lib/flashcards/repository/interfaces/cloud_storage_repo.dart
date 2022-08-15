import 'package:flash/flashcards/models/deck.dart';
import 'package:flash/flashcards/models/flashcard.dart';

abstract class CloudStorageRepo {
  Future<List<Flashcard>> getFlashcards();

  Future<String> getTitle();

  Future<String> getCategory();

  Future<String> getUser();

  Future<Deck> getDeck() async {
    final title = await getTitle();
    final category = await getCategory();
    final user = await getUser();
    final flashcards = await getFlashcards();

    final deck = Deck(
      category: category,
      title: title,
      user: user,
      flashcards: flashcards,
    );
    return deck;
  }
}
