import 'package:flash/config/constants.dart';
import 'package:flash/home/widgets/app_logo.dart';
import 'package:flash/home/widgets/home_widget.dart';
import 'package:flash/home/widgets/profile_picture.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffoldColor = theme.scaffoldBackgroundColor;

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
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ColoredBox(
                  color: theme.scaffoldBackgroundColor,
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
            ),
          ],
        ),
      ),
    );
  }
}
