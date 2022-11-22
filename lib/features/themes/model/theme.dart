import 'package:flutter/material.dart';

import '../presentations/viewmodels/themes_manager.dart';

class ThemeItem {
  final String name;
  final Color primaryColor;
  final bool isDark;
  final Themes themeType;

  ThemeItem({
    required this.name,
    required this.isDark,
    required this.primaryColor,
    required this.themeType,
  });
}
