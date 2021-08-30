import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:standup_timer/utils/audio_manager.dart';

import '../di_container.dart';

class CountDownWidget extends StatefulWidget {
  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  static int _timerLength = 150;
  int _endTime = DateTime.now().millisecondsSinceEpoch + 1000 * _timerLength;
  CountdownTimerController _countdownController;

  @override
  void initState() {
    super.initState();
    _countdownController = CountdownTimerController(
      endTime: _endTime,
      onEnd: _onTimeout,
    );
  }

  void _onTimeout() {
    final audioManager = sl<AudioManager>();
    audioManager.player.setFilePath('assets/annoying_alarm.wav');
    audioManager.player.play();
  }

  Widget _buildTimerWidget(CurrentRemainingTime time) {
    if (time == null) {
      return Text('ENOUGH');
    }
    return Text(
      '${time.min != null ? time.min : 0}:${time.sec < 10 ? "0" + time.sec.toString() : time.sec}',
      style: Theme.of(context).textTheme.headline1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      controller: _countdownController,
      widgetBuilder: (_, CurrentRemainingTime time) {
        return CircularPercentIndicator(
          radius: 400,
          lineWidth: 15.0,
          percent: (time != null
                  ? (time.min != null ? time.min * 60 : 0) + (time.sec ?? 0)
                  : 1) /
              _timerLength,
          center: _buildTimerWidget(time),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.purple,
        );
      },
    );
  }
}
