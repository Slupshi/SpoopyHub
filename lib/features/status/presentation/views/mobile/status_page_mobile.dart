import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import 'package:spoopy/assets/colors.dart';
import 'package:spoopy/features/status/presentation/viewmodels/status_viewmodel.dart';
import 'package:spoopy/features/status/presentation/widgets/home_card.dart';
import 'package:spoopy/features/status/presentation/widgets/status_label.dart';
import 'package:spoopy/shared/utilities.dart';

class StatusPageMobile extends ConsumerWidget {
  const StatusPageMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusState = ref.watch(statusProvider);
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          HomeCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10, width: double.infinity),
                Material(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(150)),
                  child: IconButton(
                      iconSize: 70,
                      splashRadius: 43,
                      onPressed: () {
                        ref
                            .read(statusProvider.notifier)
                            .changeStatus(!statusState.isLogged);
                      },
                      icon: Icon(
                        Icons.power_settings_new,
                        color: statusState.isLogged ? darkGreen : red,
                      )),
                ),
                const SizedBox(height: 10, width: double.infinity),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: FlutterSwitch(
                      activeColor: darkGreen,
                      activeTextColor: white,
                      showOnOff: true,
                      value: statusState.isLogged,
                      onToggle: ((value) {
                        ref.read(statusProvider.notifier).changeStatus(value);
                        ref.read(statusProvider.notifier).getLogs();
                      })),
                ),
                const SizedBox(height: 15, width: double.infinity),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatusLabel(
                        label: "Logged : ",
                        content: statusState.isLogged ? 'Yes' : 'No'),
                    StatusLabel(
                        label: "Log time : ",
                        content: Utilities.durationFormat(statusState.logTime)),
                    StatusLabel(
                        label: "Run time : ",
                        content: Utilities.durationFormat(statusState.runTime))
                  ],
                )
              ],
            ),
          ),
          HomeCard(
            child: Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                        color: black,
                      ),
                  itemCount:
                      statusState.logs.length > 7 ? 7 : statusState.logs.length,
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
                          statusState.logs[index].isError ? 'ERROR' : 'INFO',
                          style: TextStyle(
                              color: statusState.logs[index].isError
                                  ? red
                                  : black),
                        ),
                      ))),
            )),
          ),
          HomeCard(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                StatusLabel(
                    label: "API Calls : ",
                    content: statusState
                        .apiCalls[statusState.apiCalls.length - 1]
                        .toString()),
                Expanded(
                  child: LineChart(LineChartData(
                    minX: 0,
                    minY: 0,
                    lineBarsData: [
                      LineChartBarData(spots: const [
                        FlSpot(1, 1),
                        FlSpot(2, 2),
                        FlSpot(3, 2),
                        FlSpot(4, 5),
                      ], color: darkOrange)
                    ],
                    backgroundColor: lightGrey,
                  )),
                ),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
