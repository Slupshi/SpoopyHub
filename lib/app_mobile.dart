import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/features/status/presentation/views/status_page.dart';
import 'package:spoopy/shared/navigation/viewmodels/nav_viewmodel.dart';

class MobileApp extends ConsumerWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navBarProvider);
    return Column(
      children: [
        if (index == 0)
          const StatusPage()
        else if (index == 1)
          const Flexible(
            child: Text("Logs"),
          )
        else
          const StatusPage()
      ],
    );
  }
}
