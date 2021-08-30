import 'package:flutter/material.dart';
import 'package:standup_timer/models/participant.dart';

abstract class TimerState {
  final List<Participant> participants;

  TimerState({@required this.participants});

  TimerState copyWith({List<Participant> participants});
}

class InitialTimerState extends TimerState {
  InitialTimerState({@required participants})
      : super(participants: participants);

  InitialTimerState copyWith({List<Participant> participants}) =>
      InitialTimerState(participants: participants ?? this.participants);
}

class InProgressTimerState extends TimerState {
  final int currentParticipant;

  InProgressTimerState({
    @required participants,
    @required this.currentParticipant,
  }) : super(participants: participants);

  InProgressTimerState copyWith(
          {List<Participant> participants, int currentParticipant}) =>
      InProgressTimerState(
        participants: participants ?? this.participants,
        currentParticipant: currentParticipant ?? this.currentParticipant,
      );
}
