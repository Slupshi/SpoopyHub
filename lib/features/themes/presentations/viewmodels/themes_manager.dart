import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/assets/themes.dart';

import '../../../../assets/colors.dart';
import '../../model/theme.dart';

final appThemeStateNotifierProvider =
    StateNotifierProvider<ThemeManager, ThemeState>((ref) => ThemeManager());

enum Themes { lightMLM, darkMLM, lightSpoopy, darkSpoopy }

class ThemeState {
  ThemeData currentTheme;
  ThemeState({required this.currentTheme});

  List<ThemeItem> themes = [
    ThemeItem(
        name: "Spoopy",
        isDark: false,
        primaryColor: darkOrange,
        themeType: Themes.lightSpoopy),
    ThemeItem(
        name: "Spoopy",
        isDark: true,
        primaryColor: darkOrange,
        themeType: Themes.darkSpoopy),
    ThemeItem(
        name: "MLM",
        isDark: false,
        primaryColor: darkGreenMLM,
        themeType: Themes.lightMLM),
    ThemeItem(
        name: "MLM",
        isDark: true,
        primaryColor: darkGreenMLM,
        themeType: Themes.darkMLM),
  ];

  ThemeState copyWith({ThemeData? currentTheme}) =>
      ThemeState(currentTheme: currentTheme ?? this.currentTheme);
}

class ThemeManager extends StateNotifier<ThemeState> {
  ThemeManager() : super(ThemeState(currentTheme: AppThemes.lightSpoopyTheme));

  void changeTheme(Themes selectedTheme) {
    switch (selectedTheme) {
      case Themes.lightSpoopy:
        state = state.copyWith(currentTheme: AppThemes.lightSpoopyTheme);
        break;
      case Themes.darkSpoopy:
        state = state.copyWith(currentTheme: AppThemes.darkSpoopyTheme);
        break;
      case Themes.lightMLM:
        state = state.copyWith(currentTheme: AppThemes.lightMLMTheme);
        break;
      case Themes.darkMLM:
        state = state.copyWith(currentTheme: AppThemes.darkMLMTheme);
        break;
      default:
        state = state.copyWith(currentTheme: AppThemes.lightSpoopyTheme);
    }
  }

  TextStyle? getH1TextStyle(BuildContext context) =>
      Theme.of(context).textTheme.headline1;

  TextStyle? getH2TextStyle(BuildContext context) =>
      Theme.of(context).textTheme.headline2;

  TextStyle? getBodyTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyText2;

  Color getLineColor(BuildContext context) =>
      Theme.of(context).colorScheme.outline;

  Color getTextColor(BuildContext context) =>
      Theme.of(context).textTheme.bodyText2!.color!;
}
