import 'package:bloc_test/bloc_test.dart';
import 'package:flash/data/bloc/flashcards/flashcards_cubit.dart';
import 'package:flash/data/models/deck.dart';
import 'package:flash/data/models/flashcard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlashcardsCubit', () {
    const deck = Deck(
      category: 'My Category',
      title: 'My Title',
      user: 'My User',
      flashcards: [
        Flashcard(
          question: 'Question 1',
          answer: 'Answer 1',
        ),
        Flashcard(
          question: 'Question 2',
          answer: 'Answer 2',
        ),
      ],
    );
    group('initial state is correct', () {
      test('when there are no flashcards in the deck', () {
        const emptyDeck = Deck(
          category: '',
          flashcards: [],
          title: '',
          user: '',
        );
        final cubit = FlashcardsCubit(emptyDeck);

        expect(
          cubit.state,
          equals(const FlashcardsState.finished(deck: emptyDeck)),
        );
      });

      test('when there are flashcards in the deck', () {
        final cubit = FlashcardsCubit(deck);

        expect(
          cubit.state,
          equals(const FlashcardsState.question(deck: deck)),
        );
      });
    });

    group('flip()', () {
      blocTest<FlashcardsCubit, FlashcardsState>(
        'emits [FlashcardsState.answer] when current state '
        'is [FlashcardsState.question] and flip() is called.',
        build: () => FlashcardsCubit(deck),
        act: (cubit) => cubit.flip(),
        expect: () => const [FlashcardsState.answer(deck: deck)],
      );

      blocTest<FlashcardsCubit, FlashcardsState>(
        'does not emit anything when current state '
        'is [FlashcardsState.answer] and flip() is called.',
        build: () => FlashcardsCubit(deck),
        seed: () => const FlashcardsState.answer(deck: deck),
        act: (cubit) => cubit.flip(),
        expect: List.empty,
      );

      blocTest<FlashcardsCubit, FlashcardsState>(
        'does not emit anything when current state '
        'is [FlashcardsState.finished] and flip() is called.',
        build: () => FlashcardsCubit(deck),
        seed: () => const FlashcardsState.finished(deck: deck),
        act: (cubit) => cubit.flip(),
        expect: List.empty,
      );
    });

    group('know()', () {
      blocTest<FlashcardsCubit, FlashcardsState>(
        'emits [FlashcardsState.finished] when '
        'there are no flashcards left.',
        build: () => FlashcardsCubit(deck),
        seed: () => FlashcardsState.answer(
          deck: deck.copyWith(
            flashcards: [deck.flashcards.first],
          ),
        ),
        act: (cubit) => cubit.know(),
        expect: () => [
          FlashcardsState.finished(
            deck: deck.copyWith(flashcards: []),
          ),
        ],
      );

      blocTest<FlashcardsCubit, FlashcardsState>(
        'emits [FlashcardsState.question] when '
        'there are more flashcards in the deck.',
        build: () => FlashcardsCubit(deck),
        seed: () => const FlashcardsState.answer(deck: deck),
        act: (cubit) => cubit.know(),
        expect: () => [
          FlashcardsState.question(
            deck: deck.copyWith(
              flashcards: List.from(deck.flashcards)..removeAt(0),
            ),
          ),
        ],
      );

      blocTest<FlashcardsCubit, FlashcardsState>(
        'emits [FlashcardsState.question] with shuffled flashcards when '
        "there are flashcards in the deck that user marked as don't know.",
        build: () => FlashcardsCubit(deck),
        seed: () => const FlashcardsState.answer(
          deck: deck,
          index: 1,
        ),
        act: (cubit) => cubit.know(),
        expect: () => [
          FlashcardsState.question(
            deck: deck.copyWith(
              flashcards: [deck.flashcards.first],
            ),
          ),
        ],
      );
    });

    group('dontKnow()', () {
      blocTest<FlashcardsCubit, FlashcardsState>(
        'emits [FlashcardsState.question] with next flashcard when '
        "marked as don't know.",
        build: () => FlashcardsCubit(deck),
        seed: () => const FlashcardsState.answer(deck: deck),
        act: (cubit) => cubit.dontKnow(),
        expect: () => const [
          FlashcardsState.question(deck: deck, index: 1),
        ],
      );

      test(
        'emits [FlashcardsState.question] with shuffled flashcards '
        "marked as don't know.",
        () {
          final cubit = FlashcardsCubit(deck)
            ..emit(const FlashcardsState.answer(
              deck: deck,
              index: 1,
            ));

          cubit.dontKnow();

          final cards = cubit.state.whenOrNull(
                question: (deck, _) => deck.flashcards,
              ) ??
              [];
          expect(deck.flashcards.any(cards.contains), true);
          expect(cards.any(deck.flashcards.contains), true);
          expect(cards.length, deck.flashcards.length);
        },
      );
    });
  });
}
