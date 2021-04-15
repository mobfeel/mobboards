import 'package:flutter/material.dart';
import 'package:mobcards/utils/text_to_speech.dart';
import 'package:mobcards/component/component.dart';
import 'package:mobcards/views/views.dart';

class SettingsPage extends StatefulWidget {

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  TextToSpeech textToSpeech = new TextToSpeech();

  _volumeSliderRow() {
    return Slider(
      onChanged: (newVolume) {
        setState(
              () {
            TextToSpeech.volume = newVolume;
          },
        );
      },
      value: TextToSpeech.volume,
      min: 0.0,
      max: 1.0,
      divisions: 10,
      activeColor: Colors.green,
    );
  }

  _pitchSliderRow() {
    return Slider(
      value: TextToSpeech.pitch,
      min: 0,
      max: 1.0,
      divisions: 10,
      label: 'Pitch: ${TextToSpeech.pitch}',
      onChanged: (newPitch) {
        setState(() {
          TextToSpeech.pitch = newPitch;
        });
      },
      activeColor: Colors.red,
    );
  }

  _rateSliderRow() {
    return Slider(
      value: TextToSpeech.rate,
      onChanged: (newRate) {
        setState(() {
          TextToSpeech.rate = newRate;
        });
      },
      min: 0.0,
      max: 1.0,
      divisions: 10,
      label: "Rate: ${TextToSpeech.rate}",
      activeColor: Colors.blue,
    );
  }

  _testConfigRow() {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      ),
      child: Text('Clique aqui para testar o som'),
      onPressed: () {
        setState(
              () {
            textToSpeech.speechMessage = 'Olá, esse é um teste de volume e velocidade.';
            textToSpeech.speak();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.SCREEN_SETTINGS_TITLE),
      ),
      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Text('Volume'),
              _volumeSliderRow(),
              Text('Tom'),
              _pitchSliderRow(),
              Text('Velocidade'),
              _rateSliderRow(),

              _testConfigRow()
            ],
          ),
        ),
      ),
    );
  }
}
