import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobboards/app/app_routes.dart';
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
              // image: DecorationImage(
              //   scale: 1,
              //   alignment: Alignment.bottomLeft,
              //   image: AssetImage(Constant.logoApp),
              // ),
            ),
            child: Padding(
              child: Text(
                Constant.appName,
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
              padding: EdgeInsets.all(45.0),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('${Constant.home}'),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_HOME);
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('${Constant.symbols}'),
            onTap: () {
              Navigator.popAndPushNamed(
                  context, AppRoutes.APP_ROUTE_ILUSTRATION);
            },
          ),
          ListTile(
            leading: Icon(Icons.sort_by_alpha),
            title: Text('${Constant.spell}'),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SPELL);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('${Constant.settings}'),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_VOLUME);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('${Constant.aboutUs}'),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_ABOUT);
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_run),
            title: Text('${Constant.exit}'),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
