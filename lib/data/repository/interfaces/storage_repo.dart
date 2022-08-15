import 'package:flash/data/models/deck.dart';
import 'package:flash/data/models/flashcard.dart';

abstract class StorageRepo {
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
