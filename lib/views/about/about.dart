import 'package:flutter/material.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/views/about/about_page_mobile.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizations.locales,
      localizationsDelegates: AppLocalizations.delegates,
      debugShowCheckedModeBanner: false,
      home: AboutPageMobilePortrait(),
    );
  }
}
