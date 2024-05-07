import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:patrocle/Homepage/levels.dart';
import 'package:patrocle/Homepage/Profile/profile.dart';
import 'package:patrocle/Homepage/test.dart';
import 'package:patrocle/Homepage/trophies.dart';
import '../Database/database_helper.dart';
import '../Theme/translations.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  int _selectedIndex = 1, language = 2;
  final _dbHelper = DatabaseHelper.instance;

  static const List<Widget> _pages = <Widget>[
    Trophies(),
    Levels(),
    Test(),
    Profile(),
  ];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData(){
    _dbHelper.queryProfile().then((results) {
      if (results.isNotEmpty) {
        setState(() {
          language = results.first['language'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 24, 31),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          color: Colors.white,
          activeColor:const Color.fromARGB(255, 102, 102, 255),
          tabBackgroundColor: const Color.fromARGB(15, 255, 255, 255),
          gap: 12,
          haptic: true,
          padding: const EdgeInsets.all(18),
          tabs: [
            GButton(icon: Icons.star, text: "${translation[language]!["Trophies"]}"),
            GButton(icon: Icons.gamepad, text: "${translation[language]!["Levels"]}"),
            GButton(icon: Icons.map, text: "${translation[language]!["Map"]}",),
            GButton(icon: Icons.person, text: "${translation[language]!["Profile"]}"),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}