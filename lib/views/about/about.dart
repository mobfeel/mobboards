import 'package:flutter/material.dart';

import '../../component/drawer.dart';

class About extends StatefulWidget {
  final String title;
  About(this.title);

  @override
  _AboutState createState() => _AboutState();
}

_willPop(BuildContext context) {
  Navigator.of(context).pop(true);
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _willPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text('${widget.title}'),
        ),
        /**adicionado o menu drawer na tela SOBRE
         * para melhorar a experiência do user
         * possibilitado uma navegação mais rápida no app */
        drawer: DrawerComponent(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Tela Sobre',
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
