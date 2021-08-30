import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/timer_cubit.dart';
import 'bloc/timer_state.dart';
import 'di_container.dart';
import 'screens/home_screen.dart';
import 'screens/timer_screen.dart';

import 'bloc/team_cubit.dart';

void main() {
  setupSl();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Standup Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<TimerCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<TeamCubit>(),
          ),
        ],
        child: MyHomePage(title: 'Standup Timer'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<TimerCubit, TimerState>(
          builder: (context, state) {
            return state is InProgressTimerState ? TimerScreen() : HomeScreen();
          },
        ),
      ),
    );
  }
}
