import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/features/logs/models/spoopy_logs.dart';

class StatusState {
  bool isLogged;
  Duration logTime;
  Duration runTime;
  int apiCalls;
  List<SpoopyLogs> logs;

  StatusState({
    this.isLogged = false,
    this.logTime = Duration.zero,
    this.runTime = Duration.zero,
    this.apiCalls = 0,
    this.logs = const [],
  });

  StatusState copyWith({
    bool? isLogged,
    Duration? logTime,
    Duration? runTime,
    int? apiCalls,
    List<SpoopyLogs>? logs,
  }) {
    return StatusState(
      isLogged: isLogged ?? this.isLogged,
      logTime: logTime ?? this.logTime,
      runTime: runTime ?? this.runTime,
      apiCalls: apiCalls ?? this.apiCalls,
      logs: logs ?? this.logs,
    );
  }
}

class StatusNotifier extends StateNotifier<StatusState> {
  StatusNotifier() : super(StatusState());

  void changeStatus(bool status) {
    state = state.copyWith(isLogged: status);
  }

  void getLogs() {
    state = state.copyWith(logs: [
      SpoopyLogs(
          id: 1, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 2, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 3,
          message: "Erreur avec la commande /help",
          isError: true,
          time: DateTime.now()),
    ]);
  }
}
