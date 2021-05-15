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
            leading: Icon(Icons.image),
            title: Text(
              AppLocalizations.of(context).translate('menu_screen_symbols'),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRouter.APP_ROUTE_SYMBOLS);
            },
          ),
          ListTile(
            leading: Icon(Icons.sort_by_alpha),
            title: Text(
              AppLocalizations.of(context).translate('menu_screen_spell'),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRouter.APP_ROUTE_SPELL);
            },
          ),
          ListTile(
            leading: Icon(Icons.perm_contact_calendar),
            title: Text(
              AppLocalizations.of(context).translate('menu_screen_pain'),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRouter.APP_ROUTE_PAIN);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              AppLocalizations.of(context)
                  .translate('menu_screen_visual_pain_scale'),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRouter.APP_ROUTE_SETTINGS);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              AppLocalizations.of(context).translate('menu_screen_about'),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRouter.APP_ROUTE_ABOUT);
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_run),
            title: Text(
              AppLocalizations.of(context).translate('menu_exit_app'),
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
