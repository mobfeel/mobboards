import 'package:flutter/material.dart';

import '../../app/app.dart';
import '../custom_colors.dart';
import '../views.dart';

class Volume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CustomColors.primaryMobfeel,
      ),
      home: VolumePage(Constant.APP_NAME),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}
