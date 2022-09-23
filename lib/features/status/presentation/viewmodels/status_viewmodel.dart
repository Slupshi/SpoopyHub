import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatusState {
  bool isLogged;

  StatusState({
    this.isLogged = false,
  });

  StatusState copyWith({
    bool? isLogged,
  }) {
    return StatusState(
      isLogged: isLogged ?? this.isLogged,
    );
  }
}

class StatusNotifier extends StateNotifier<StatusState> {
  StatusNotifier() : super(StatusState());

  void changeStatus(bool status) {
    state = state.copyWith(isLogged: status);
  }
}
