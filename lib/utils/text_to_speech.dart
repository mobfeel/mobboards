import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped, paused, continued }

class TextToSpeech {

  static double volume = 0.5;
  static double pitch = 1;
  static double rate = 0.5;
  static bool onOff = false;

  FlutterTts flutterTts = FlutterTts();
  String speechMessage;

  Future speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    await flutterTts.speak('$speechMessage');
  }

  Future stop() async {
    await flutterTts.stop();
  }

  Future paused(String message) async {
    await flutterTts.pause();
  }
}
