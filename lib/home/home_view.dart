import 'package:flash/config/constants.dart';
import 'package:flash/flashcards/models/deck.dart';
import 'package:flash/flashcards/models/flashcard.dart';
import 'package:flash/home/widgets/app_logo.dart';
import 'package:flash/home/widgets/deck_card.dart';
import 'package:flash/home/widgets/home_widget.dart';
import 'package:flash/home/widgets/profile_picture.dart';
import 'package:flash/services/sheet_service.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kPaddingL, kPaddingS, kPaddingL, 0),
        child: Stack(
          children: [
            FutureBuilder<List<Flashcard>>(
              future: SheetService(
                '1lKHd-QQ5Sl03996zhYnNPHDWFXutm4_dcEN9SHqxUsk',
              ).getFlashcards(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    padding: const EdgeInsets.only(top: kPaddingM * 10),
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: HomeWidget(
                              color: theme.colorScheme.secondary,
                              value: 34,
                              title: 'Studied cards',
                            ),
                          ),
                          const SizedBox(width: kPaddingM),
                          Expanded(
                            child: HomeWidget(
                              color: theme
                                  .floatingActionButtonTheme.backgroundColor!,
                              value: 18,
                              title: 'Decks created',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: kPaddingL),
                      Text(
                        'Classes',
                        style: theme.textTheme.subtitle1,
                      ),
                      const SizedBox(height: kPaddingL),
                      Column(
                        children: [
                          DeckCard(
                            deck: Deck(
                              category: 'Programming',
                              title: 'Fundamentals on Computer Science',
                              user: 'Cody Fisher',
                              deck: snapshot.data!,
                            ),
                          ),
                          const SizedBox(height: kPaddingL),
                          const DeckCard(
                            deck: Deck(
                              category: 'Knowledge',
                              title: 'Knowledge about Environmental & Science',
                              user: 'Jacob Jones',
                              deck: [],
                            ),
                          ),
                          const SizedBox(height: kPaddingL),
                          const DeckCard(
                            deck: Deck(
                              category: 'Knowledge',
                              title: 'Knowledge about Environmental & Science',
                              user: 'Jacob Jones',
                              deck: [],
                            ),
                          ),
                          const SizedBox(height: kPaddingL),
                          const DeckCard(
                            deck: Deck(
                              category: 'Knowledge',
                              title: 'Knowledge about Environmental & Science',
                              user: 'Jacob Jones',
                              deck: [],
                            ),
                          ),
                          const SizedBox(height: kPaddingXL * 3),
                        ],
                      ),
                    ],
                  );
                }

                return const Text(
                  'No data',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                );
              },
            ),
            const _AppBar(),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    final scaffoldColor = Theme.of(context).scaffoldBackgroundColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ColoredBox(
          color: scaffoldColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppLogo(),
                  ProfilePicture(),
                ],
              ),
              const SizedBox(height: kPaddingM),
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        Container(
          height: kPaddingL,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [scaffoldColor, scaffoldColor.withOpacity(0.1)],
            ),
          ),
        ),
      ],
    );
  }
}
