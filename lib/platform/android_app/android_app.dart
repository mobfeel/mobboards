import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobboards/app/app.dart';
import 'package:mobboards/app/app_routes.dart';
import 'package:mobboards/controller/controller.dart';
import 'package:mobboards/translate/translate.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SymbolController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.APP_ROUTE_HOME,
      supportedLocales: AppLocalizations.locales,
      localizationsDelegates: AppLocalizations.delegates,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: AppStyle.primary,
        primaryColor: AppStyle.primaryMobfeel,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(headline1: TextStyle(color: Colors.white))
      ),
    );
  }
}
