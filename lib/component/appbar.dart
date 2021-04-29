import 'package:flutter/material.dart';
import 'package:mobboards/utilities/utilities.dart';
import 'package:mobboards/views/views.dart';

class AppBarComponent extends StatefulWidget {
  final String title;

  const AppBarComponent(this.title);

  @override
  _AppBarComponentState createState() => _AppBarComponentState();
}

class _AppBarComponentState extends State<AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: [
        IconButton(
            icon: Icon(TextToSpeech.onOff ? Icons.volume_up : Icons.volume_off),
            onPressed: _changeIconVolume)
      ],
      backgroundColor: CustomColors.primaryMobfeel,
    );
  }

  _changeIconVolume() {
    if (TextToSpeech.onOff)
      setState(() {
        TextToSpeech.onOff = false;
      });
    else
      setState(() {
        TextToSpeech.onOff = true;
      });
  }
}
