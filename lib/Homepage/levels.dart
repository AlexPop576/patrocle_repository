import 'package:flutter/material.dart';

import '../Components/level_tile.dart';
import '../Database/country_crud.dart';
import '../Database/country_model.dart';

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  List<CountryModel> countryListDB = [];
  final crud = CountryCrud();
  int color = 0;

  @override
  void initState() {
    super.initState();
    crud.readAll().then((value) {
      setState(() {
        countryListDB = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 24, 31),
      body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: Text("Levels")),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  color = 0;
                  color = (index + 1) % 3;
                  return LevelTile(
                    country: countryListDB[index].name,
                    colorIndex: color,
                  );
                },
                childCount: countryListDB.length,
              ),
            ),
          ]
      ),
    );
  }
}