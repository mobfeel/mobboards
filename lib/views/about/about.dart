import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:mobboards/app/app.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/views/about/about_page_mobile.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizations.locales,
      localizationsDelegates: AppLocalizations.delegates,
      builder: DevicePreview.appBuilder,
      title: "...",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: App().getAppRoutes().getRoutes,
      home: AboutPageMobilePortrait(),
    );
  }
}