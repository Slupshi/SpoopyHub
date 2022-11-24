import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/features/themes/presentations/viewmodels/themes_manager.dart';

import '../../widgets/theme_card.dart';

class ThemesPagesMobile extends ConsumerWidget {
  const ThemesPagesMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeManager = ref.watch(appThemeStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spoopy's Management App"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          childAspectRatio: 1.4,
          children: List.generate(
              themeManager.themes.length,
              (index) => ThemeCard(
                  onClick: () => ref
                      .read(appThemeStateNotifierProvider.notifier)
                      .changeTheme(themeManager.themes[index].themeType),
                  isDark: themeManager.themes[index].isDark,
                  dominantColor: themeManager.themes[index].primaryColor,
                  secondColor: themeManager.themes[index].secondColor,
                  themeName: themeManager.themes[index].name)),
        ),
      ),
    );
  }
}
