import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobboards/app/app.dart';
import 'package:mobboards/controller/controller.dart';
import 'package:mobboards/controller/initializer_controllers.dart';
import 'package:mobboards/model/model.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/component/component.dart';
import '../../app/app_routes.dart';
import '../views.dart';

class SymbolPage extends GetView<SymbolController> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Pictogram> listPictograms = [];

  onClickSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(AppLocalizations.of(context)!.translate("snackbar_empty_field")!),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _createList(BuildContext context) {
    listPictograms = [
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_pain")!,
        image: Constant.pain,
        backgroundColor: AppStyle.red,
        onTap: () {
          Get.toNamed(AppRoutes.APP_ROUTE_PAIN);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_pain")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_alphabet")!,
        image: Constant.alphabet,
        backgroundColor: AppStyle.amber,
        onTap: () {
          Get.toNamed(AppRoutes.APP_ROUTE_SPELL);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_alphabet")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_delete")!,
        image: Constant.backspace,
        backgroundColor: Colors.white,
        onTap: () { controller.deleteWord(); },
      ),

      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_another_thing")!,
        image: Constant.anotherThing,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_another_thing")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_another_thing")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_i_dont_know")!,
        image: Constant.iDontKnow,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_i_dont_know")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_i_dont_know")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_thank_you")!,
        image: Constant.thankYou,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_thank_you")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_thank_you")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_more")!,
        image: Constant.more,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_more")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_more")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_turn_on_the_light")!,
        image: Constant.turnOnTheLight,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_turn_on_the_light")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_turn_on_the_light")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_turn_on_turn_off")!,
        image: Constant.turnOnTurnOff,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_turn_on_turn_off")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_turn_on_turn_off")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_question_yes_or_no")!,
        image: Constant.questionYesOrNo,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_question_yes_or_no")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_question_yes_or_no")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_silence")!,
        image: Constant.silence,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_silence")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_silence")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_pen_and_paper")!,
        image: Constant.penAndPaper,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_pen_and_paper")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_pen_and_paper")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_glasses")!,
        image: Constant.glasses,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_glasses")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_glasses")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_diaper")!,
        image: Constant.diaper,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_diaper")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_diaper")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_toys")!,
        image: Constant.toys,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_toys")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_toys")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_music")!,
        image: Constant.music,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_music")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_music")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_reading")!,
        image: Constant.reading,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_reading")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_reading")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_tv")!,
        image: Constant.tv,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_tv")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_tv")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_tablet")!,
        image: Constant.tablet,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_tablet")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_tablet")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_cellphone")!,
        image: Constant.cellphone,
        backgroundColor: AppStyle.blue2,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_cellphone")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_cellphone")!);
        },
      ),

      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_drink")!,
        image: Constant.drink,
        backgroundColor: AppStyle.green,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_drink")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_drink")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_eat")!,
        image: Constant.eat,
        backgroundColor: AppStyle.green,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_eat")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_eat")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_moisten_your_month")!,
        image: Constant.moistenYourMonth,
        backgroundColor: AppStyle.green,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_moisten_your_month")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_moisten_your_month")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_pee")!,
        image: Constant.pee,
        backgroundColor: AppStyle.green,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_pee")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_pee")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_poop")!,
        image: Constant.poop,
        backgroundColor: AppStyle.green,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_poop")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_poop")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_walk")!,
        image: Constant.walk,
        backgroundColor: AppStyle.green,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_walk")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_walk")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_wash_the_face")!,
        image: Constant.washTheFace,
        backgroundColor: AppStyle.green,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_wash_the_face")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_wash_the_face")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_oral_hygiene")!,
        image: Constant.oralHygiene,
        backgroundColor: AppStyle.green,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_oral_hygiene")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_oral_hygiene")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_shower")!,
        image: Constant.shower,
        backgroundColor: AppStyle.green,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_shower")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_shower")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_reposition")!,
        image: Constant.reposition,
        backgroundColor: AppStyle.green,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_reposition")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_reposition")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_sleep")!,
        image: Constant.sleep,
        backgroundColor: AppStyle.green,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_sleep")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_sleep")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_wear")!,
        image: Constant.wear,
        backgroundColor: AppStyle.green,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_wear")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_wear")!);
        },
      ),

      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_warm")!,
        image: Constant.warm,
        backgroundColor: AppStyle.blue,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_warm")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_warm")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_cold")!,
        image: Constant.cold,
        backgroundColor: AppStyle.blue,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_cold")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_cold")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_scary")!,
        image: Constant.scary,
        backgroundColor: AppStyle.blue,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_scary")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_scary")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_well")!,
        image: Constant.well,
        backgroundColor: AppStyle.blue,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_well")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_well")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_bad")!,
        image: Constant.bad,
        backgroundColor: AppStyle.blue,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_bad")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_bad")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_wet_clothes")!,
        image: Constant.wetClothes,
        backgroundColor: AppStyle.blue,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_wet_clothes")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_wet_clothes")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_oxygen")!,
        image: Constant.oxygen,
        backgroundColor: AppStyle.blue,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_oxygen")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_oxygen")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_medicine")!,
        image: Constant.medicine,
        backgroundColor: AppStyle.blue,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_medicine")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_medicine")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_aspiration")!,
        image: Constant.aspiration,
        backgroundColor: AppStyle.blue,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_aspiration")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_aspiration")!);
        },
      ),

      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_call_doctor")!,
        image: Constant.callDoctor,
        backgroundColor: AppStyle.amber,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_call_doctor")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_call_doctor")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_call_nurse")!,
        image: Constant.callNurse,
        backgroundColor: AppStyle.amber,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_call_nurse")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_call_nurse")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_call_family")!,
        image: Constant.callFamily,
        backgroundColor: AppStyle.amber,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_call_family")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_call_family")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_help")!,
        image: Constant.help,
        backgroundColor: AppStyle.amber,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_help")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_help")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_hold_my_hand")!,
        image: Constant.holdMyHand,
        backgroundColor: AppStyle.amber,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_hold_my_hand")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_hold_my_hand")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_visit_family")!,
        image: Constant.visitFamily,
        backgroundColor: AppStyle.amber,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_visit_family")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_visit_family")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_how_much_time")!,
        image: Constant.howMuchTime,
        backgroundColor: AppStyle.amber,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_how_much_time")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_how_much_time")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_how_am_i")!,
        image: Constant.howAmI1,
        backgroundColor: AppStyle.amber,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_how_am_i")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_how_am_i")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_and_then")!,
        image: Constant.andThen,
        backgroundColor: AppStyle.amber,
        onTap: () {
          controller.newWord(word: AppLocalizations.of(context)!.translate("button_and_then")!);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_and_then")!);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _createList(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('menu_screen_symbols')!, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Obx(() => IconButton(
                icon: Icon(controller.textToSpeechOnOff.value ? Icons.volume_up : Icons.volume_off),
                onPressed: () {
                  log('${controller.textToSpeechOnOff.value}');
                  controller.changeSound();
                }
            ),
          )
        ],
        backgroundColor: AppStyle.primaryMobfeel,
      ),
      drawer: DrawerComponent(),
      body: Column(
        children: [
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Obx(() => TextFormField(
                controller: controller.textController.value = TextEditingController(text: controller.showMessage()),
                maxLines: null,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: AppLocalizations.of(context)!.translate('hint_symbol_page')
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: GridView.count(
                crossAxisCount: symbolController.columnNumber.value,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(
                  listPictograms.length,
                  (index) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: MyPictogramButton(
                          onTap: listPictograms[index].onTap,
                          title: listPictograms[index].title,
                          image: listPictograms[index].image,
                          size: MediaQuery.of(context).size.width / symbolController.columnNumber.value,
                          backgroundColor: listPictograms[index].backgroundColor
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
