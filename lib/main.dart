import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/shared/navigation/views/navbar.dart';

import 'features/status/presentation/views/status_page.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spoopy',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Spoopy's Management App"),
          ),
          body: Row(
            children: const [
              SpoopyNavBar(),
              Flexible(child: StatusPage()),
            ],
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
