import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:standup_timer/bloc/timer_cubit.dart';
import 'package:standup_timer/bloc/timer_state.dart';
import 'package:standup_timer/utils/audio_manager.dart';

import '../di_container.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  CountdownTimerController controller;
  static int timerLength = 150;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * timerLength;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(
      endTime: endTime,
      onEnd: () => sl<AudioManager>().playAlarm(),
    );
  }

  void _onNextParticipant() {
    sl<TimerCubit>().nextParticipant();
    controller.disposeTimer();
    controller.endTime =
        DateTime.now().millisecondsSinceEpoch + 1000 * timerLength;
    controller.start();
  }

  _buildTimerWidget(CurrentRemainingTime time) {
    if (time == null) {
      return Text('TIME IS OVER');
    }
    return Text(
      '${time.min != null ? time.min : 0}:${time.sec < 10 ? "0" + time.sec.toString() : time.sec}',
      style: Theme.of(context).textTheme.headline1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: <
        Widget>[
      Column(children: [
        CountdownTimer(
          controller: controller,
          onEnd: () => sl<AudioManager>().playAlarm(),
          endTime: endTime,
          widgetBuilder: (_, CurrentRemainingTime time) {
            print(
                'WYNIK: ${time != null ? ((time.min != null ? time.min * 60 : 0) + (time.sec ?? 0)) : 1}');
            return CircularPercentIndicator(
              radius: 400,
              lineWidth: 15.0,
              percent: (time != null
                      ? (time.min != null ? time.min * 60 : 0) + (time.sec ?? 0)
                      : 1) /
                  timerLength,
              center: _buildTimerWidget(time),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purple,
            );
          },
        ),
        SizedBox(
          height: 40,
        ),
        BlocBuilder<TimerCubit, TimerState>(builder: (context, state) {
          if (state is InProgressTimerState) {
            final currentParticipant = state.currentParticipant;
            final presentParticipants = state.participants
                .where((element) => element.isPresent)
                .toList();
            return Column(children: [
              Text(
                currentParticipant >= 0 &&
                        currentParticipant < presentParticipants.length
                    ? presentParticipants[currentParticipant].name
                    : "Participant",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 50,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                currentParticipant < presentParticipants.length - 1
                    ? Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.purple.shade500,
                                  ),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ))),
                              onPressed: _onNextParticipant,
                              child: Container(
                                height: 60,
                                width: 230,
                                child: Center(
                                  child: Text(
                                    "Next",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 50,
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue.shade500,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ))),
                    onPressed: () => sl<TimerCubit>().finishStandup(),
                    child: Container(
                      height: 60,
                      width: 230,
                      child: Center(
                        child: Text(
                          "Finish",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ))
              ])
            ]);
          } else {
            return Text('-');
          }
        }),
      ]),
    ]);
  }

  @override
  void dispose() {
    sl<AudioManager>().stopAudio();
    controller.dispose();
    super.dispose();
  }
}
