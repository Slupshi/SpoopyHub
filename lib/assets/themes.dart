import 'package:flutter/material.dart';
import 'package:spoopy/assets/colors.dart';
import 'package:spoopy/assets/styles.dart';

class AppThemes {
  /// - [backgroundColor] = Couleur de fond de la page
  /// - [lineColor] = Couleur à choisir pour les Divider
  /// - [textColor] = Couleur par défaut des Text
  /// - [cardColor] = Couleur par défaut des Card
  /// - [primaryColor] = Couleur principale du thème
  /// - [primaryColorAccent] = Variant de la couleur principale
  /// + [secondaryColor] = Couleur secondaire du thème
  /// + [secondaryColorAccent] = Variant de la couleur secondaire
  /// + [tertiaryColor] = Couleur secondaire du thème
  /// + [tertiaryColorAccent] = Variant de la couleur secondaire
  static ThemeData _themeFactory({
    required Color? backgroundColor,
    required Color? lineColor,
    required Color? textColor,
    required Color? cardColor,
    required Color? primaryColor,
    required Color? primaryColorAccent,
    required Color? errorColor,
    Color? secondaryColor,
    Color? secondaryColorAccent,
    Color? tertiaryColor,
    Color? tertiaryColorAccent,
  }) =>
      ThemeData(
        colorScheme: ColorScheme.light(
          outline: lineColor ?? black,
          primary: primaryColor ?? Colors.blue,
          primaryContainer: primaryColorAccent ?? Colors.blueAccent,
          error: errorColor ?? red,
          secondary: secondaryColor ?? Colors.red,
          secondaryContainer: secondaryColorAccent ?? Colors.redAccent,
          tertiary: tertiaryColor ?? Colors.yellow,
          tertiaryContainer: tertiaryColorAccent ?? Colors.yellowAccent,
        ),
        cardColor: cardColor ?? white,
        scaffoldBackgroundColor: backgroundColor ?? whiteBackground,
        textTheme: TextTheme(
          bodyText2: Styles.body.copyWith(color: textColor ?? black),
          headline1: Styles.h1.copyWith(color: textColor ?? black),
          headline2: Styles.h2.copyWith(color: textColor ?? black),
        ),
      );

  static final ThemeData lightSpoopyTheme = _themeFactory(
    backgroundColor: whiteBackground,
    lineColor: black,
    textColor: black,
    cardColor: white,
    primaryColor: darkOrange,
    primaryColorAccent: darkOrangeAccent,
    errorColor: red,
  );

  static final ThemeData darkSpoopyTheme = _themeFactory(
    backgroundColor: blackBackground,
    lineColor: white,
    textColor: white,
    cardColor: black,
    primaryColor: darkOrange,
    primaryColorAccent: darkOrangeAccent,
    errorColor: red,
  );

  // ===== MLM Test ===== //

  static final ThemeData lightMLMTheme = _themeFactory(
    backgroundColor: whiteBackground,
    lineColor: black,
    textColor: black,
    cardColor: whiteBackground,
    primaryColor: darkGreenMLM,
    primaryColorAccent: lightGreenMLM,
    errorColor: red,
  );

  static final ThemeData darkMLMTheme = _themeFactory(
    backgroundColor: blackBackground,
    lineColor: white,
    textColor: white,
    cardColor: black,
    primaryColor: darkGreenMLM,
    primaryColorAccent: blackGreenMLM,
    errorColor: red,
  );

  static final ThemeData multiColorTheme = _themeFactory(
    backgroundColor: Colors.amber,
    lineColor: Colors.pink,
    textColor: Colors.red,
    cardColor: whiteBackground,
    primaryColor: Colors.green,
    primaryColorAccent: Colors.blue,
    errorColor: Colors.deepPurple,
  );
}
