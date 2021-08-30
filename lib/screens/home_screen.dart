import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standup_timer/bloc/timer_cubit.dart';
import 'package:standup_timer/bloc/timer_state.dart';
import 'package:standup_timer/models/participant.dart';

import '../di_container.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _mapSingleParticipant(Participant participant) {
    return Row(
      children: [
        Checkbox(
            value: participant.isPresent,
            onChanged: (newVal) {
              sl<TimerCubit>()
                  .changeParticipantPresence(participant.id, newVal);
            }),
        Text(
          participant.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  void _showAddDialog(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("New participant"),
          content: TextField(
            controller: textEditingController,
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Add"),
              onPressed: () {
                sl<TimerCubit>().addParticipant(textEditingController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<Widget> _mapParticipantsForDeleteList(List<Participant> participants) {
    return participants
        .map((e) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(e.name),
                IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => sl<TimerCubit>().removeParticipant(e.id)),
              ],
            ))
        .toList();
  }

  void _showRemoveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder(
            bloc: sl<TimerCubit>(),
            builder: (context, state) {
              final _participants = state.participants;
              return AlertDialog(
                title: Text("Remove participant"),
                content: SingleChildScrollView(
                  child: Column(
                    children: _mapParticipantsForDeleteList(_participants),
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      },
    );
  }

  Widget _mapParticipants() {
    return BlocBuilder<TimerCubit, TimerState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: state.participants.map((participant) {
              return _mapSingleParticipant(participant);
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () => _showAddDialog(context),
            child: Text('+',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white)),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
          ElevatedButton(
            onPressed: () => _showRemoveDialog(context),
            child: Icon(Icons.delete),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 400, child: Image.asset("timer_icon.png")),
          SizedBox(
            height: 5,
          ),
          Text(
            "Participants",
            style: Theme.of(context).textTheme.headline4,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 55),
            child: _mapParticipants(),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.purple.shade500,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ))),
                onPressed: () => sl<TimerCubit>().nextParticipant(),
                child: Container(
                  height: 60,
                  width: 230,
                  child: Center(
                    child: Text(
                      "Let's go",
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
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue.shade500,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ))),
                onPressed: () => sl<TimerCubit>().shuffleParticipants(),
                child: Container(
                  height: 60,
                  width: 230,
                  child: Center(
                    child: Text(
                      "Shuffle participants",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Colors.white),
                    ),
                  ),
                )),
          ]),
        ]);
  }
}
