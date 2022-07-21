import 'package:flash/config/theme.dart';
import 'package:flash/flashcards/flashcards_view.dart';
import 'package:flash/navigation/navigation_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash',
      debugShowCheckedModeBanner: false,
      theme: kLightTheme,
      // home: const NavigationView(),
      home: const FlashcardsView(),
    );
  }
}
