import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spoopy/assets/themes.dart';

import '../../../../assets/colors.dart';
import '../../model/theme.dart';

part 'themes_manager.g.dart';

// final appThemeStateNotifierProvider =
//     NotifierProvider<ThemeManager, ThemeState>(() => ThemeManager());

// final appThemeStateNotifierProvider =
//     NotifierProvider<ThemeManager, ThemeState>(ThemeManager.new);

enum Themes { lightMLM, darkMLM, lightSpoopy, darkSpoopy, multiColor }

class ThemeState {
  ThemeData currentTheme;
  ThemeState({required this.currentTheme});

  List<ThemeItem> themes = [
    ThemeItem(
      name: "Spoopy",
      isDark: false,
      primaryColor: darkOrange,
      themeType: Themes.lightSpoopy,
    ),
    ThemeItem(
      name: "Spoopy",
      isDark: true,
      primaryColor: darkOrange,
      themeType: Themes.darkSpoopy,
    ),
    ThemeItem(
      name: "MLM",
      isDark: false,
      primaryColor: darkGreenMLM,
      themeType: Themes.lightMLM,
    ),
    ThemeItem(
      name: "MLM",
      isDark: true,
      primaryColor: darkGreenMLM,
      themeType: Themes.darkMLM,
    ),
    ThemeItem(
      name: "MulticolorTest",
      isDark: false,
      primaryColor: Colors.green,
      secondColor: Colors.amber,
      themeType: Themes.multiColor,
    ),
  ];

  ThemeState copyWith({ThemeData? currentTheme}) =>
      ThemeState(currentTheme: currentTheme ?? this.currentTheme);
}

@riverpod
class ThemeManager extends _$ThemeManager {
  @override
  ThemeState build() => ThemeState(currentTheme: AppThemes.lightSpoopyTheme);

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
      case Themes.multiColor:
        state = state.copyWith(currentTheme: AppThemes.multiColorTheme);
        break;
      default:
        state = state.copyWith(currentTheme: AppThemes.lightSpoopyTheme);
    }
  }
}
