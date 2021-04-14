import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped, paused, continued }

class TextToSpeech {
  double volume = 0.5;
  double pitch = 1;
  double rate = 0.5;

  FlutterTts flutterTts = FlutterTts();
  String speechMessage;

  Future speak() async {
    await flutterTts.speak('$speechMessage');
  }

  Future stop() async {
    await flutterTts.stop();
  }

  Future paused(String message) async {
    await flutterTts.pause();
  }
}
