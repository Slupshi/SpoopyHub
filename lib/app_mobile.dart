import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/features/logs/presentation/views/mobile/logs_page_mobile.dart';
import 'package:spoopy/features/status/presentation/views/mobile/status_page_mobile.dart';
import 'package:spoopy/shared/navigation/viewmodels/nav_viewmodel.dart';

class MobileApp extends ConsumerWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navBarProvider);
    return Column(
      children: [
        if (index == 0)
          const StatusPageMobile()
        else if (index == 1)
          const Flexible(child: LogsPageMobile())
        else
          const StatusPageMobile()
      ],
    );
  }
}
