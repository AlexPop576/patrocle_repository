import 'package:flutter/material.dart';
import 'package:patrocle/Theme/theme.dart';
import '../Database/database_helper.dart';

// ThemeProvider class to manage theme settings
class ThemeProvider with ChangeNotifier {
  // Initial theme mode set to 'dark'
  String? mode = 'dark';
  int? modeInt;
  final _dbHelper = DatabaseHelper.instance;
  // Function to get theme data from the database
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
  // Setter for theme data with notification to listeners
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
  // Function to save the theme mode to the database
  Future<void> saveMode(modeInt) async {
    await _dbHelper.updateMode(modeInt!);
  }
  // Function to get the current theme mode as an integer
  int getTheme() {
    if (_themeData == lightMode) {
      return 0;
    } else {
      return 1;
    }
  }
  // Function to load the theme from the database
  Future<void> loadTheme() async {
  await _dbHelper.queryProfile().then((results) {
    if (results.isNotEmpty) {
      modeInt = results.first['dark_mode'];
    }
  });

  // Check if modeInt is null before using it
  if (modeInt != null) {
    int themeMode = modeInt!; // Default to light mode
    if (themeMode == 0) {
      themeData = lightMode;
    } else {
      themeData = darkMode;
    }
  } else {
    // Handle the case where modeInt is null
    themeData = lightMode;
  }

  notifyListeners();
}
  // Function to toggle between light and dark themes
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
