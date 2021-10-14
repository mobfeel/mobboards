import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobboards/translate/translate.dart';

class AppLocalizations {

  final Locale locale;

  AppLocalizations({required this.locale});

  static List<Locale> locales = [
    Locale('en', 'US'),
    Locale('es', 'ES'),
    Locale('pt', 'PT'),
  ];

  static List<String> supportedLocales = ['en', 'es', 'pt'];

  static List<LocalizationsDelegate> delegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  AppLocalizationsDelegate();

  Map<String, String>? _localizedStrings;

  Future<bool> load() async {
    String jsonString =
    await rootBundle.loadString('i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String? translate(String key) {
    return _localizedStrings![key];
  }
}