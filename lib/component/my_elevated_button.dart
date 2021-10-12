import 'package:flutter/material.dart';
import 'package:mobboards/app/app.dart';

class MyElevatedButton extends StatelessWidget {

  final String title;
  final GestureTapCallback onPressed;
  final Color? backgroundColor;

  const MyElevatedButton({Key? key, required this.title, required this.onPressed, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        backgroundColor: MaterialStateProperty.all(backgroundColor ?? AppStyle.primaryMobfeel),
        padding: MaterialStateProperty.all(EdgeInsets.only(top: 15, bottom: 15))),
      onPressed: onPressed,
      child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)));
  }
}
