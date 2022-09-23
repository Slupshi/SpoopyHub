import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:spoopy/features/status/presentation/viewmodels/status_viewmodel.dart';

final statusProvider = StateNotifierProvider<StatusNotifier, StatusState>(
    ((ref) => StatusNotifier()));

class StatusPage extends ConsumerWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StatusState statusState = ref.watch(statusProvider);
    return Center(
      child: Column(children: [
        Row(
          children: [
            FlutterSwitch(
                activeColor: Colors.green.shade900,
                activeTextColor: Colors.white,
                showOnOff: true,
                value: statusState.isLogged,
                onToggle: ((value) {
                  ref.read(statusProvider.notifier).changeStatus(value);
                })),
            const Text("Test")
          ],
        ),
      ]),
    );
  }
}
