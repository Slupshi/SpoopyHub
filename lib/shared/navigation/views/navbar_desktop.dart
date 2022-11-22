import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/assets/colors.dart';

import 'package:spoopy/shared/navigation/models/nav_item.dart';

import '../viewmodels/nav_viewmodel.dart';

class SpoopyNavBarDesktop extends ConsumerWidget {
  final List<NavBarItem> items = [
    const NavBarItem(index: 0, text: "Status", icon: Icons.query_stats_rounded),
    const NavBarItem(index: 1, text: "Logs", icon: Icons.list_alt),
    const NavBarItem(index: 2, text: "ThemeSelector", icon: Icons.brush),
  ];

  SpoopyNavBarDesktop({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateIndex = ref.watch(navBarProvider);
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.primary,
      width: 200,
      height: double.infinity,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => Container(
          color: stateIndex == index
              ? theme.colorScheme.primaryContainer
              : transparent,
          child: ListTile(
            leading: Icon(
              items[index].icon,
              color: white,
            ),
            title: Text(
              items[index].text,
              style: TextStyle(
                  color: white,
                  fontWeight: index == stateIndex
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
            onTap: () {
              ref.read(navBarProvider.notifier).changeIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
