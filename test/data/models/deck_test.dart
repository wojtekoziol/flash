import 'package:flash/data/models/deck.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deck.empty() creates a new empty deck', () {
    final deck = Deck.empty();
    const empty = Deck(
      category: '',
      title: '',
      nickname: '',
      flashcards: [],
      defaultFlashcardsLength: 0,
    );

    expect(deck, equals(empty));
  });
}
