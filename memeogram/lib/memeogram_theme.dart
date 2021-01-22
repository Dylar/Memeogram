import 'package:flutter/material.dart';

class BaseColors {
  static const Color primary = Color.fromRGBO(27, 102, 179, 1);

  static const Color primaryLight = Color.fromRGBO(246, 249, 253, 1);

  static const Color green = Color.fromRGBO(121, 206, 27, 1);

  static const Color yellow = Color.fromRGBO(252, 229, 49, 1);

  static const Color red = Color.fromRGBO(176, 0, 32, 1);

  static const Color darkGrey = Color.fromRGBO(0, 0, 0, 0.87);

  static const Color lightGrey = Color.fromRGBO(0, 0, 0, 0.6);

  static const Color veryLightGrey = Color.fromRGBO(196, 196, 196, 1);

  static const Color veryVeryLightGrey = Color.fromRGBO(245, 245, 245, 1);

  // equivalent to #3196E5 at 8% opacity on white
  static const Color selectedState = Color.fromRGBO(240, 247, 253, 1);

  static const Color highlighted = Color.fromRGBO(49, 150, 229, 1);

  static const Color accent = veryLightGrey;

  static const Color lightAccent = veryVeryLightGrey;

  static const Color accentText = darkGrey;

  /// Color for highlighting the current day
  static const Color today = Color(0xFFF27910);
}

const TextTheme textSizes = TextTheme(
    bodyText1: TextStyle(fontSize: 14.0),
    bodyText2: TextStyle(fontSize: 12.0),
    subtitle1: TextStyle(fontSize: 16.0),
    subtitle2: TextStyle(fontSize: 16.0, letterSpacing: 0.25),
    caption: TextStyle(fontSize: 12.0),
    button: TextStyle(fontSize: 14, letterSpacing: 1.25),
    headline6: TextStyle(letterSpacing: 0.25, fontSize: 20.0));

const TextTheme textColors = TextTheme(
    bodyText1: TextStyle(color: BaseColors.lightGrey),
    bodyText2: TextStyle(color: BaseColors.lightGrey),
    subtitle1: TextStyle(color: Colors.black),
    subtitle2: TextStyle(color: BaseColors.lightGrey),
    caption: TextStyle(color: BaseColors.primary));

const TextTheme primaryTextColors = TextTheme(
    bodyText2: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6)),
    subtitle1: TextStyle(color: Colors.white),
    subtitle2: TextStyle(color: BaseColors.primary),
    headline6: TextStyle(color: BaseColors.darkGrey));

const TextTheme accentTextColors = TextTheme(
    subtitle1: TextStyle(color: BaseColors.darkGrey),
    subtitle2: TextStyle(color: BaseColors.veryVeryLightGrey));

final ThemeData memeogramTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: BaseColors.primary,
  accentColor: BaseColors.accent,
  fontFamily: 'RobotoCondensed',
  primaryTextTheme: textSizes.merge(primaryTextColors),
  accentTextTheme: textSizes.merge(accentTextColors),
  textTheme: textSizes.merge(textColors),
  canvasColor: Colors.white,
  backgroundColor: Colors.white,
  iconTheme: const IconThemeData(color: BaseColors.lightGrey),
  tabBarTheme: const TabBarTheme(
      labelColor: BaseColors.darkGrey,
      unselectedLabelColor: BaseColors.veryLightGrey,
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: BaseColors.lightGrey, width: 2.0))),
  appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: BaseColors.lightGrey)),
  inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: BaseColors.primary),
      floatingLabelBehavior: FloatingLabelBehavior.always),
);
