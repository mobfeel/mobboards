import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:mobboards/translate/translate.dart';
import '../../app/app.dart';
import 'package:mobboards/views/views.dart';
import 'home_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizations.locales,
      localizationsDelegates: AppLocalizations.delegates,
      builder: DevicePreview.appBuilder,
      title: "...",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: App().getAppRoutes().getRoutes,
      home: HomePage(),
    );
  }
}
