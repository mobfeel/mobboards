import 'package:flutter/material.dart';

class Pictogram {

  final String title;
  final String image;
  final GestureTapCallback onTap;
  final Color? backgroundColor;

  Pictogram({required this.title, required this.image, required this.onTap, this.backgroundColor});

  @override
  String toString() {
    return 'Pictogram{title: $title, image: $image, onTap: $onTap, backgroundColor: $backgroundColor}';
  }
}