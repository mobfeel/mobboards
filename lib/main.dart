import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'views/views.dart';

void main() {
  Constant.APP_HOMOLOG = false;

  if (Constant.APP_HOMOLOG == true)
    return runApp(
      DevicePreview(
        builder: (context) => Home(),
        enabled: !kReleaseMode,
      ),
    );
  else
    return runApp(Home());
}
