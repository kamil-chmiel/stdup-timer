import 'package:flutter/material.dart';
import 'package:standup_timer/models/participant.dart';

class ParticipantContainer extends StatelessWidget {
  final Participant _participant;
  final Function(String) _onChangeCheckbox;
  ParticipantContainer(this._participant, this._onChangeCheckbox);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: _participant.isPresent,
            onChanged: (newVal) {
              print("_onParticipantPresentChanged0");

              _onChangeCheckbox(_participant.id);
            }),
        Text(
          _participant.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
