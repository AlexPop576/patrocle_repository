import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    Lottie.network(
                        'https://lottie.host/491f2840-4c44-425a-924e-4fbc86237dfc/s8x6EccXsD.json',
                        frameRate: FrameRate.max,
                        height: 120),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      "Levels",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    )),
                  ],
                ),
                const SizedBox(
                    height: 30,
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
              ]),
            ),
          ),
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                  thickness: 3,
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
