import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import '../../app/app.dart';
import 'package:mobcards/views/views.dart';
import 'home_page.dart';

///criado a stateless Home para a navegação entre telas
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      title: Constant.appName,
      debugShowCheckedModeBanner: false,
      home: HomePage(Constant.appName),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}
