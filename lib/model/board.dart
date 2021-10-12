
import 'package:flutter/cupertino.dart';

class Board {

  final String name;
  final String description;
  final List<Widget> buttons;
  final String createdAt;

  Board({required this.name, required this.description, required this.buttons, required this.createdAt});

  @override
  String toString() {
    return 'Board{name: $name, description: $description, buttons: $buttons, createdAt: $createdAt}';
  }

}