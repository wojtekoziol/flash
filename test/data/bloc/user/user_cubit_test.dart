import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flash/config/constants.dart';
import 'package:flash/data/bloc/user/user_cubit.dart';
import 'package:flash/data/models/deck.dart';
import 'package:flash/data/models/flashcard.dart';
import 'package:flash/data/models/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_cubit_test.mocks.dart';

@GenerateMocks([Box])
void main() {
  group('UserCubit', () {
    const exampleUser = User(
      nickname: 'My Nickname',
      decks: [
        Deck(
          category: 'My category',
          title: 'My Title',
          nickname: 'My User',
          flashcards: [
            Flashcard(
              question: 'My Question',
              answer: 'My Answer',
              index: 0,
            )
          ],
          defaultFlashcardsLength: 1,
        ),
      ],
    );
    const exampleState = UserState.created(
      user: exampleUser,
      studiedCards: 3,
    );
    final box = MockBox<Object>();

    group('initial state is correct', () {
      test('when there is no previous state', () {
        when(box.get(any)).thenAnswer((_) => null);

        final cubit = UserCubit(box);

        expect(cubit.state, equals(const UserState.notCreated()));
      });

      test('when there is a previous state', () {
        when(box.get(kStateKey)).thenReturn(exampleState);
        final now = DateTime.now();
        final key = '${now.day}-${now.month}-${now.year}';
        when(box.get(key)).thenReturn(3);

        final cubit = UserCubit(box);

        expect(
          cubit.state,
          equals(
            exampleState.mapOrNull(
              created: (state) => state.copyWith(studiedCards: 3),
            ),
          ),
        );
      });
    });

    group('create()', () {
      blocTest<UserCubit, UserState>(
        'does not emit anything when user is already created.',
        setUp: () => when(box.get(any)).thenAnswer((_) => null),
        build: () => UserCubit(box),
        seed: () => exampleState,
        act: (cubit) => cubit.create(nickname: 'Second Nickname'),
        expect: List.empty,
      );

      blocTest<UserCubit, UserState>(
        'emits [UserState.created] when user is not created.',
        setUp: () => when(box.get(any)).thenAnswer((_) => null),
        build: () => UserCubit(box),
        act: (cubit) => cubit.create(nickname: 'My Cool Nickname'),
        expect: () => const [
          UserState.created(
            user: User(nickname: 'My Cool Nickname'),
          ),
        ],
      );
    });

    group('update()', () {
      blocTest<UserCubit, UserState>(
        'does not emit anything when there is no created user.',
        setUp: () => when(box.get(any)).thenAnswer((_) => null),
        build: () => UserCubit(box),
        act: (cubit) => cubit.update(nickname: 'My Nickname'),
        expect: List.empty,
      );

      blocTest<UserCubit, UserState>(
        'emits [UserState.created] with updated nickname.',
        setUp: () => when(box.get(any)).thenAnswer((_) => null),
        build: () => UserCubit(box),
        seed: () => exampleState,
        act: (cubit) => cubit.update(nickname: 'My Second Nickname'),
        expect: () => [
          exampleState.mapOrNull(
            created: (state) => state.copyWith(
              user: exampleUser.copyWith(nickname: 'My Second Nickname'),
            ),
          ),
        ],
      );

      final exampleFile = File('example');
      blocTest<UserCubit, UserState>(
        'emits [UserState.created] with updated profile picture.',
        setUp: () => when(box.get(any)).thenAnswer((_) => null),
        build: () => UserCubit(box),
        seed: () => exampleState,
        act: (cubit) => cubit.update(profilePictureFile: exampleFile),
        expect: () => [
          exampleState.mapOrNull(
            created: (state) => state.copyWith(
              user: exampleUser.copyWith(profilePictureFile: exampleFile),
            ),
          ),
        ],
      );
    });

    group('saveStudiedCards() ', () {
      blocTest<UserCubit, UserState>(
        'does not emit anything when there is no created user.',
        setUp: () => when(box.get(any)).thenAnswer((_) => null),
        build: () => UserCubit(box),
        act: (cubit) => cubit.saveStudiedCards(5),
        expect: List.empty,
      );

      blocTest<UserCubit, UserState>(
        'emits [UserState.created] with updated studied Cards.',
        setUp: () {
          when(box.get(any)).thenAnswer((_) => null);
          when(box.clear()).thenAnswer((_) async => 0);
        },
        build: () => UserCubit(box),
        seed: () => exampleState,
        act: (cubit) => cubit.saveStudiedCards(5),
        expect: () => [
          exampleState.mapOrNull(
            created: (state) => state.copyWith(studiedCards: 8),
          ),
        ],
      );
    });
  });
}
