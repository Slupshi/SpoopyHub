import 'package:flutter/material.dart';

import 'package:spoopy/shared/navigation/widgets/nav_item.dart';

class SpoopyNavBar extends StatefulWidget {
  const SpoopyNavBar({super.key});

  static List<NavBarItem> items = [
    const NavBarItem(
        index: 0, text: "Status", icon: Icon(Icons.query_stats_rounded)),
    const NavBarItem(index: 0, text: "Logs", icon: Icon(Icons.list_alt)),
  ];

  @override
  State<StatefulWidget> createState() => SpoopyNavBarState();
}

class SpoopyNavBarState extends State<SpoopyNavBar> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      width: 200,
      height: double.infinity,
      child: ListView.builder(
        itemCount: SpoopyNavBar.items.length,
        itemBuilder: (BuildContext context, int index) =>
            navBarItem(SpoopyNavBar.items[index]),
      ),
    );
  }

  Widget navBarItem(NavBarItem item) {
    return ListTile(
      leading: item.icon,
      title: Text(item.text),
      onTap: () {
        setState(() {
          _index = item.index;
        });
      },
    );
  }
}
