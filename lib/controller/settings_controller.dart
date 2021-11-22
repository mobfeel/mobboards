import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/utilities/utilities.dart';

class SettingsController extends GetxController {

  static SettingsController instance = Get.find();

  var textToSpeech = TextToSpeech().obs;
  var columnRowNumberController = TextEditingController().obs;
  var volume = 0.5.obs;
  var pitch = 1.0.obs;
  var rate = 0.8.obs;

  setNewVolume({required double newVolume}) {
    volume.value = newVolume;
    TextToSpeech.volume = newVolume;
    update();
  }

  setNewPitch({required double newPitch}) {
    pitch.value = newPitch;
    TextToSpeech.pitch = newPitch;
    update();
  }

  setNewRate({required double newRate}) {
    rate.value = newRate;
    TextToSpeech.rate = newRate;
    update();
  }

  testConfiguration({required BuildContext context}) {
    textToSpeech.value.speechMessage = AppLocalizations.of(context)!.translate('settings_page_test_sound_message');
    textToSpeech.value.speak();
  }

}