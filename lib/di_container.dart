import 'package:get_it/get_it.dart';
import 'package:standup_timer/utils/audio_manager.dart';

import 'bloc/team_cubit.dart';
import 'bloc/timer_cubit.dart';

final sl = GetIt.instance;

void setupSl() {
  sl.registerLazySingleton<AudioManager>(() => AudioManager());
  sl.registerLazySingleton<TimerCubit>(() => TimerCubit());
  sl.registerLazySingleton<TeamCubit>(() => TeamCubit());
}
