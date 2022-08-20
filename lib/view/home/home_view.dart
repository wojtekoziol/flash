import 'package:flash/config/constants.dart';
import 'package:flash/config/get_it.dart';
import 'package:flash/data/models/deck.dart';
import 'package:flash/data/repository/gdrive_repo.dart';
import 'package:flash/view/home/widgets/app_logo.dart';
import 'package:flash/view/home/widgets/deck_card.dart';
import 'package:flash/view/home/widgets/home_widget.dart';
import 'package:flash/view/home/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final refresh = useValueNotifier(getIt<GDriveRepo>().getDecks());

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kPaddingL, kPaddingS, kPaddingL, 0),
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async =>
                  refresh.value = getIt<GDriveRepo>().getDecks(),
              edgeOffset: kPaddingM * 10,
              child: ListView(
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
                          color:
                              theme.floatingActionButtonTheme.backgroundColor!,
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
                  Center(
                    child: ValueListenableBuilder<Future<List<Deck>>>(
                      valueListenable: refresh,
                      builder: (_, future, text) => FutureBuilder<List<Deck>>(
                        future: future,
                        builder: (_, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }

                          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                            return Column(
                              children: [
                                for (final deck in snapshot.data!) ...[
                                  DeckCard(deck: deck),
                                  const SizedBox(height: kPaddingL),
                                ]
                              ],
                            );
                          }

                          return text!;
                        },
                      ),
                      child: Text(
                        'No flashcards',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  // const SizedBox(height: kPaddingL),
                  const SizedBox(height: kPaddingXL * 3),
                ],
              ),
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
