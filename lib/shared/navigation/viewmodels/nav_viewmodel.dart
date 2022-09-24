import 'package:flutter_riverpod/flutter_riverpod.dart';

final navBarProvider =
    StateNotifierProvider<NavBarNotifier, int>(((ref) => NavBarNotifier()));

class NavBarNotifier extends StateNotifier<int> {
  NavBarNotifier({this.index = 0}) : super(0);

  int index;

  void changeIndex(int newIndex) {
    state = newIndex;
  }
}
