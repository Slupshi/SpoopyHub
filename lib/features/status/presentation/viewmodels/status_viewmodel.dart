import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatusState {
  bool isLogged;
  Duration logTime;
  Duration runTime;

  StatusState({
    this.isLogged = false,
    this.logTime = Duration.zero,
    this.runTime = Duration.zero,
  });

  StatusState copyWith({
    bool? isLogged,
    Duration? logTime,
    Duration? runTime,
  }) {
    return StatusState(
      isLogged: isLogged ?? this.isLogged,
      logTime: logTime ?? this.logTime,
      runTime: runTime ?? this.runTime,
    );
  }
}

class StatusNotifier extends StateNotifier<StatusState> {
  StatusNotifier() : super(StatusState());

  void changeStatus(bool status) {
    state = state.copyWith(isLogged: status);
  }
}
