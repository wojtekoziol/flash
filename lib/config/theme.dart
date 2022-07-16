import 'package:flash/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final kLightTheme = ThemeData(
  fontFamily: 'Poppins',
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
  textTheme: const TextTheme(
    headline4: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
);
