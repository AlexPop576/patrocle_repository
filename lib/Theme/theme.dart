import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Color.fromARGB(255, 224, 224, 224),
      primary: Color.fromARGB(255, 14, 28, 50),
      secondary: Color.fromARGB(255, 102, 102, 255),
      tertiary: Color.fromARGB(255, 33, 33, 33),
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Color.fromARGB(255, 23, 24, 31),
      primary: Color.fromARGB(255, 39, 55, 77),
      secondary: Color.fromARGB(255, 102, 102, 255),
      tertiary: Color.fromARGB(255, 255, 255, 255),
    ));