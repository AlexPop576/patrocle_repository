import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:patrocle/Homepage/levels.dart';
import 'package:patrocle/Homepage/Profile/profile.dart';
import 'package:patrocle/Homepage/museum.dart';
import 'package:patrocle/Homepage/test.dart';
import 'package:patrocle/Homepage/inventory.dart';
import '../Database/database_helper.dart';
import '../Theme/translations.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key, required this.selectedIndex});
  int? selectedIndex = 1;

  @override
  State<Homepage> createState() => _HomepageState(selectedIndex: selectedIndex);
}

class _HomepageState extends State<Homepage> {
  _HomepageState({required this.selectedIndex});
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  int? selectedIndex, language = 2;
  final _dbHelper = DatabaseHelper.instance;

  static const List<Widget> _pages = <Widget>[
    Inventory(),
    Levels(),
    //Test(),
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
      body: Center(
        child: _pages.elementAt(selectedIndex!),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          color: Theme.of(context).colorScheme.tertiary,
          activeColor:const Color.fromARGB(255, 102, 102, 255),
          tabBackgroundColor: Theme.of(context).colorScheme.primary,
          gap: 12,
          haptic: true,
          padding: const EdgeInsets.all(18),
          tabs: [
            GButton(icon: Icons.star, text: "${translation[language]!["Inventory"]}"),
            GButton(icon: Icons.gamepad, text: "${translation[language]!["Levels"]}"),
            //GButton(icon: Icons.map, text: "${translation[language]!["Map"]}",),
            GButton(icon: Icons.person, text: "${translation[language]!["Profile"]}"),
          ],
          selectedIndex: selectedIndex!,
          onTabChange: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}