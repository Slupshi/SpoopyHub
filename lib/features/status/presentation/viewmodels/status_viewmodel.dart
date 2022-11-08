import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/features/logs/models/spoopy_logs.dart';
import 'package:spoopy/shared/api/api_service.dart';

final statusProvider = StateNotifierProvider<StatusNotifier, StatusState>(
    ((ref) => StatusNotifier()));

class StatusState {
  bool isLogged;
  Duration logTime;
  Duration runTime;
  Map<DateTime, int> apiCalls;
  List<SpoopyLogs> logs;

  StatusState({
    this.isLogged = false,
    this.logTime = Duration.zero,
    this.runTime = Duration.zero,
    this.apiCalls = const <DateTime, int>{},
    this.logs = const [],
  });

  StatusState copyWith({
    bool? isLogged,
    Duration? logTime,
    Duration? runTime,
    Map<DateTime, int>? apiCalls,
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

  void getAPICalls() {
    state = state.copyWith(apiCalls: <DateTime, int>{
      DateTime.now(): 1,
      (DateTime.now().add(const Duration(minutes: 1))): 4,
      (DateTime.now().add(const Duration(minutes: 2))): 4,
      (DateTime.now().add(const Duration(minutes: 3))): 5,
    });
  }

  void addAPICall() {
    Map<DateTime, int> apiCalls2 = {};
    apiCalls2.addAll(state.apiCalls);
    apiCalls2.addAll({DateTime.now().add(const Duration(minutes: 4)): 6});
    state = state.copyWith(apiCalls: apiCalls2);
  }
}
