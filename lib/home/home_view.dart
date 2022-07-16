import 'package:flash/config/constants.dart';
import 'package:flash/home/widgets/app_logo.dart';
import 'package:flash/home/widgets/profile_picture.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldColor = Theme.of(context).scaffoldBackgroundColor;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kPaddingL, kPaddingS, kPaddingL, 0),
        child: Stack(
          children: [
            // ListView
            Column(
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
