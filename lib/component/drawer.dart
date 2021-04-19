import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobboards/app/app_routes.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/views/views.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: CustomColors.primaryMobfeel,
            ),
            child: Padding(
              child: Text(
                AppLocalizations.of(context).translate("app_title"),
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
              padding: EdgeInsets.all(45.0),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              AppLocalizations.of(context).translate('screen_home'),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_HOME);
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text(
              AppLocalizations.of(context).translate('screen_symbols'),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SYMBOLS);
            },
          ),
          ListTile(
            leading: Icon(Icons.sort_by_alpha),
            title: Text(
              AppLocalizations.of(context).translate('screen_spell'),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SPELL);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              AppLocalizations.of(context).translate('screen_settings'),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SETTINGS);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              AppLocalizations.of(context).translate('screen_about'),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_ABOUT);
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_run),
            title: Text(
              AppLocalizations.of(context).translate('exit'),
            ),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
