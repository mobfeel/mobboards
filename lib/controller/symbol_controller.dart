import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobboards/utilities/utilities.dart';

class SymbolController extends GetxController {

  static SymbolController instance = Get.find();

  var words = [].obs;
  var textController = TextEditingController().obs;
  var textToSpeech = TextToSpeech().obs;
  var columnNumber = 3.obs;
  var textToSpeechOnOff = false.obs;

  @override
  void onInit() {
    textToSpeech.value.stop();
    super.onInit();
  }

  @override
  void dispose() {
    textToSpeech.value.stop();
    super.dispose();
  }

  /// Alter number os columns on the grid
  void alterColumn({required int numberOfColumns}) {
    columnNumber.value = numberOfColumns;
  }

  /// Add a new word in the list
  void newWord({required String word}) {
    words.add(word);
  }

  /// Remove a last word in the list
  void deleteWord() {
    words.remove(words.last);
  }

  /// Show all the words in the list
  String showMessage() {
    String text = '';
    for(String word in words) {
      text += '$word ';
    }
    return text;
  }

  /// show all letter in the list
  String showSpelledMessage() {
    String text = '';
    for(String word in words) {
      text += word;
    }
    return text;
  }

  /// Change sound text to speech to mute or sound
  void changeSound() {
    textToSpeechOnOff.value = !textToSpeechOnOff.value;
  }

  /// reproduce the word clicked
  void speak({required String message}) {
    textToSpeech.value.speechMessage = message;
    textToSpeech.value.speak();
  }

}