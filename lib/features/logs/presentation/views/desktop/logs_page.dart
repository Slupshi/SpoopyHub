import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:spoopy/assets/colors.dart';
import 'package:spoopy/features/logs/presentation/viewmodels/logs_viewmodel.dart';
import 'package:spoopy/features/themes/model/themedata_extension.dart';

class LogsPage extends ConsumerWidget {
  const LogsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsState = ref.watch(logsProvider);
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        // TODO: remove Column and Elevated Button
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(height: 1, width: 20),
              Text(
                "Logs",
                style: theme.h1TextStyle,
              ),
              const SizedBox(height: 1, width: 20),
              ElevatedButton(
                  onPressed: () => ref.read(logsProvider.notifier).getLogs(),
                  child: const Text("Test"))
            ],
          ),
          const SizedBox(width: double.infinity, height: 15),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: black, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: logsState.logs[index].isError ? red : white,
                      ),
                      itemCount: logsState.logs.length,
                      itemBuilder: ((context, index) => ListTile(
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  DateFormat.yMd()
                                      .add_jm()
                                      .format(logsState.logs[index].time),
                                  style: const TextStyle(color: white),
                                ),
                                const VerticalDivider(
                                  color: white,
                                  thickness: 1,
                                ),
                              ],
                            ),
                            title: Text(
                              logsState.logs[index].message,
                              style: const TextStyle(color: white),
                            ),
                            trailing: Text(
                              logsState.logs[index].isError ? 'ERROR' : 'INFO',
                              style: TextStyle(
                                  color: logsState.logs[index].isError
                                      ? theme.errorColorBrush
                                      : white,
                                  fontWeight: logsState.logs[index].isError
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          )),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
