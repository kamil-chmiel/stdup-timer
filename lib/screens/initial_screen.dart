import 'package:flutter/material.dart';
import 'package:standup_timer/bloc/team_cubit.dart';

import '../di_container.dart';

class IntroScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  IntroScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Enter team identifier:",
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 50),
        SizedBox(
          width: 300,
          child: TextField(
            controller: _textEditingController,
          ),
        ),
        SizedBox(height: 50),
        ElevatedButton(
          child: Text('Go', style: TextStyle(fontSize: 20)),
          onPressed: () =>
              sl<TeamCubit>().setTeamIdentifier(_textEditingController.text),
        ),
      ],
    );
  }
}
