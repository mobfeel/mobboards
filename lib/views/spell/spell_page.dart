import 'package:flutter/material.dart';
import '../../app/app_routes.dart';
import '../../component/drawer.dart';
import '../custom_colors.dart';
import '../views.dart';

class SpellPage extends StatefulWidget {
  final String title;

  SpellPage(this.title);

  @override
  _SpellPageState createState() => _SpellPageState();
}

class _SpellPageState extends State<SpellPage> {
  List<Widget> _buttons;
  List<String> _words = [];
  TextEditingController _textSpell;

  Widget _button(String message) {
    return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
          primary: CustomColors.primaryMobfeel,
          shadowColor: Colors.grey,
          elevation: 3,
        ),
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        onPressed: () {
          setState(() {
            _words.add('$message');
            _textSpell = TextEditingController(text: _showWords());
          });
        },
    );
  }

  Widget _buttonAux(String message, {Color color, String image}) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: CustomColors.primaryMobfeel,
        shadowColor: Colors.blueAccent,
        padding: EdgeInsets.all(0),
        elevation: 3,
      ),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: color == null ? Colors.white : color,
              image: DecorationImage(image: AssetImage(image))),
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  message,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        switch (message) {

        /// teste para navegar para a tela sobre
          case 'Ilustracao':
            {
              Navigator.popAndPushNamed(
                  context, AppRoutes.APP_ROUTE_ILUSTRATION);
              break;
            }

          /// introduzido a navegação paga a tela de dor
          case 'Dor':
            {
              Navigator.popAndPushNamed(
                  context, AppRoutes.APP_ROUTE_PAIN);
              break;
            }

        /// teste para apagar o que já foi escrito
          case 'Apagar':
            {
              setState(() {
                _words.removeAt(_words.length - 1);
                _textSpell = TextEditingController(text: _showWords());
              });
              break;
            }

          case 'Espaço':
            {
              _words.add(' ');
              _textSpell = TextEditingController(text: _showWords());
              break;
            }

        /// inserindo a nova palavra na tela
          default:
            setState(() {
              _words.add('$message');
              _textSpell = TextEditingController(text: _showWords());
            });
        }
      },
      onLongPress: () {
        switch (message) {
          case 'Apagar':
            {
              setState(() {
                _words.clear();
                _textSpell = TextEditingController(text: _showWords());
              });
              break;
            }
        }
      },);
  }

  _showWords() {
    String _text="";
    for(String word in _words) {
      _text += "$word";
    }
    return _text;
  }

  @override
  void initState() {
    super.initState();
    _buttons = [
      _button('A'),
      _button('B'),
      _button('C'),
      _button('D'),
      _button('E'),
      _button('F'),
      _button('G'),
      _button('H'),
      _button('I'),
      _button('J'),
      _button('K'),
      _button('L'),
      _button('M'),
      _button('N'),
      _button('O'),
      _button('P'),
      _button('Q'),
      _button('R'),
      _button('S'),
      _button('T'),
      _button('U'),
      _button('V'),
      _button('W'),
      _button('X'),
      _button('Y'),
      _button('Z'),
      _button('1'),
      _button('2'),
      _button('3'),
      _button('4'),
      _button('5'),
      _button('6'),
      _button('7'),
      _button('8'),
      _button('9'),
      _button('0'),
      _buttonAux('Dor', image: Constant.pain, color: Colors.redAccent),
      _buttonAux('Sim', image: Constant.yes),
      _buttonAux('Não', image: Constant.no),
      _buttonAux('Ilustracao', image: Constant.cards),
      _buttonAux('Espaço', image: Constant.space),
      _buttonAux('Apagar', image: Constant.backspace),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: CustomColors.primaryMobfeel,
      ),
      drawer: DrawerComponent(),
      body: Column(
        children: [
          SizedBox(height: 5,),
          ///inseridos um TextField para pegar os valores dos cards
          ///e proporcionar mais uma maneira de alterar os valores digitados
          ///através do teclado do TextFields
          TextField(
            controller: _textSpell,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 5,),
          Expanded(
            flex: 9,
            child: GridView.count(
              crossAxisCount: 6,
              children: List.generate(
                _buttons.length,
                (index) {
                  return Center(
                    child: _buttons[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
