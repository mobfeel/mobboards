import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {

  final String title;
  final String content;

  const MyRichText({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
            children: [
              TextSpan(
                  text: title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
              ),
              TextSpan(
                  text: content , style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, height: 1.4)
              ),
            ]
        )
    );
  }
}
