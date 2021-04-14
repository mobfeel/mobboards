import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobcards/constant.dart';
import '../../component/drawer.dart';
import '../../constant.dart';
import '../custom_colors.dart';

class PainPage extends StatefulWidget {
  final String title;

  PainPage(this.title);

  @override
  _PainPageState createState() => _PainPageState();
}

class _PainPageState extends State<PainPage> {
  String _text = "";
  String _where = "Frente";
  Color _color = Colors.white;

  double _width = 50.0;
  double _height = 50.0;

  @override
  void initState() {
    super.initState();
  }

  /// lista de niveis de dor com icones
  buildContainerInformation(
      BuildContext context, String message, Color color, String image) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              message,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 50,
              height: 50,
              child: Image.asset(
                image,
                color: color,
              ),
            ),
          ),
          SizedBox(
            width: 1,
          )
        ],
      ),
    );
  }

  /// tabela de niveis de cores de 0 a 10
  buildContainerLevelPain(Color color, int level) {
    return Container(
      color: color,
      width: _width,
      height: _height,
      child: TextButton(
        onPressed: () {
          print('clicou');
          setState(() {
            _text = "$level";
            _color = color;
          });
        },
        child: Text(
          '$level',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  /// botões para informar onde a dor se encontra
  buildButtonFrontBack(String wherePain, String image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: AssetImage(image),
            alignment: Alignment.bottomCenter,
            scale: 10 / 2.4),
      ),
      width: MediaQuery.of(context).size.width / 2.2,
      height: 150,
      child: TextButton(
        onPressed: () {
          print('clicou');
          setState(
            () {
              _where = wherePain;
            },
          );
        },
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(wherePain,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              )),
        ),
      ),
    );
  }

  testWherePain() {
    if (_where == 'Frente') {
      return Constant.front;
    } else {
      return Constant.back;
    }
  }

  void _alertBody(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Onde dói?'),
          content: SingleChildScrollView(
            child: Image.asset(testWherePain()),
          ),
        );
      },
    );
  }

  Widget _containerRow(String icon) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            print('clicou');
            _alertBody(context);
          },
        );
      },
      child: Container(
        color: _color,
        width: 100,
        height: MediaQuery.of(context).size.height / 1.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Clique para mostrar onde está a dor',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 1,
              ),
            ),
            Expanded(child: Image.asset(icon)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: CustomColors.primaryMobfeel,
      ),
      drawer: DrawerComponent(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ///Text dor e nota
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Local da Dor: $_where",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Nota: $_text",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              buildContainerInformation(
                                  context,
                                  'Pior Dor Possível',
                                  Colors.red[900],
                                  Constant.PAIN_FOUR),
                              Column(
                                children: [
                                  Container(
                                    child: buildContainerLevelPain(
                                        Colors.red[900], 10),
                                  ),
                                  buildContainerLevelPain(Colors.red[700], 9),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              buildContainerInformation(
                                  context,
                                  'Dor Muito Severa',
                                  Colors.deepOrange,
                                  Constant.PAIN_FOUR),
                              Column(
                                children: [
                                  buildContainerLevelPain(Colors.red, 8),
                                  buildContainerLevelPain(Colors.red[300], 7),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              buildContainerInformation(context, 'Dor Severa',
                                  Colors.red[100], Constant.PAIN_THREE),
                              Column(
                                children: [
                                  buildContainerLevelPain(Colors.red[100], 6),
                                  buildContainerLevelPain(
                                      Colors.yellow[200], 5),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              buildContainerInformation(context, 'Dor Moderada',
                                  Colors.yellow, Constant.PAIN_TWO),
                              Column(
                                children: [
                                  buildContainerLevelPain(
                                      Colors.yellow[300], 4),
                                  buildContainerLevelPain(Colors.green[200], 3),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              buildContainerInformation(context, 'Dor Leve',
                                  Colors.green[200], Constant.PAIN_TWO),
                              Column(
                                children: [
                                  buildContainerLevelPain(Colors.green[400], 2),
                                  buildContainerLevelPain(Colors.green[600], 1),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              buildContainerInformation(context, 'Sem Dor',
                                  Colors.green[900], Constant.PAIN_ONE),
                              Column(
                                children: [
                                  buildContainerLevelPain(Colors.green[900], 0),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    //Imagem do corpo humano na lateral
                    _containerRow('${Constant.front}'),
                  ],
                ),

                //Botões Frente e costas.....
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildButtonFrontBack('Frente', Constant.front),
                    buildButtonFrontBack('Costas', Constant.back),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
