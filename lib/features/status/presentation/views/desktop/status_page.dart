import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import 'package:spoopy/assets/colors.dart';
import 'package:spoopy/features/status/presentation/viewmodels/status_viewmodel.dart';
import 'package:spoopy/features/status/presentation/widgets/home_card.dart';
import 'package:spoopy/features/status/presentation/widgets/status_label.dart';
import 'package:spoopy/features/themes/model/themedata_extension.dart';
import 'package:spoopy/shared/utilities.dart';

class StatusPage extends ConsumerWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StatusState statusState = ref.watch(statusProvider);
    Map<DateTime, int> apiCalls = statusState.apiCalls;

    final ThemeData theme = Theme.of(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  HomeCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(flex: 3),
                        Material(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150)),
                          child: IconButton(
                              iconSize: 150,
                              splashRadius: 83,
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
                        const Spacer(flex: 1),
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
                                ref.read(statusProvider.notifier).getAPICalls();
                              })),
                        ),
                        const Spacer(flex: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            StatusLabel(
                                label: "Logged : ",
                                content: statusState.isLogged ? 'Yes' : 'No'),
                            StatusLabel(
                                label: "Log time : ",
                                content: Utilities.durationFormat(
                                    statusState.logTime)),
                            StatusLabel(
                                label: "Run time : ",
                                content: Utilities.durationFormat(
                                    statusState.runTime))
                          ],
                        ),
                        const Spacer(flex: 4),
                      ],
                    ),
                  ),
                  HomeCard(
                    child: Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                                color: theme.lineColor,
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
                                    VerticalDivider(
                                      color: theme.lineColor,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                                title: Text(
                                  statusState.logs[index].message,
                                  style: theme.bodyTextStyle,
                                ),
                                trailing: Text(
                                  statusState.logs[index].isError
                                      ? 'ERROR'
                                      : 'INFO',
                                  style: TextStyle(
                                    color: statusState.logs[index].isError
                                        ? theme.errorColorBrush
                                        : theme.textColor,
                                  ),
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
                  HomeCard(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                      children: [
                        StatusLabel(
                            label: "API Calls : ",
                            content: statusState
                                .apiCalls[statusState.apiCalls.length - 1]
                                .toString()),
                        Expanded(
                          child: LineChart(LineChartData(
                            baselineX: 0.01,
                            lineBarsData: [
                              LineChartBarData(
                                  spots: createGraphPoint(apiCalls),
                                  color: theme.primaryColorBrush),
                            ],
                            titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                showTitles: true,
                                interval: 0.01,
                                reservedSize: 25,
                                getTitlesWidget: (value, meta) =>
                                    Text(value.toStringAsFixed(2)),
                              )),
                              leftTitles: AxisTitles(),
                              topTitles: AxisTitles(),
                            ),
                            backgroundColor: theme.backgroundColorBrush,
                          )),
                        ),
                      ],
                    ),
                  )),
                  HomeCard(
                      child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            ref.read(statusProvider.notifier).addAPICall(),
                        child: const Text("Test Graph +"),
                      ),
                    ],
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<FlSpot> createGraphPoint(Map<DateTime, int> map) {
    List<FlSpot> charPoint = [];
    map.forEach((key, value) {
      double x = key.hour + (key.minute / 100);
      charPoint.add(FlSpot(x, value.toDouble()));
    });
    return charPoint;
  }
}
