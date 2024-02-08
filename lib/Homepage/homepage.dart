import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:patrocle/Homepage/levels.dart';
import 'package:patrocle/Homepage/profile.dart';
import 'package:patrocle/Homepage/trophies.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int _selectedIndex = 1;

  static const List<Widget> _pages = <Widget>[
    Trophies(),
    Levels(),
    Profile(),
  ];

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
          activeColor: Colors.white,
          tabBackgroundColor: const Color.fromARGB(40, 158, 158, 158),
          gap: 12,
          haptic: true,
          padding: const EdgeInsets.all(18),
          tabs: const [
            GButton(icon: Icons.home, text: "Trophies",),
            GButton(icon: Icons.home, text: "Levels",),
            GButton(icon: Icons.home, text: "Profile",),
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