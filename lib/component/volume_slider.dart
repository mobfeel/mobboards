// import 'package:flutter/material.dart';
// import 'package:mobcards/utils/utils.dart';

// class VolumeSliderComponent extends StatefulWidget {
//   @override
//   _VolumeSliderComponentState createState() => _VolumeSliderComponentState();
// }

// class _VolumeSliderComponentState extends State<VolumeSliderComponent> {
//   @override
//   Widget build(BuildContext context) {
//     var textToSpeech = TextToSpeech();
//     return Slider(
//       onChanged: (newVolume) {
//         setState(
//           () {
//             newVolume = textToSpeech.volume;
//           },
//         );
//       },
//       value: textToSpeech.volume,
//       min: 0.0,
//       max: 1.0,
//       divisions: 10,
//       activeColor: Colors.green,
//     );
//   }
// }
