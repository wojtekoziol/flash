import 'package:flash/config/constants.dart';
import 'package:flash/home/widgets/app_logo.dart';
import 'package:flash/home/widgets/card_deck.dart';
import 'package:flash/home/widgets/home_widget.dart';
import 'package:flash/home/widgets/profile_picture.dart';
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
                const CardDeck(
                  category: 'Programming',
                  title: 'Fundamentals on Computer Science',
                  user: 'Cody Fisher',
                ),
                const SizedBox(height: kPaddingL),
                const CardDeck(
                  category: 'Knowledge',
                  title: 'Knowledge about Environmental & Science',
                  user: 'Jacob Jones',
                ),
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