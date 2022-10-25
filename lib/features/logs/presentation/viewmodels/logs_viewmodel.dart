import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoopy/features/logs/models/spoopy_logs.dart';

final logsProvider =
    StateNotifierProvider<LogsNotifier, LogsState>(((ref) => LogsNotifier()));

class LogsState {
  List<SpoopyLogs> logs;
  LogsState({this.logs = const []});

  LogsState copyWith({List<SpoopyLogs>? logs}) =>
      LogsState(logs: logs ?? this.logs);
}

class LogsNotifier extends StateNotifier<LogsState> {
  LogsNotifier() : super(LogsState());

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
      SpoopyLogs(
          id: 1, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 2, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 3,
          message: "Erreur avec la commande /help",
          isError: true,
          time: DateTime.now()),
      SpoopyLogs(
          id: 1, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 2, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 3,
          message: "Erreur avec la commande /help",
          isError: true,
          time: DateTime.now()),
      SpoopyLogs(
          id: 1, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 2, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 3,
          message: "Erreur avec la commande /help",
          isError: true,
          time: DateTime.now()),
      SpoopyLogs(
          id: 1, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 2, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 3,
          message: "Erreur avec la commande /help",
          isError: true,
          time: DateTime.now()),
      SpoopyLogs(
          id: 1, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 2, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 3,
          message: "Erreur avec la commande /help",
          isError: true,
          time: DateTime.now()),
      SpoopyLogs(
          id: 1, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 2, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 3,
          message: "Erreur avec la commande /help",
          isError: true,
          time: DateTime.now()),
      SpoopyLogs(
          id: 1, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 2, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 3,
          message: "Erreur avec la commande /help",
          isError: true,
          time: DateTime.now()),
      SpoopyLogs(
          id: 1, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 2, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 3,
          message: "Erreur avec la commande /help",
          isError: true,
          time: DateTime.now()),
      SpoopyLogs(
          id: 1, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 2, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 3,
          message: "Erreur avec la commande /help",
          isError: true,
          time: DateTime.now()),
      SpoopyLogs(
          id: 1, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 2, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 3,
          message: "Erreur avec la commande /help",
          isError: true,
          time: DateTime.now()),
      SpoopyLogs(
          id: 1, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 2, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 3,
          message: "Erreur avec la commande /help",
          isError: true,
          time: DateTime.now()),
      SpoopyLogs(
          id: 1, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 2, message: "Nouveau Role", isError: false, time: DateTime.now()),
      SpoopyLogs(
          id: 3,
          message: "Erreur avec la commande /help",
          isError: true,
          time: DateTime.now()),
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
