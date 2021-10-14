import 'package:flutter/material.dart';
import 'package:mobboards/utilities/sizing_information.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInformation sizingInformation) builder;
  const BaseWidget({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizingInformation = SizingInformation();
    return builder(context, sizingInformation);
  }
}
