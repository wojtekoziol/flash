import 'package:flash/data/models/flashcard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Flashcard.empty() creates an empty flashcard', () {
    final flashcard = Flashcard.empty(0);
    const empty = Flashcard(
      question: '',
      answer: '',
      index: 0,
    );

    expect(flashcard, equals(empty));
  });
}
