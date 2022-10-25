import 'package:flutter/material.dart';
import 'package:spoopy/assets/colors.dart';

class HomeCard extends StatelessWidget {
  final Widget child;
  const HomeCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          color: whiteBackground,
          elevation: 5,
          child: SizedBox.expand(
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
