import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spoopy/assets/themes.dart';
import 'package:spoopy/features/themes/model/themedata_extension.dart';

import '../../model/theme.dart';

part 'themes_manager.g.dart';

enum Themes { lightMLM, darkMLM, lightSpoopy, darkSpoopy, multiColor }

class ThemeState {
  ThemeData currentTheme;
  ThemeState({required this.currentTheme});

  List<ThemeItem> themes = [
    ThemeItem(
      name: "Spoopy",
      isDark: false,
      primaryColor: AppThemes.lightSpoopyTheme.primaryColorBrush,
      themeType: Themes.lightSpoopy,
    ),
    ThemeItem(
      name: "Spoopy",
      isDark: true,
      primaryColor: AppThemes.darkSpoopyTheme.primaryColorBrush,
      themeType: Themes.darkSpoopy,
    ),
    ThemeItem(
      name: "MLM",
      isDark: false,
      primaryColor: AppThemes.lightMLMTheme.primaryColorBrush,
      themeType: Themes.lightMLM,
    ),
    ThemeItem(
      name: "MLM",
      isDark: true,
      primaryColor: AppThemes.darkMLMTheme.primaryColorBrush,
      themeType: Themes.darkMLM,
    ),
    ThemeItem(
      name: "MulticolorTest",
      isDark: false,
      primaryColor: AppThemes.multiColorTheme.primaryColorBrush,
      secondColor: AppThemes.multiColorTheme.backgroundColorBrush,
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
