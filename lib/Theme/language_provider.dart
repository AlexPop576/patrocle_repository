
import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  int _language = 1;

  int get language => _language;

  void changeLanguage(int newLanguage) {
    _language = newLanguage;
    notifyListeners();
  }
}