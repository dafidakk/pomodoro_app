import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  late Timer timer;
  double currentDuration = 10;
  double selectedTime = 10;
  bool timerPlaying = false;
  String currentState = "FOCUS";
  int rounds = 0;
  int goal = 0;
  int number = 0;
  Color colonColor = Colors.black;
  bool soundOn = true;

  AudioPlayer audioPlayer = AudioPlayer();

  // playSound(String soundPath) async {
  //   if (soundOn) {
  //     await audioPlayer.play(AssetSource(soundPath));
  //   }
  // }

  void start() {
    timerPlaying = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentDuration == 0) {
        handleNextRound();
      } else {
        currentDuration--;
        changeColor();
        number++;
        // playSound("344.mp3");
        if (soundOn) {
          audioPlayer.play(AssetSource("344.mp3"));
        } else if (!soundOn) {
          audioPlayer.stop();
        }
        notifyListeners();
      }
    });
  }

  void changeColor() {
    if (number % 2 != 0) {
      colonColor = Colors.white;
    } else if (number % 2 == 0) {
      colonColor = Colors.grey;
    }
  }

  void reset() {
    timer.cancel();
    currentState = "FOCUS";
    currentDuration = selectedTime = 10;
    rounds = goal = 0;
    timerPlaying = false;
    notifyListeners();
  }

  void pause() {
    timer.cancel();
    timerPlaying = false;
    audioPlayer.pause();
    notifyListeners();
  }

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }

  void handleNextRound() {
    if (currentState == "FOCUS" && rounds != 3) {
      if (soundOn) {
          audioPlayer.play(AssetSource("bell-counter-a.wav"));
        } else if (!soundOn) {
          audioPlayer.stop();
        }
      
      currentState = "BREAK";
      currentDuration = 10;
      selectedTime = 10;
      rounds++;
      goal++;
    } else if (currentState == "BREAK") {
      currentState = "FOCUS";
      currentDuration = 10;
      selectedTime = 10;
    } else if (currentState == "FOCUS" && rounds == 3) {
      if (soundOn) {
          audioPlayer.play(AssetSource("bell-counter-a.wav"));
        } else if (!soundOn) {
          audioPlayer.stop();
        }
      currentState = "LONGBREAK";
      currentDuration = 10;
      selectedTime = 10;
      rounds++;
      goal++;
    } else if (currentState == "LONGBREAK") {
      currentState = "FOCUS";
      currentDuration = 10;
      selectedTime = 10;
      rounds = 0;
    }
    notifyListeners();
  }
}
