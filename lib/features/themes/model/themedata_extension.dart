import 'package:flutter/material.dart';

extension ThemeDataExtension on ThemeData {
  TextStyle get h1TextStyle => textTheme.headline1!;
  TextStyle get h2TextStyle => textTheme.headline2!;
  TextStyle get bodyTextStyle => textTheme.bodyText2!;

  Color get textColor => textTheme.bodyText2!.color!;

  Color get primaryColorBrush => colorScheme.primary;
  Color get primaryAccentColorBrush => colorScheme.primaryContainer;

  Color get secondaryColorBrush => colorScheme.secondary;
  Color get secondaryAccentColorBrush => colorScheme.secondaryContainer;

  Color get tertiaryColorBrush => colorScheme.tertiary;
  Color get tertiaryAccentColorBrush => colorScheme.tertiaryContainer;

  Color get errorColorBrush => colorScheme.error;
  Color get backgroundColorBrush => scaffoldBackgroundColor;
  Color get lineColor => colorScheme.outline;
}
