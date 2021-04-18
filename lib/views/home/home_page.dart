import 'package:flutter/material.dart';
import 'package:mobboards/component/component.dart';
import '../../app/app_routes.dart';
import '../../constant.dart';
import '../views.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage(this.title);

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
          Constant.appName,
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ],
    );
  }

  Padding columnButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildTextButton(Constant.symbols, 0),
          SizedBox(
            height: 20,
          ),
          buildTextButton(Constant.spell, 1),
        ],
      ),
    );
  }

  Widget columnEffectPhrase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(Constant.description,
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
        print('Navigation');
        if (cod == 0) {
          Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_ILUSTRATION);
        } else {
          Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SPELL);
        }
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
        title: Text(Constant.appName),
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
              columnButtons(),
            ],
          ),
        ],
      ),
    );
  }
}
