import 'package:flutter/material.dart';

class StatusLabel extends StatelessWidget {
  final String label;
  final String content;
  const StatusLabel({super.key, required this.label, required this.content});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: label,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.textTheme.bodyText2?.color)),
      TextSpan(
          text: content,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              color: theme.textTheme.bodyText2?.color)),
    ]));
  }
}
