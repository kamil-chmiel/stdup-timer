import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standup_timer/bloc/team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  TeamCubit() : super(InitialTeamState());

  setTeamIdentifier(String identifier) {
    emit(ChosenTeamState(teamId: identifier));
  }
}
