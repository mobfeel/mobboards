import 'package:flutter/material.dart';
import 'package:mobboards/component/component.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/utilities/utilities.dart';
import '../../app/app_routes.dart';
import '../views.dart';

class SpellPage extends StatefulWidget {
  @override
  _SpellPageState createState() => _SpellPageState();
}

class _SpellPageState extends State<SpellPage> {
  List<Widget> _buttons;
  List<String> _words = [];
  TextEditingController _textSpell;
  TextToSpeech textToSpeech = TextToSpeech();

  Widget _button(String message, {Color color}) {
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
            color: color == null ? Colors.white : color,
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
          decoration: image != null
              ? BoxDecoration(
                  color: color == null ? Colors.white : color,
                  image: DecorationImage(image: AssetImage(image)))
              : BoxDecoration(
                  color: color == null ? Colors.white : color,
                ),
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
          case 'Symbols':
            Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SYMBOLS);
            break;
          case 'Pain':
            Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_PAIN);
            break;
          case 'Delete':
            setState(() {
              _words.removeAt(_words.length - 1);
              _textSpell = TextEditingController(text: _showWords());
            });
            break;
          case 'Backspace':
            _words.add(' ');
            _textSpell = TextEditingController(text: _showWords());
            break;
          default:
            setState(() {
              _words.add('$message');
              _textSpell = TextEditingController(text: _showWords());
            });
        }
      },
      onLongPress: () {
        switch (message) {
          case 'Delete':
            setState(() {
              _words.clear();
              _textSpell = TextEditingController(text: _showWords());
            });
            break;
        }
      },
    );
  }

  _showWords() {
    String _text = "";
    for (String word in _words) {
      _text += "$word";
    }
    return _text;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _buttons = [
      _buttonAux(AppLocalizations.of(context).translate("button_pain"),
          image: Constant.pain, color: Colors.redAccent),
      _buttonAux(AppLocalizations.of(context).translate("button_yes"),
          image: Constant.yes),
      _buttonAux(AppLocalizations.of(context).translate("button_no"),
          image: Constant.no),
      _buttonAux(AppLocalizations.of(context).translate("button_symbols"),
          image: Constant.cards),
      _buttonAux(AppLocalizations.of(context).translate("button_backspace"),
          image: Constant.space),
      _buttonAux(AppLocalizations.of(context).translate("button_delete"),
          image: Constant.backspace),
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
      _button('1', color: Colors.yellow),
      _button('2', color: Colors.yellow),
      _button('3', color: Colors.yellow),
      _button('4', color: Colors.yellow),
      _button('5', color: Colors.yellow),
      _button('6', color: Colors.yellow),
      _button('7', color: Colors.yellow),
      _button('8', color: Colors.yellow),
      _button('9', color: Colors.yellow),
      _button('0', color: Colors.yellow),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('screen_spell'),
        ),
        backgroundColor: CustomColors.primaryMobfeel,
      ),
      drawer: DrawerComponent(),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: _textSpell,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  textToSpeech.speechMessage = _showWords();
                  textToSpeech.speak();
                },
              ),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 5,
          ),
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
