import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle/Components/trophy_tile.dart';

import '../Database/database_helper.dart';
import '../Theme/translations.dart';

class Trophies extends StatefulWidget {
  const Trophies({super.key});

  @override
  State<Trophies> createState() => _TrophiesState();
}

class _TrophiesState extends State<Trophies> {
  final _dbHelper = DatabaseHelper.instance;
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  int? language = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
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
                    Lottie.asset(
                        'assets/patrocle.json',
                        frameRate: FrameRate.max,
                        height: 120),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      "${translation[language]!["Your trophies"]}",
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
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _dbHelper.queryTrophies(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      int newIndex = index * 2 + 1;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TrophyTile(
                              trophy: newIndex <= snapshot.data!.length
                                  ? snapshot.data![newIndex-1]['trophy']
                                  : 9),
                          TrophyTile(
                              trophy: newIndex + 1 <= snapshot.data!.length
                                  ? snapshot.data![newIndex]['trophy']
                                  : 9),
                        ],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
            Padding(
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
          ],
        ),
      ),
    );
  }
}