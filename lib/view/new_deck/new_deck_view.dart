import 'package:collection/collection.dart';
import 'package:flash/config/constants.dart';
import 'package:flash/data/bloc/new_deck/new_deck_cubit.dart';
import 'package:flash/data/models/deck.dart';
import 'package:flash/view/new_deck/widgets/double_text_field_card.dart';
import 'package:flash/view/new_deck/widgets/single_text_field_card.dart';
import 'package:flash/widgets/long_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewDeckView extends StatelessWidget {
  const NewDeckView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final cubit = context.read<NewDeckCubit>();

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorScheme.secondary, colorScheme.primary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kPaddingL,
                      vertical: kPaddingM,
                    ),
                    child: SafeArea(
                      child: BlocBuilder<NewDeckCubit, Deck>(
                        builder: (context, state) => Column(
                          children: [
                            SingleTextFieldCard(
                              onEditingComplete: (text) =>
                                  cubit.update(nickname: text),
                              title: 'Nickname',
                            ),
                            const SizedBox(height: kPaddingM),
                            SingleTextFieldCard(
                              onEditingComplete: (text) =>
                                  cubit.update(category: text),
                              title: 'Category',
                            ),
                            const SizedBox(height: kPaddingM),
                            SingleTextFieldCard(
                              onEditingComplete: (text) =>
                                  cubit.update(title: text),
                              title: 'Title',
                            ),
                            const SizedBox(height: kPaddingL),
                            ...state.flashcards.mapIndexed(
                              (index, flashcard) => Padding(
                                padding: const EdgeInsets.only(top: kPaddingM),
                                child: DoubleTextFieldCard(
                                  key: UniqueKey(),
                                  onEditingComplete: (question, answer) =>
                                      cubit.updateFlashcard(
                                    index,
                                    question: question,
                                    answer: answer,
                                  ),
                                  index: index + 1,
                                  title1: 'Question',
                                  startText1: flashcard.question,
                                  title2: 'Answer',
                                  startText2: flashcard.answer,
                                  onDeleteButtonClicked: () =>
                                      cubit.removeFlashcard(index),
                                ),
                              ),
                            ),
                            const SizedBox(height: kPaddingXL * 2),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kPaddingM,
                  horizontal: kPaddingXL,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LongButton(
                        onTap: cubit.addFlashcard,
                        color: theme.colorScheme.secondary,
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(width: kPaddingM),
                      LongButton(
                        onTap: () async {
                          await cubit.saveDeck();
                          Navigator.of(context).pop();
                        },
                        color: theme.floatingActionButtonTheme.backgroundColor,
                        child: const Icon(Icons.check),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
