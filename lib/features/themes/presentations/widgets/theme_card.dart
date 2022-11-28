import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/assets/colors.dart';
import 'package:spoopy/features/themes/model/themedata_extension.dart';
import 'package:spoopy/features/themes/presentations/viewmodels/themes_manager.dart';

class ThemeCard extends ConsumerWidget {
  final void Function() onClick;
  final bool isDark;
  final Color dominantColor;
  final Color? secondColor;
  final String themeName;

  const ThemeCard(
      {super.key,
      required this.onClick,
      required this.isDark,
      required this.dominantColor,
      required this.themeName,
      this.secondColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.lineColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: InkWell(
        onTap: onClick,
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: secondColor == null
                  ? Container(
                      color: dominantColor,
                    )
                  : Row(
                      children: [
                        Flexible(
                            flex: 1, child: Container(color: dominantColor)),
                        Flexible(flex: 1, child: Container(color: secondColor)),
                      ],
                    ),
            ),
            Flexible(
              flex: 1,
              child: SizedBox.expand(
                child: Container(
                  color: isDark ? black : white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        height: 10,
                      ),
                      Text(
                        "[${isDark ? "Dark" : "Light"}] $themeName",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDark ? white : black,
                        ),
                      ),
                      const SizedBox(
                        width: double.infinity,
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
