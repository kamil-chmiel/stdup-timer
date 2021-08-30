import 'package:flutter/foundation.dart';
import 'package:standup_timer/models/participant.dart';

abstract class TeamState {}

class InitialTeamState implements TeamState {}

class ChosenTeamState implements TeamState {
  final String teamId;
  final List<Participant> participants;

  ChosenTeamState({@required this.teamId, this.participants});
}
