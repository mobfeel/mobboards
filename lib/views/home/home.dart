import 'package:flutter/material.dart';
import 'package:mobboards/translate/translate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        supportedLocales: AppLocalizations.locales,
        localizationsDelegates: AppLocalizations.delegates,
        debugShowCheckedModeBanner: false);
  }
}
