import 'package:flash/config/constants.dart';
import 'package:flutter/material.dart';

final kLightTheme = ThemeData(
  fontFamily: 'Poppins',
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kOrange,
    elevation: 0,
    highlightElevation: 0,
    splashColor: kBlue,
    enableFeedback: true,
    foregroundColor: Colors.white,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: kBlue,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    unselectedItemColor: kLightBlue,
  ),
  textTheme: const TextTheme(
    headline3: TextStyle(
      color: Colors.white,
      fontSize: kPaddingL,
      fontWeight: FontWeight.w500,
    ),
    headline4: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    headline5: TextStyle(fontWeight: FontWeight.w500),
    subtitle1: TextStyle(fontWeight: FontWeight.bold),
    bodyText2: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: kPaddingM,
    ),
  ),
  colorScheme: const ColorScheme.light().copyWith(
    primary: kBlue,
    secondary: kPurple,
  ),
  dividerColor: kGrey,
  cardColor: kLightBlue,
);
