import 'package:flutter/material.dart';
import 'package:spoopy/assets/colors.dart';

class ThemeCard extends StatelessWidget {
  final void Function() onClick;
  final bool isDark;
  final Color dominantColor;
  final String themeName;

  const ThemeCard(
      {super.key,
      required this.onClick,
      required this.isDark,
      required this.dominantColor,
      required this.themeName});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Theme.of(context).textTheme.bodyText2 != null
                ? Theme.of(context).textTheme.bodyText2!.color!
                : white,
            width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: SizedBox(
        width: 300,
        height: 150,
        child: InkWell(
          onTap: onClick,
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  color: dominantColor,
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
      ),
    );
  }
}
