import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobcards/app/app_routes.dart';

import '../constant.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                scale: 4,
                alignment: Alignment.bottomLeft,
                image: AssetImage(
                  'assets/help.png',
                ),
              ),
            ),
            child: Text(
              Constant.APP_NAME,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('${Constant.HOME}'),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_HOME);
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('${Constant.ILUSTRATIONS}'),
            onTap: () {
              Navigator.popAndPushNamed(
                  context, AppRoutes.APP_ROUTE_ILUSTRATION);
            },
          ),
          ListTile(
            leading: Icon(Icons.sort_by_alpha),
            title: Text('${Constant.SPELL}'),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SPELL);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('${Constant.ABOUT_US}'),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_ABOUT);
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_run),
            title: Text('${Constant.EXIT}'),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
