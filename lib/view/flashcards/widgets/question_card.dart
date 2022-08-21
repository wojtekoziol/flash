import 'dart:math' as math;

import 'package:flash/config/constants.dart';
import 'package:flash/data/bloc/flashcards/flashcards_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class QuestionCard extends HookWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final animController = useAnimationController(duration: kLongAnimDuration);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 100,
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kPaddingL),
                boxShadow: [
                  BoxShadow(
                    color: theme.cardColor,
                    offset: const Offset(0, kPaddingM),
                  ),
                ],
              ),
            ),
          ),
        ),
        BlocConsumer<FlashcardsCubit, FlashcardsState>(
          listener: (_, state) {
            state.whenOrNull(
              question: (_, __) => animController.reset(),
              answer: (_, __) => animController.forward(),
            );
          },
          builder: (_, state) {
            final index = state.maybeWhen(
              question: (deck, index) => ++index,
              answer: (deck, index) => ++index,
              orElse: () => 0,
            );
            final question = state.maybeWhen(
              question: (deck, index) => deck[index].question,
              answer: (deck, index) => deck[index].question,
              orElse: () => '',
            );
            final answer = state.maybeWhen(
              question: (deck, index) => deck[index].answer,
              answer: (deck, index) => deck[index].answer,
              orElse: () => '',
            );

            return AnimatedBuilder(
              animation: animController,
              builder: (_, __) => Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(animController.value * math.pi)
                  ..rotateY(animController.value > 0.5 ? math.pi : 0),
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(kPaddingL),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kPaddingL,
                      vertical: kPaddingXL,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '$index',
                          style: textTheme.headline4,
                        ),
                        const SizedBox(height: kPaddingL),
                        Text(
                          animController.value < 0.5 ? question : answer,
                          style: textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
