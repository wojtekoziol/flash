import 'package:flash/config/constants.dart';
import 'package:flash/flashcards/widgets/bottom_options_bar.dart';
import 'package:flash/flashcards/widgets/question_card.dart';
import 'package:flutter/material.dart';

class FlashcardsView extends StatelessWidget {
  const FlashcardsView({super.key});

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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: kPaddingL),
                        child: QuestionCard(
                          index: 1,
                          text: 'What is the supercontinent broke apart to '
                              'create the continents we know today?',
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
