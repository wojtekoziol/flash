import 'package:bloc_test/bloc_test.dart';
import 'package:flash/data/bloc/flashcards/flashcards_cubit.dart';
import 'package:flash/data/models/flashcard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlashcardsCubit', () {
    const flashcards = [
      Flashcard(
        question: 'Question 1',
        answer: 'Answer 1',
      ),
      Flashcard(
        question: 'Question 2',
        answer: 'Answer 2',
      ),
    ];

    group('initial state is correct', () {
      test('when deck is empty', () {
        final cubit = FlashcardsCubit([]);

        expect(cubit.state, equals(const FlashcardsState.finished()));
      });

      test('when deck is not empty', () {
        final cubit = FlashcardsCubit(flashcards);

        expect(
          cubit.state,
          equals(const FlashcardsState.question(flashcards: flashcards)),
        );
      });
    });

    group('flip()', () {
      blocTest<FlashcardsCubit, FlashcardsState>(
        'emits [FlashcardsState.answer] when current state '
        'is [FlashcardsState.question] and flip() is called.',
        build: () => FlashcardsCubit(flashcards),
        act: (cubit) => cubit.flip(),
        expect: () => const [FlashcardsState.answer(flashcards: flashcards)],
      );

      blocTest<FlashcardsCubit, FlashcardsState>(
        'does not emit anything when current state '
        'is [FlashcardsState.answer] and flip() is called.',
        build: () => FlashcardsCubit(flashcards),
        seed: () => const FlashcardsState.answer(flashcards: flashcards),
        act: (cubit) => cubit.flip(),
        expect: List.empty,
      );

      blocTest<FlashcardsCubit, FlashcardsState>(
        'does not emit anything when current state '
        'is [FlashcardsState.finished] and flip() is called.',
        build: () => FlashcardsCubit(flashcards),
        seed: FlashcardsState.finished,
        act: (cubit) => cubit.flip(),
        expect: List.empty,
      );
    });

    group('know()', () {
      blocTest<FlashcardsCubit, FlashcardsState>(
        'emits [FlashcardsState.finished] when '
        'there are no flashcards left.',
        build: () => FlashcardsCubit(flashcards),
        seed: () => FlashcardsState.answer(flashcards: [flashcards.first]),
        act: (cubit) => cubit.know(),
        expect: () => const [FlashcardsState.finished()],
      );

      blocTest<FlashcardsCubit, FlashcardsState>(
        'emits [FlashcardsState.question] when '
        'there are more flashcards in the deck.',
        build: () => FlashcardsCubit(flashcards),
        seed: () => const FlashcardsState.answer(flashcards: flashcards),
        act: (cubit) => cubit.know(),
        expect: () => [
          FlashcardsState.question(
            flashcards: List.from(flashcards)..removeAt(0),
          ),
        ],
      );

      blocTest<FlashcardsCubit, FlashcardsState>(
        'emits [FlashcardsState.question] with shuffled flashcards when '
        "there are flashcards in the deck that user marked as don't know.",
        build: () => FlashcardsCubit(flashcards),
        seed: () => const FlashcardsState.answer(
          flashcards: flashcards,
          index: 1,
        ),
        act: (cubit) => cubit.know(),
        expect: () => [
          FlashcardsState.question(flashcards: [flashcards.first]),
        ],
      );
    });

    group('dontKnow()', () {
      blocTest<FlashcardsCubit, FlashcardsState>(
        'emits [FlashcardsState.question] with next flashcard when '
        "marked as don't know.",
        build: () => FlashcardsCubit(flashcards),
        seed: () => const FlashcardsState.answer(flashcards: flashcards),
        act: (cubit) => cubit.dontKnow(),
        expect: () => const [
          FlashcardsState.question(flashcards: flashcards, index: 1),
        ],
      );

      test(
        'emits [FlashcardsState.question] with shuffled flashcards '
        "marked as don't know.",
        () {
          final cubit = FlashcardsCubit(flashcards)
            ..emit(const FlashcardsState.answer(
              flashcards: flashcards,
              index: 1,
            ));

          cubit.dontKnow();

          final cards = cubit.state.whenOrNull(
                question: (flashcards, _) => flashcards,
              ) ??
              [];
          expect(flashcards.any(cards.contains), true);
          expect(cards.any(flashcards.contains), true);
          expect(cards.length, flashcards.length);
        },
      );
    });
  });
}
