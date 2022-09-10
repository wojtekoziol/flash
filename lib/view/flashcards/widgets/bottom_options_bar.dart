import 'package:flash/config/constants.dart';
import 'package:flash/data/bloc/flashcards/flashcards_cubit.dart';
import 'package:flash/widgets/long_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:unicons/unicons.dart';

class BottomOptionsBar extends HookWidget {
  const BottomOptionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profileCubit = context.read<FlashcardsCubit>();

    final questionAnimController =
        useAnimationController(duration: kShortAnimDuration)..forward();
    final answerAnimController =
        useAnimationController(duration: kShortAnimDuration);
    final bounceTween = CurveTween(curve: kDefaultAnimCurve);

    return BlocListener<FlashcardsCubit, FlashcardsState>(
      listener: (_, state) {
        state.mapOrNull(
          question: (_) {
            answerAnimController.reverse().then(
                  (_) => questionAnimController.forward(),
                );
          },
          answer: (_) {
            questionAnimController.reverse().then(
                  (_) => answerAnimController.forward(),
                );
          },
        );
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ScaleTransition(
            scale: bounceTween.animate(questionAnimController),
            child: LongButton(
              onTap: profileCubit.flip,
              color: theme.floatingActionButtonTheme.backgroundColor,
              child: Text(
                'Reveal Answer',
                style: theme.textTheme.bodyText2,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ScaleTransition(
                scale: bounceTween.animate(answerAnimController),
                child: LongButton(
                  onTap: profileCubit.dontKnow,
                  color: theme.colorScheme.secondary,
                  child: const Icon(UniconsLine.question),
                ),
              ),
              ScaleTransition(
                scale: bounceTween.animate(answerAnimController),
                child: LongButton(
                  onTap: profileCubit.know,
                  color: theme.floatingActionButtonTheme.backgroundColor,
                  child: const Icon(UniconsLine.check),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
