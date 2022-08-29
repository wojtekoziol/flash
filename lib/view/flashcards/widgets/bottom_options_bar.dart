import 'package:flash/config/constants.dart';
import 'package:flash/data/bloc/flashcards/flashcards_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

class BottomOptionsBar extends StatelessWidget {
  const BottomOptionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<FlashcardsCubit>();

    return BlocBuilder<FlashcardsCubit, FlashcardsState>(
      builder: (context, state) {
        return state.when(
          question: (_, __) => _Button(
            onTap: cubit.flip,
            color: theme.floatingActionButtonTheme.backgroundColor,
            child: Text(
              'Reveal Answer',
              style: theme.textTheme.bodyText2,
            ),
          ),
          answer: (_, __) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Button(
                onTap: cubit.dontKnow,
                color: theme.colorScheme.secondary,
                child: const Icon(UniconsLine.question),
              ),
              _Button(
                onTap: cubit.know,
                color: theme.floatingActionButtonTheme.backgroundColor,
                child: const Icon(UniconsLine.check),
              ),
            ],
          ),
          finished: SizedBox.shrink,
        );
      },
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.onTap,
    this.color,
    required this.child,
  });

  final VoidCallback onTap;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kPaddingM),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: kPaddingM,
          horizontal: kPaddingXL,
        ),
        child: child,
      ),
    );
  }
}
