import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobboards/constant.dart';
import 'package:mobboards/platform/platform.dart';
import 'views/views.dart';

void main() {
  if (Constant.appHomolog)
    return runApp(
      DevicePreview(
        builder: (context) => AndroidApp(),
        enabled: !kReleaseMode,
      ),
    );
  else
    return runApp(AndroidApp());
}