import 'package:flash/config/constants.dart';
import 'package:flash/flashcards/cubit/flashcards_cubit.dart';
import 'package:flash/flashcards/widgets/bottom_options_bar.dart';
import 'package:flash/flashcards/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlashcardsView extends StatelessWidget {
  const FlashcardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlashcardsCubit, FlashcardsState>(
      builder: (context, state) {
        return state.maybeMap(
          finished: (_) => const _FinishedView(),
          orElse: _FlashcardsView.new,
        );
      },
    );
  }
}

class _FlashcardsView extends StatelessWidget {
  const _FlashcardsView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorScheme.secondary, colorScheme.primary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0, -0.5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Earth Science',
                        style: theme.textTheme.headline3,
                      ),
                      const SizedBox(height: kPaddingXL),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kPaddingL,
                        ),
                        child: BlocBuilder<FlashcardsCubit, FlashcardsState>(
                          builder: (_, state) {
                            return QuestionCard(
                              index: state.maybeWhen(
                                question: (_, index) => ++index,
                                answer: (_, index) => ++index,
                                orElse: () => 0,
                              ),
                              text: state.maybeWhen(
                                question: (deck, index) => deck[index].question,
                                answer: (deck, index) => deck[index].answer,
                                orElse: () => '',
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomOptionsBar(),
    );
  }
}

class _FinishedView extends StatelessWidget {
  const _FinishedView();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: const Scaffold(
        body: Center(
          child: Text(
            'Finished',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
