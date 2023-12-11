import 'package:bizi/constants/b_colors.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  primaryColor: BColors.blue,
  primaryColorDark: BColors.blue,
  primaryColorLight: BColors.blue,
  cardColor: BColors.white,
  scaffoldBackgroundColor: BColors.white,
  disabledColor: BColors.disabledBlue,
  hintColor: BColors.fadedBlack,
  hoverColor: BColors.grey,
  shadowColor: BColors.lightGrey,
  unselectedWidgetColor: BColors.lightGrey,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 16,
      color: BColors.fadedBlack,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      color: BColors.fadedBlack,
    ),

    ///this is a replacement for button
    labelMedium: TextStyle(
      fontSize: 15,
      color: BColors.fadedBlack,
    ),

    /// this is a replacement for header 1
    headlineLarge: TextStyle(
      fontSize: 24,
      color: BColors.fadedBlack,
      fontWeight: FontWeight.bold,
    ),

    /// this is a replacement for header 2
    headlineMedium: TextStyle(
      fontSize: 22,
      color: BColors.fadedBlack,
      fontWeight: FontWeight.bold,
    ),

    /// this is a replacement for header 3
    headlineSmall: TextStyle(
      fontSize: 20,
      color: BColors.fadedBlack,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: BColors.white,
    elevation: 4,
  ),
);
