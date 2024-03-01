import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle/Components/trophy_tile.dart';
import 'package:patrocle/Database/trophy_crud.dart';
import 'package:patrocle/Database/trophy_model.dart';

class Trophies extends StatefulWidget {
  const Trophies({super.key});

  @override
  State<Trophies> createState() => _TrophiesState();
}

class _TrophiesState extends State<Trophies> {
  List<TrophyModel> trophyListDB = [];
  final crud = TrophyCrud();

  @override
  void initState() {
    super.initState();
    crud.readAll().then((value) {
      setState(() {
        trophyListDB = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(children: [
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
                      "Your trophies",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ))
                  ]),
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
                ],
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              int newIndex = index * 2;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TrophyTile(
                      trophy: newIndex < trophyListDB.length
                          ? trophyListDB[newIndex].index
                          : 9),
                  TrophyTile(
                      trophy: newIndex + 1 < trophyListDB.length
                          ? trophyListDB[newIndex + 1].index
                          : 9),
                ],
              );
            }, childCount: 4),
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
        ],
      ),
    );
  }
}
