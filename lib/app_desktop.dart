import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/features/logs/presentation/views/desktop/logs_page.dart';
import 'package:spoopy/features/status/presentation/views/desktop/status_page.dart';
import 'package:spoopy/shared/navigation/viewmodels/nav_viewmodel.dart';
import 'package:spoopy/shared/navigation/views/navbar_desktop.dart';

class DesktopApp extends ConsumerWidget {
  const DesktopApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navBarProvider);
    return Row(
      children: [
        SpoopyNavBarDesktop(),
        if (index == 0)
          const StatusPage()
        else if (index == 1)
          const Flexible(
            child: LogsPage(),
          )
        else
          const StatusPage()
      ],
    );
  }
}
