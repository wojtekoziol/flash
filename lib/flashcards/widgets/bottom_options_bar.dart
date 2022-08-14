import 'package:flash/config/constants.dart';
import 'package:flash/flashcards/cubit/flashcards_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomOptionsBar extends StatelessWidget {
  const BottomOptionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        final cubit = context.read<FlashcardsCubit>();
        cubit.state.mapOrNull(
          question: (_) => cubit.flip(),
          answer: (_) => cubit.nextQuestion(),
        );
      },
      child: ColoredBox(
        color: theme.floatingActionButtonTheme.backgroundColor!,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: kPaddingL, bottom: kPaddingM),
            child: BlocBuilder<FlashcardsCubit, FlashcardsState>(
              builder: (_, state) {
                return Text(
                  state.maybeWhen(
                    question: (_, __) => 'Reveal Answer',
                    answer: (_, __) => 'Next question',
                    orElse: () => '',
                  ),
                  style: theme.textTheme.bodyText2,
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
