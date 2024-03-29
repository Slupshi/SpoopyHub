import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/features/themes/presentations/viewmodels/themes_manager.dart';
import 'package:spoopy/features/themes/presentations/widgets/theme_card.dart';

class ThemesSelectorPage extends ConsumerWidget {
  const ThemesSelectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeManager = ref.read(themeManagerProvider);
    return Expanded(
      child: Row(
        children: [
          const Spacer(flex: 1),
          Flexible(
            flex: 1,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
              children: List.generate(
                  themeManager.themes.length,
                  (index) => ThemeCard(
                      onClick: () => ref
                          .read(themeManagerProvider.notifier)
                          .changeTheme(themeManager.themes[index].themeType),
                      isDark: themeManager.themes[index].isDark,
                      dominantColor: themeManager.themes[index].primaryColor,
                      secondColor: themeManager.themes[index].secondColor,
                      themeName: themeManager.themes[index].name)),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
