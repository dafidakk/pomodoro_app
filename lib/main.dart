import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro_app/pomodoro_screen.dart';
import 'package:pomodoro_app/timeservice.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight,
  ]).then(
    (value) => runApp(
      ChangeNotifierProvider<TimerService>(
        create: (_) => TimerService(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PomodoroScreen(),
    );
  }
}
