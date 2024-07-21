import 'package:flutter/material.dart';

extension CustomThemeColors on ThemeData {
  Color get correctColor {
    // Example logic for determining the correct color
    if (this.brightness == Brightness.light) {
      return Colors.green; // Light theme color
    } else if (this.brightness == Brightness.dark) {
      return Colors.lightGreen; // Dark theme color
    } else {
      // Default or custom theme color
      return Color.fromARGB(255, 175, 184, 47);
    }
  }

  Color get wrongColor {
    // Example logic for determining the wrong color
    if (this.brightness == Brightness.light) {
      return Colors.red; // Light theme color
    } else if (this.brightness == Brightness.dark) {
      return Colors.redAccent; // Dark theme color
    } else {
      // Default or custom theme color
      return const Color.fromARGB(255, 230, 76, 29);
    }
  }
}

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Color.fromARGB(255, 255, 255, 255),
      primary: Color.fromARGB(255, 206, 206, 206),
      secondary: Color.fromARGB(255, 102, 166, 255),
      tertiary: Color.fromARGB(255, 0, 0, 0),
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Color.fromARGB(255, 23, 24, 31),
      primary: Color.fromARGB(255, 39, 55, 77),
      secondary: Color.fromARGB(255, 102, 102, 255),
      tertiary: Color.fromARGB(255, 255, 255, 255),
    ));

ThemeData DaltonistMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Color.fromARGB(255, 0, 0, 0),
      primary: Color.fromARGB(255, 39, 55, 77),
      secondary: Color.fromARGB(255, 102, 102, 255),
      tertiary: Color.fromARGB(255, 255, 255, 255),
    ));