import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/features/themes/model/themedata_extension.dart';

class StatusLabel extends ConsumerWidget {
  final String label;
  final String content;
  const StatusLabel({super.key, required this.label, required this.content});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: label,
        style: theme.bodyTextStyle.copyWith(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: content,
        style: theme.bodyTextStyle.copyWith(fontStyle: FontStyle.italic),
      ),
    ]));
  }
}
