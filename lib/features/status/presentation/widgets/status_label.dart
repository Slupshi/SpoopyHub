import 'package:flutter/cupertino.dart';
import 'package:spoopy/assets/colors.dart';

class StatusLabel extends StatelessWidget {
  final String label;
  final String content;
  const StatusLabel({super.key, required this.label, required this.content});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: label,
          style: const TextStyle(fontWeight: FontWeight.bold, color: black)),
      TextSpan(
          text: content,
          style: const TextStyle(fontStyle: FontStyle.italic, color: black)),
    ]));
  }
}
