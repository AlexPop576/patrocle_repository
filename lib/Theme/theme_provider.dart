import 'package:flutter/material.dart';
import 'package:patrocle/Theme/theme.dart';
import '../Database/database_helper.dart';

class ThemeProvider with ChangeNotifier {
  String? mode = 'dark';
  int? modeInt;
  final _dbHelper = DatabaseHelper.instance;

  void getThemeData() async {
    await _dbHelper.queryProfile().then((results) {
      if (results.isNotEmpty) {
        modeInt = results.first['dark_mode'];
        if(modeInt==1){
          mode = 'dark';
        }else{
          mode = 'light';
        }
      }
    });
  }

  ThemeData _themeData = darkMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  Future<void> saveMode(modeInt) async {
    await _dbHelper.updateMode(modeInt!);
  }

  int getTheme() {
    if (_themeData == lightMode) {
      return 0;
    } else {
      return 1;
    }
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
      saveMode(1);
    } else {
      themeData = lightMode;
      saveMode(0);
    }
  }
}
