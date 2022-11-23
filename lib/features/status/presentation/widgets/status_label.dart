import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/features/themes/presentations/viewmodels/themes_manager.dart';

class StatusLabel extends ConsumerWidget {
  final String label;
  final String content;
  const StatusLabel({super.key, required this.label, required this.content});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeManager themeManager =
        ref.read(appThemeStateNotifierProvider.notifier);
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: label,
          style: themeManager
              .getBodyTextStyle(context)!
              .copyWith(fontWeight: FontWeight.bold)),
      TextSpan(
          text: content,
          style: themeManager
              .getBodyTextStyle(context)!
              .copyWith(fontStyle: FontStyle.italic)),
    ]));
  }
}
