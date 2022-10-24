import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/assets/colors.dart';

import 'package:spoopy/shared/navigation/models/nav_item.dart';

import '../viewmodels/nav_viewmodel.dart';

class SpoopyNavBarDesktop extends ConsumerWidget {
  final List<NavBarItem> items = [
    const NavBarItem(index: 0, text: "Status", icon: Icons.query_stats_rounded),
    const NavBarItem(index: 1, text: "Logs", icon: Icons.list_alt),
  ];

  SpoopyNavBarDesktop({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateIndex = ref.watch(navBarProvider);
    return Container(
      color: darkOrange,
      width: 200,
      height: double.infinity,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) =>
            navBarItem(items[index], stateIndex, ref),
      ),
    );
  }

  Widget navBarItem(NavBarItem item, int actualIndex, WidgetRef ref) {
    return Container(
      color: actualIndex == item.index ? darkOrangeAccent : transparent,
      child: ListTile(
        leading: Icon(
          item.icon,
          color: white,
        ),
        title: Text(
          item.text,
          style: TextStyle(
              color: white,
              fontWeight: item.index == actualIndex
                  ? FontWeight.bold
                  : FontWeight.normal),
        ),
        onTap: () {
          ref.read(navBarProvider.notifier).changeIndex(item.index);
        },
      ),
    );
  }
}
