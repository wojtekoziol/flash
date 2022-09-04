import 'package:animations/animations.dart';
import 'package:flash/config/constants.dart';
import 'package:flash/data/bloc/flashcards/flashcards_cubit.dart';
import 'package:flash/data/models/deck.dart';
import 'package:flash/view/flashcards/flashcards_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeckCard extends StatelessWidget {
  const DeckCard({
    super.key,
    required this.deck,
  });

  final Deck deck;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: 100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.lerp(Colors.black, theme.colorScheme.primary, 0.7)!
                    .withOpacity(0.2),
                blurRadius: 14,
              )
            ],
          ),
        ),
        OpenContainer(
          openElevation: 0,
          closedElevation: 0,
          transitionDuration: kDefaultAnimDuration,
          openShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kPaddingL),
          ),
          middleColor: Colors.transparent,
          closedColor: Colors.transparent,
          openColor: Colors.transparent,
          openBuilder: (_, __) => BlocProvider(
            create: (_) => FlashcardsCubit(deck),
            child: const FlashcardsView(),
          ),
          closedBuilder: (_, open) => GestureDetector(
            onTap: open,
            child: SizedBox(
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  border: Border.all(color: theme.dividerColor),
                  borderRadius: BorderRadius.circular(kPaddingM),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kPaddingM),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deck.category,
                        style: textTheme.subtitle2!.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: kPaddingS),
                      Text(deck.title, style: textTheme.subtitle1),
                      const SizedBox(height: kPaddingS),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: kPaddingS,
                            backgroundColor: Colors.amber,
                          ),
                          const SizedBox(width: kPaddingS),
                          Text(deck.user, style: textTheme.bodyText1),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
