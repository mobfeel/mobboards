import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobboards/app/app.dart';
import 'package:mobboards/controller/initializer_controllers.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/component/component.dart';
import 'package:mobboards/utilities/utilities.dart';

class SettingsPage extends StatelessWidget {

  // TextToSpeech textToSpeech = new TextToSpeech();
  // TextEditingController columnRowNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double dividerSize = 6.0;

    _volumeSliderRow() {
      return Obx(() => Slider(
          onChanged: (newVolume) {
            settingsController.setNewVolume(newVolume: newVolume);
          },
          label: 'Volume: ${TextToSpeech.volume}',
          value: settingsController.volume.value,
          min: 0.0,
          max: 1.0,
          divisions: 10,
          activeColor: TextToSpeech.volume >= 0 && TextToSpeech.volume < 0.4
              ? Colors.yellow
              : TextToSpeech.volume >= 0.4 && TextToSpeech.volume < 0.8
              ? Colors.green
              : Colors.red,
        ),
      );
    }

    _pitchSliderRow() {
      return Obx(() => Slider(
          value: settingsController.pitch.value,
          min: 0,
          max: 1.0,
          divisions: 10,
          label: 'Pitch: ${TextToSpeech.pitch}',
          onChanged: (newPitch) {
            settingsController.setNewPitch(newPitch: newPitch);
          },
          activeColor: TextToSpeech.pitch < 0.8 ? Colors.red : Colors.green,
        ),
      );
    }

    _rateSliderRow() {
      return Obx(() => Slider(
          value: settingsController.rate.value,
          onChanged: (newRate) {
            settingsController.setNewRate(newRate: newRate);
          },
          min: 0.0,
          max: 1.0,
          divisions: 10,
          label: "Rate: ${TextToSpeech.rate}",
          activeColor: TextToSpeech.rate >= 0 && TextToSpeech.rate < 0.3
              ? Colors.red
              : TextToSpeech.rate > 0.3 && TextToSpeech.rate < 0.7
              ? Colors.green
              : Colors.yellow,
        ),
      );
    }

    _testConfigRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.speaker, color: Colors.black54),
              SizedBox(width: 5.0),
              Text(AppLocalizations.of(context)!.translate('settings_page_test_sound')!)
            ],
          ),
          FloatingActionButton(
              child: Icon(Icons.speaker, color: Colors.white),
              backgroundColor: AppStyle.primaryMobfeel,
              onPressed: () {
                settingsController.testConfiguration(context: context);
              })
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('menu_screen_settings')!, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: DrawerComponent(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.volume_down_rounded, color: Colors.black54),
                    SizedBox(width: 5.0),
                    Text(AppLocalizations.of(context)!.translate("settings_page_volume")!, style: TextStyle(fontWeight: FontWeight.w600)),
                    Expanded(child: _volumeSliderRow())
                  ],
                ),
                SizedBox(height: 5.0),
                Divider(color: Colors.black54, height: dividerSize),
                SizedBox(height: 5.0),
                Row(
                  children: [
                    Icon(Icons.surround_sound_rounded, color: Colors.black54),
                    SizedBox(width: 5.0),
                    Text(AppLocalizations.of(context)!.translate("settings_page_pitch")!, style: TextStyle(fontWeight: FontWeight.w600)),
                    Expanded(child: _pitchSliderRow())
                  ],
                ),
                SizedBox(height: 5.0),
                Divider(color: Colors.black54, height: dividerSize),
                SizedBox(height: 5.0),
                Row(
                  children: [
                    Icon(Icons.speed_rounded, color: Colors.black54),
                    SizedBox(width: 5.0),
                    Text(AppLocalizations.of(context)!.translate("settings_page_rate")!, style: TextStyle(fontWeight: FontWeight.w600)),
                    Expanded(child: _rateSliderRow())
                  ],
                ),
                SizedBox(height: 5.0),
                Divider(color: Colors.black54, height: dividerSize),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 10,
                        child: Container(
                          child: Row(
                            children: [
                              Icon(Icons.grid_on_rounded,
                                  color: Colors.black54),
                              SizedBox(width: 5.0),
                              Text(AppLocalizations.of(context)!.translate('settings_page_change_button')!, style: TextStyle(fontWeight: FontWeight.w600))
                            ],
                          ),
                        )),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: symbolController.textController.value = TextEditingController(text: '${symbolController.columnNumber.value}'),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(border: InputBorder.none),
                          onChanged: (newValue) {
                            symbolController.alterColumn(numberOfColumns: int.tryParse(newValue)!);
                          },
                        ),
                      )
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Divider(color: Colors.black54, height: dividerSize),
                SizedBox(height: 5.0),
                _testConfigRow()
              ],
            ),
            Positioned(
                left: 10.0,
                right: 10.0,
                bottom: 20.0,
                child: Row(
                  children: [
                    Expanded(
                        child: MyElevatedButton(
                      title: AppLocalizations.of(context)!.translate('settings_button_save')!,
                      icon: Icons.save_rounded,
                      onPressed: () {
                        Get.back();
                      },
                      backgroundColor: AppStyle.primaryMobfeel,
                    )),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
