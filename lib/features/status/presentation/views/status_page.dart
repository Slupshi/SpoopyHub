import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import 'package:spoopy/assets/colors.dart';
import 'package:spoopy/features/status/presentation/viewmodels/status_viewmodel.dart';
import 'package:spoopy/shared/utilities.dart';

final statusProvider = StateNotifierProvider<StatusNotifier, StatusState>(
    ((ref) => StatusNotifier()));

class StatusPage extends ConsumerWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StatusState statusState = ref.watch(statusProvider);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  homeCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            iconSize: 150,
                            splashRadius: 70,
                            onPressed: () {
                              ref
                                  .read(statusProvider.notifier)
                                  .changeStatus(!statusState.isLogged);
                            },
                            icon: Icon(
                              Icons.power_settings_new,
                              color: statusState.isLogged ? darkGreen : red,
                            )),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: FlutterSwitch(
                              activeColor: darkGreen,
                              activeTextColor: white,
                              showOnOff: true,
                              value: statusState.isLogged,
                              onToggle: ((value) {
                                ref
                                    .read(statusProvider.notifier)
                                    .changeStatus(value);
                                ref.read(statusProvider.notifier).getLogs();
                              })),
                        ),
                        const SizedBox(height: 15, width: double.infinity),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            statusLabel("Logged : ",
                                statusState.isLogged ? 'Yes' : 'No'),
                            statusLabel("Log time : ",
                                Utilities.durationFormat(statusState.logTime)),
                            statusLabel("Run time : ",
                                Utilities.durationFormat(statusState.runTime))
                          ],
                        )
                      ],
                    ),
                  ),
                  homeCard(
                    child: Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                                color: black,
                              ),
                          itemCount: statusState.logs.length > 7
                              ? 7
                              : statusState.logs.length,
                          itemBuilder: ((context, index) => ListTile(
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(DateFormat.yMd()
                                        .add_jm()
                                        .format(statusState.logs[index].time)),
                                    const VerticalDivider(
                                      color: black,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                                title: Text(statusState.logs[index].message),
                                trailing: Text(
                                  statusState.logs[index].isError
                                      ? 'ERROR'
                                      : 'INFO',
                                  style: TextStyle(
                                      color: statusState.logs[index].isError
                                          ? red
                                          : black),
                                ),
                              ))),
                    )),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  homeCard(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                      children: [
                        statusLabel(
                            "API Calls : ", statusState.apiCalls.toString()),
                      ],
                    ),
                  )),
                  homeCard(child: const Text("toto")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget homeCard({required Widget child}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          color: white,
          elevation: 5,
          child: SizedBox.expand(
            child: Center(child: child),
          ),
        ),
      ),
    );
  }

  Widget statusLabel(String label, String content) {
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
