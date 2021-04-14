import 'package:flutter/material.dart';

class PitchSliderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _pitch;
    return Slider(
      value: _pitch,
      min: 0,
      max: 1.0,
      divisions: 10,
      label: 'Pitch: $_pitch',
      onChanged: (newPitch) {
        _pitch = newPitch;
      },
      activeColor: Colors.red,
    );
  }
}
