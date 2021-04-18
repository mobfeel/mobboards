import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobboards/constant.dart';
import 'views/views.dart';

void main() {
  Constant.appHomolog = false;

  if (Constant.appHomolog == true)
    return runApp(
      DevicePreview(
        builder: (context) => Home(),
        enabled: !kReleaseMode,
      ),
    );
  else
    return runApp(Home());
}
