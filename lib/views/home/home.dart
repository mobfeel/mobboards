import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import '../../app/app.dart';
import '../../constant.dart';
import '../custom_colors.dart';
import 'home_page.dart';

///criado a stateless Home para a navegação entre telas
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      title: Constant.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CustomColors.primaryMobfeel,
      ),
      home: HomePage(Constant.APP_NAME),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}
