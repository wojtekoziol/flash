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
        answer: 'Answer 3',
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

    group('nextQuestion()', () {
      blocTest<FlashcardsCubit, FlashcardsState>(
        'emits [FlashcardsState.question] with incremented index '
        'when current state is [FlashcardsState.answer] '
        'and nextQuestion() is called.',
        build: () => FlashcardsCubit(flashcards),
        seed: () => const FlashcardsState.answer(
          flashcards: flashcards,
          index: 0,
        ),
        act: (cubit) => cubit.nextQuestion(),
        expect: () => const [
          FlashcardsState.question(flashcards: flashcards, index: 1),
        ],
      );

      blocTest<FlashcardsCubit, FlashcardsState>(
        'emits [FlashcardsState.finished] when current state '
        'is [FlashcardsState.answer] and there are no more flashcards '
        'and nextQuestion() is called.',
        build: () => FlashcardsCubit(flashcards),
        seed: () => const FlashcardsState.answer(
          flashcards: flashcards,
          index: 1,
        ),
        act: (cubit) => cubit.nextQuestion(),
        expect: () => const [FlashcardsState.finished()],
      );

      blocTest<FlashcardsCubit, FlashcardsState>(
        'does not emit anything when state is [FlashcardsState.question] '
        'and nextQuestion() is called.',
        build: () => FlashcardsCubit(flashcards),
        seed: () => const FlashcardsState.question(flashcards: flashcards),
        act: (cubit) => cubit.nextQuestion(),
        expect: List.empty,
      );

      blocTest<FlashcardsCubit, FlashcardsState>(
        'does not emit anything when state is [FlashcardsState.finished] '
        'and nextQuestion() is called.',
        build: () => FlashcardsCubit(flashcards),
        seed: FlashcardsState.finished,
        act: (cubit) => cubit.nextQuestion(),
        expect: List.empty,
      );
    });
  });
}
