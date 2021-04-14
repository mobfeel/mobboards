import 'package:flutter/material.dart';
import 'package:mobcards/bloc/text_to_speech.dart';

import '../../component/drawer.dart';

class VolumePage extends StatefulWidget {
  final String title;
  VolumePage(this.title);
  @override
  _VolumePageState createState() => _VolumePageState();
}

class _VolumePageState extends State<VolumePage> {
  TextToSpeech textToSpeech = new TextToSpeech();

  _volumeSlider() {
    return Slider(
      value: textToSpeech.volume,
      min: 0.0,
      max: 1.0,
      divisions: 10,
      label: 'Volume: ${textToSpeech.volume}',
      onChanged: (newVolume) {
        setState(() => textToSpeech.volume = newVolume);
      },
    );
  }

  _pitchSlider() {
    return Slider(
      value: textToSpeech.pitch,
      min: 0.5,
      max: 2.0,
      divisions: 15,
      label: 'Pitch: ${textToSpeech.pitch}',
      onChanged: (newPitch) {
        setState(() => textToSpeech.pitch = newPitch);
      },
      activeColor: Colors.red,
    );
  }

  _rateSlider() {
    return Slider(
        value: textToSpeech.rate,
        min: 0.0,
        max: 1.0,
        divisions: 10,
        label: 'Velocidade: ${textToSpeech.rate}',
        onChanged: (newRate) {
          setState(() => textToSpeech.rate = newRate);
        },
        activeColor: Colors.green);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _volumeSlider(),
            _pitchSlider(),
            _rateSlider(),
          ],
        ),
      ),
    );
  }
}
