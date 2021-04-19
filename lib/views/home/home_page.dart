import 'package:flutter/material.dart';
import 'package:mobboards/component/component.dart';
import 'package:mobboards/translate/translate.dart';
import '../../app/app_routes.dart';
import '../../constant.dart';
import '../views.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget columnLogo() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Constant.logoApp),
              ),
            ),
          ),
        ),
        Text(
          AppLocalizations.of(context).translate("app_title"),
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ],
    );
  }

  Padding columnButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildTextButton(AppLocalizations.of(context).translate("symbols"), 0),
          SizedBox(
            height: 20,
          ),
          buildTextButton(AppLocalizations.of(context).translate("spell"), 1),
        ],
      ),
    );
  }

  Widget columnEffectPhrase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context).translate("home_page_description"),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildTextButton(String buttonName, int cod) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(CustomColors.primaryMobfeel),
          padding:
              MaterialStateProperty.all(EdgeInsets.only(top: 15, bottom: 15))),
      onPressed: () {
        cod == 0
            ? Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SYMBOLS)
            : Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SPELL);
      },
      child: Text(
        buttonName,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${AppLocalizations.of(context).translate('screen_home')}'),
        backgroundColor: CustomColors.primaryMobfeel,
      ),
      drawer: DrawerComponent(),
      body: ListView(
        children: [
          Column(
            children: [
              columnLogo(),
              SizedBox(
                height: 50,
              ),
              columnEffectPhrase(),
              SizedBox(
                height: 50,
              ),
              columnButtons(context),
            ],
          ),
        ],
      ),
    );
  }
}
