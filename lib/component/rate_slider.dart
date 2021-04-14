import 'package:flutter/material.dart';

class RateSliderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _rate;
    return Slider(
      value: _rate,
      onChanged: (newRate) {
        _rate = newRate;
      },
      min: 0.0,
      max: 1.0,
      divisions: 10,
      label: "Rate: $_rate",
      activeColor: Colors.green,
    );
  }
}
