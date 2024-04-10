import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle/Database/database_helper.dart';
import '../Components/level_tile.dart';

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  int color = 0;
  final _dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(//physics: const BouncingScrollPhysics(),
            children: [
          Padding(
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
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _dbHelper.queryAllRows(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      color = 0;
                      color = (index + 1) % 3;
                      return LevelTile(colorIndex: color, country: snapshot.data![index]['name']);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
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
        ]),
      ),
    );
  }
}
