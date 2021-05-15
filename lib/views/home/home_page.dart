import 'package:flutter/material.dart';
import 'package:mobboards/app/app_routes.dart';
import 'package:mobboards/component/component.dart';
import 'package:mobboards/translate/translate.dart';
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
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            height: 150,
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

  Widget columnEffectPhrase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Text(
            AppLocalizations.of(context).translate("home_page_description"),
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget buttonRow(context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          FractionallySizedBox(
            widthFactor: 0.25,
            child: MaterialButton(
              minWidth: 200,
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.APP_ROUTE_SYMBOLS);
              },
              child: Text(
                AppLocalizations.of(context).translate('menu_screen_symbols'),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: CustomColors.primaryMobfeel,
            ),
          ),
          SizedBox(height: 24),
          FractionallySizedBox(
            widthFactor: 0.25,
            child: MaterialButton(
              minWidth: 200,
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.APP_ROUTE_SPELL);
              },
              color: CustomColors.primaryMobfeel,
              child: Text(
                AppLocalizations.of(context).translate('menu_screen_spell'),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 24),
          FractionallySizedBox(
            widthFactor: 0.25,
            child: MaterialButton(
              minWidth: 200,
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.APP_ROUTE_PAIN);
              },
              color: CustomColors.primaryMobfeel,
              child: Text(
                AppLocalizations.of(context)
                    .translate('menu_screen_visual_pain_scale'),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarComponent(
          AppLocalizations.of(context).translate('app_title'),
        ),
      ),
      drawer: DrawerComponent(),
      body: ListView(
        children: [
          Column(
            children: [
              columnLogo(),
              SizedBox(
                height: 40,
              ),
              columnEffectPhrase(),
              SizedBox(
                height: 50,
              ),
              buttonRow(context),
            ],
          ),
        ],
      ),
    );
  }
}
