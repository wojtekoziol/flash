import 'package:flash/config/constants.dart';
import 'package:flash/data/bloc/flashcards/flashcards_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishedView extends StatelessWidget {
  const FinishedView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.colorScheme.secondary, theme.colorScheme.primary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0, -0.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlocBuilder<FlashcardsCubit, FlashcardsState>(
                      builder: (context, state) {
                        return Text(
                          state.deck.category,
                          style: theme.textTheme.headline3,
                        );
                      },
                    ),
                    const SizedBox(height: kPaddingXL),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kPaddingL,
                      ),
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
                          child: BlocBuilder<FlashcardsCubit, FlashcardsState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  Text(
                                    state.deck.title,
                                    style: theme.textTheme.headline5,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: kPaddingL),
                                  Text(
                                    'Cards Studied:',
                                    style: theme.textTheme.subtitle2,
                                  ),
                                  const SizedBox(height: kPaddingS),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.secondary,
                                      borderRadius:
                                          BorderRadius.circular(kPaddingM),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: kPaddingS,
                                      horizontal: kPaddingXL,
                                    ),
                                    child: Text(
                                      '${state.deck.defaultFlashcardsLength}',
                                      style: theme.textTheme.headline3,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.floatingActionButtonTheme.backgroundColor,
                      borderRadius: BorderRadius.circular(kPaddingM),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: kPaddingM,
                      horizontal: kPaddingXL,
                    ),
                    child: Text(
                      'Finish',
                      style: theme.textTheme.bodyText2,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
