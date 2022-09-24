import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/app_desktop.dart';
import 'package:spoopy/app_mobile.dart';
import 'dart:io' show Platform;

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
          body: Platform.isWindows ? const DesktopApp() : const MobileApp()),
      debugShowCheckedModeBanner: false,
    );
  }
}
