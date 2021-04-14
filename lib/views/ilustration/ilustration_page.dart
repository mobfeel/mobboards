import 'package:flutter/material.dart';
import 'package:mobcards/utils/text_to_speech.dart';
import 'package:mobcards/component/drawer.dart';
import 'package:mobcards/views/custom_colors.dart';
import '../../app/app_routes.dart';
import '../views.dart';

class IlustrationPage extends StatefulWidget {
  final String title;
  IlustrationPage(this.title);

  @override
  _IlustrationPageState createState() => _IlustrationPageState();
}

class _IlustrationPageState extends State<IlustrationPage> {
  List<Widget> _buttons;
  List<String> _words = [];
  TextEditingController _text;
  TextToSpeech textToSpeech = TextToSpeech();

  Widget _button(Color color, String message, {String image}) {
    return AspectRatio(
      aspectRatio: 1,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: CustomColors.primaryMobfeel,
          shadowColor: Colors.grey,
          padding: EdgeInsets.all(0),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
          ),
        ),
        child: Card(
          color: color,
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 3.5,
                  child: Container(
                    child: Text(
                      message,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                AspectRatio(
                  aspectRatio: 1.4,
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onPressed: () {
          switch (message) {

            /// teste para navegar para a tela sobre
            case 'Soletrar':
              {
                Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SPELL);
                break;
              }

            case 'Dor':
              {
                Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_PAIN);
                break;
              }

            /// teste para apagar o que já foi escrito
            case 'Apagar':
              {
                setState(
                  () {
                    _words.removeAt(_words.length - 1);
                    _text = TextEditingController(text: _showWords());
                  },
                );
                break;
              }

            /// inserindo a nova palavra na tela
            default:
              setState(
                () {
                  _words.add('$message,');
                  textToSpeech.speechMessage = message;
                  textToSpeech.speak();

                  _text = TextEditingController(text: _showWords());
                },
              );
          }
        },
        onLongPress: () {
          switch (message) {

            /// teste para apagar o que já foi escrito
            case 'Apagar':
              {
                setState(() => _words.clear());
                _text = TextEditingController(text: _showWords());
                break;
              }
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    textToSpeech.stop();
    _buttons = [
      //blue
      _button(CustomColors.blue, 'Dor', image: Constant.PAIN),
      _button(CustomColors.blue, 'Falta de ar',
          image: Constant.SHORTNESS_OF_BREATHE),
      _button(CustomColors.blue, 'Náusea', image: Constant.NAUSEA),

      //amber
      _button(CustomColors.amber, 'Fralda', image: Constant.DIAPER),
      _button(CustomColors.amber, 'Ligar luz',
          image: Constant.TURN_ON_THE_LIGHT),
      _button(CustomColors.amber, 'Apagar luz',
          image: Constant.TURN_OFF_THE_LIGHT),

      //blue
      _button(CustomColors.blue, 'Calor', image: Constant.WARM),
      _button(CustomColors.blue, 'Frio', image: Constant.COLD),
      _button(CustomColors.blue, 'Medo', image: Constant.SCARY),

      //amber
      _button(CustomColors.amber, 'Oxigênio', image: Constant.OXYGEN),
      _button(CustomColors.amber, 'Urinol', image: Constant.URINAL),
      _button(CustomColors.amber, 'Remédio', image: Constant.MEDICINE),

      //blue
      _button(CustomColors.blue, 'Bem', image: Constant.WELL),
      _button(CustomColors.blue, 'Cansado', image: Constant.TIRED),
      _button(CustomColors.blue, 'Coceira', image: Constant.SCRATH),

      //amber
      _button(CustomColors.amber, 'Água', image: Constant.WATER),
      _button(CustomColors.amber, 'Óculos', image: Constant.GLASSES),
      _button(CustomColors.amber, 'Cobertor', image: Constant.BLANKET),

      //green
      _button(CustomColors.green, 'Reposicionar', image: Constant.REPOSITION),
      _button(CustomColors.green, 'Aspiração', image: Constant.ASPIRATION),
      _button(CustomColors.green, 'Confortável', image: Constant.CONFORTABLE),

      //yellow
      _button(CustomColors.yellow, 'Ajuda', image: Constant.HELP),
      _button(CustomColors.yellow, 'Chamar família',
          image: Constant.CALL_FAMILY),
      _button(CustomColors.yellow, 'Chamar médico',
          image: Constant.CALL_DOCTOR),

      //green
      _button(CustomColors.green, 'Usar Banheiro',
          image: Constant.USE_BATHROOM),
      _button(CustomColors.green, 'Dormir', image: Constant.SLEEP),
      _button(CustomColors.green, 'Vestir', image: Constant.DRESS),

      //yellow
      _button(CustomColors.yellow, 'Pergunta', image: Constant.QUESTION),
      _button(CustomColors.yellow, 'Visita família',
          image: Constant.VISIT_FAMILY),
      _button(CustomColors.yellow, 'Obrigado', image: Constant.THANK_YOU),

      //green
      _button(CustomColors.green, 'Lavar Rosto', image: Constant.WASH_THE_FACE),
      _button(CustomColors.green, 'Roupa Molhada', image: Constant.WET_CLOTHES),
      _button(CustomColors.green, 'Higiene oral', image: Constant.ORAL_HYGIENE),

      _button(CustomColors.yellow, 'Quanto tempo?',
          image: Constant.HOW_MUCH_TIME),
      _button(CustomColors.yellow, 'Como estou?', image: Constant.HOW_AM_I),
      _button(CustomColors.yellow, 'E depois?', image: Constant.AND_THEN),
      _button(CustomColors.green, 'Sim', image: Constant.YES),
      _button(CustomColors.red, 'Não', image: Constant.NO),
      _button(CustomColors.yellow, 'Não sei', image: Constant.I_DONT_KNOW),
      _button(CustomColors.purple, 'Sim ou Não', image: Constant.YES_OR_NO),
      _button(CustomColors.blue2, 'Soletrar', image: Constant.ALPHABET),
      _button(
        Colors.white,
        'Apagar',
        image: Constant.BACKSPACE,
      ),
    ];
  }

  void dispose() {
    super.dispose();
    textToSpeech.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
      ),
      drawer: DrawerComponent(),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),

          ///inseridos um TextField para pegar os valores dos cards
          ///e proporcionar mais uma maneira de alterar os valores digitados
          ///através do teclado do TextFields
          TextField(
            controller: _text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 5,
          ),

          ///alterada a maneira que passamos os valores dos cards(Linha 182)
          // Expanded(
          //     flex: 1,
          //     child: Center(
          //       child: Text(_showWords()),
          //     )),
          Expanded(
            flex: 9,
            child: GridView.count(
              crossAxisCount: 6,
              children: List.generate(
                _buttons.length,
                (index) {
                  return Align(
                    alignment: Alignment.topCenter,
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

  _showWords() {
    String _text = "";
    for (String word in _words) {
      _text += "$word";
    }
    return _text;
  }
}
