import 'package:flutter/material.dart';
import 'package:pomodoro_app/timeservice.dart';
import 'package:pomodoro_app/utils.dart';
import 'package:pomodoro_app/widgets/progresswidget.dart';
import 'package:pomodoro_app/widgets/timecontroller.dart';
import 'package:pomodoro_app/widgets/timercard.dart';
import 'package:pomodoro_app/widgets/timeroptions.dart';
import 'package:provider/provider.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      backgroundColor: renderColor(provider.currentState),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text(
          "PomoTimer",
          style: textStyle(25, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                Provider.of<TimerService>(context, listen: false).reset(),
            icon: Icon(
              Icons.refresh,
            ),
            iconSize: 40,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              TimerCard(),
              SizedBox(
                height: 40,
              ),
              TimeOptions(),
              SizedBox(
                height: 40,
              ),
              TimeController(),
              SizedBox(
                height: 60,
              ),
              ProgressWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
