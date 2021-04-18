
import 'package:flutter/cupertino.dart';

class Board {

  String name;
  String description;
  List<Widget> buttons;
  String createdAt;

  Board(this.name, this.description, this.buttons, this.createdAt);

  @override
  String toString() {
    return 'Board{name: $name, description: $description, buttons: $buttons, createdAt: $createdAt}';
  }

}