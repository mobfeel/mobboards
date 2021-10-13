import 'package:flutter/material.dart';
import 'package:mobboards/app/app.dart';

class MyPictogramButton extends StatelessWidget {

  final String title;
  final String image;
  final double size;
  final GestureTapCallback onTap;
  final Color? backgroundColor;

  const MyPictogramButton({Key? key, required this.title, required this.image, required this.size, required this.onTap, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(16),
            color: backgroundColor ?? AppStyle.blue
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: size  / 10)),
            Image.asset(image, height: size / 2)
          ],
        ),
      ),
    );
  }
}
