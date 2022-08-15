import 'package:flash/config/constants.dart';
import 'package:flash/data/models/deck.dart';
import 'package:flash/data/repository/gsheets_storage_repo.dart';
import 'package:flash/view/home/widgets/app_logo.dart';
import 'package:flash/view/home/widgets/deck_card.dart';
import 'package:flash/view/home/widgets/home_widget.dart';
import 'package:flash/view/home/widgets/profile_picture.dart';
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
            ListView(
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
                        color: theme.floatingActionButtonTheme.backgroundColor!,
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
                  child: FutureBuilder<Deck>(
                    future: GSheetsStorageRepo(
                      '1lKHd-QQ5Sl03996zhYnNPHDWFXutm4_dcEN9SHqxUsk',
                    ).getDeck(),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      if (snapshot.hasData) {
                        return DeckCard(
                          deck: snapshot.data!,
                        );
                      }

                      return Text(
                        'No flashcards',
                        style: Theme.of(context).textTheme.bodyText1,
                      );
                    },
                  ),
                ),
                // const SizedBox(height: kPaddingL),
                const SizedBox(height: kPaddingXL * 3),
              ],
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
