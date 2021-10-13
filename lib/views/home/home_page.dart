import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobboards/app/app.dart';
import 'package:mobboards/component/my_elevated_button.dart';
import 'package:mobboards/constant.dart';
import 'package:mobboards/translate/translate.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.appName, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30.0),
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Constant.logoApp),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          Text(AppLocalizations.of(context)!.translate("app_title")!, style: TextStyle(fontSize: 32)),
          const SizedBox(height: 50.0),
          Text(AppLocalizations.of(context)!.translate("home_page_description")!, textAlign: TextAlign.justify, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 50.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyElevatedButton(title: AppLocalizations.of(context)!.translate("symbols")!, icon: Icons.image_sharp, onPressed: () { Get.toNamed(AppRoutes.APP_ROUTE_SYMBOLS); }),
                SizedBox(height: 20),
                MyElevatedButton(title: AppLocalizations.of(context)!.translate("spell")!, icon: Icons.sort_by_alpha, onPressed: () { Get.toNamed(AppRoutes.APP_ROUTE_SPELL); }),
                SizedBox(height: 20),
                MyElevatedButton(title: AppLocalizations.of(context)!.translate("menu_screen_about")!, icon: Icons.info, onPressed: () { Get.toNamed(AppRoutes.APP_ROUTE_ABOUT); }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

