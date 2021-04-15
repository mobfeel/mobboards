import 'package:flutter/material.dart';
import '../../app/app.dart';
import '../custom_colors.dart';
import '../views.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.SCREEN_SETTINGS_TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CustomColors.primaryMobfeel,
      ),
      home: SettingsPage(),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}
