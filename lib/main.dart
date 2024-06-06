import 'package:flutter/material.dart'; // Import the material package for UI components
import 'package:flutter/foundation.dart'
    show kIsWeb; // Import kIsWeb to check if the app is running on the web
import 'package:provider/provider.dart'; // Import the provider package for state management
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // Import sqflite_common_ffi for SQLite support on desktop
import 'dart:io'; // Import dart:io to check the platform
import 'Homepage/homepage.dart'; // Import your app's homepage
import 'Theme/theme_provider.dart'; // Import your custom ThemeProvider

void main() async {
  // Ensure Flutter initialization is complete
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize sqflite for desktop platforms (MacOS, Windows, Linux)
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    sqfliteFfiInit(); // Initialize sqflite ffi
    databaseFactory = databaseFactoryFfi; // Set the database factory
  }

  // Initialize the theme provider and load the theme
  ThemeProvider themeProvider = ThemeProvider();
  await themeProvider.loadTheme(); // Wait for the theme to be loaded

  runApp(
    // Run the app with MultiProvider for state management
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(), // Provider for the theme
      child: MyApp(), // Set MyApp as the root widget
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current theme from the ThemeProvider
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: Homepage(selectedIndex: 1), // Set Homepage as the initial widget
      theme: themeProvider.themeData, // Apply the current theme
    );
  }
}
