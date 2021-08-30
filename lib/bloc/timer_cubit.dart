import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standup_timer/bloc/timer_state.dart';
import 'package:standup_timer/models/participant.dart';
import 'package:standup_timer/utils/audio_manager.dart';

import '../di_container.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit()
      : super(InitialTimerState(participants: [
          Participant('Adam', true),
          Participant('Dominik', true),
          Participant('Patrycja', true),
          Participant('Paweł', true),
        ]));

  void shuffleParticipants() {
    if (state is InitialTimerState) {
      final shuffledParticipants = state.participants;
      shuffledParticipants.shuffle();
      emit(InitialTimerState(participants: shuffledParticipants));
    }
  }

  void nextParticipant() {
    int currentParticipant = 0;
    if (state is InProgressTimerState) {
      currentParticipant =
          (state as InProgressTimerState).currentParticipant + 1;
    }
    if (currentParticipant <
        state.participants.where((element) => element.isPresent).length) {
      if (currentParticipant == 0) {
        sl<AudioManager>().playGong();
      }
      sl<AudioManager>().playNextParticipant();
    }
    sl<AudioManager>().playTicking();

    emit(InProgressTimerState(
      participants: state.participants,
      currentParticipant: currentParticipant,
    ));
  }

  void finishStandup() {
    sl<AudioManager>().playCongratulations();
    emit(InitialTimerState(participants: state.participants));
  }

  void changeParticipantPresence(String id, bool newValue) {
    final indexOfparticipantToChange =
        state.participants.indexWhere((element) => element.id == id);

    final currentParticipants = state.participants;
    currentParticipants[indexOfparticipantToChange].isPresent = newValue;
    emit(state.copyWith(participants: currentParticipants));
  }

  void addParticipant(String name) {
    emit(
      state.copyWith(
        participants: state.participants +
            [
              Participant(name, true),
            ],
      ),
    );
  }

  void removeParticipant(String id) {
    state.participants.removeWhere((element) => element.id == id);
    emit(
      state.copyWith(participants: state.participants),
    );
  }
}
