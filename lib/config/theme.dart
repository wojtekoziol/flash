import 'package:flash/config/constants.dart';
import 'package:flutter/material.dart';

final kLightTheme = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kOrange,
    elevation: 0,
    highlightElevation: 0,
    splashColor: kBlue,
    enableFeedback: true,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: kBlue,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    unselectedItemColor: kLightBlue,
  ),
);
