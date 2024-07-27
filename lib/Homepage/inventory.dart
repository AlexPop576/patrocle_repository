import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle/Components/shop_tile.dart';
import 'package:patrocle/Components/trophy_tile.dart';

import '../Database/database_helper.dart';
import '../Theme/translations.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  final _dbHelper = DatabaseHelper.instance;
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  int? language = 2;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                      Lottie.asset('assets/patrocle.json',
                          frameRate: FrameRate.max, height: 120),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Text(
                        "${translation[language]!["Inventory"]}",
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
                      height: 10,
                    ),
                    Text(
                      "${translation[language]!["Trophies"]}",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
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
                                    ? snapshot.data![newIndex - 1]['trophy']
                                    : 9,
                                language: language),
                            TrophyTile(
                                trophy: newIndex + 1 <= snapshot.data!.length
                                    ? snapshot.data![newIndex]['trophy']
                                    : 9,
                                language: language),
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
                  Text(
                    "${translation[language]!["Shop"]}",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
              ),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: _dbHelper.queryAllFaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ShopTile(
                            colorIndex: snapshot.data![index]['color'],
                            price: snapshot.data![index]['price'],
                            bought: snapshot.data![index]['bought'],
                            id: snapshot.data![index]['face']);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 9, horizontal: 18),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    color: Colors.purple, // Background color from color list.
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                    'assets/icons/spell.png',
                                    height: 175,
                                    fit: BoxFit.contain),
                              ), // Displaying face icon.
                            ]),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 185,
                            width: MediaQuery.of(context).size.width / 3 + 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: 0 == 0
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            //_dbHelper.setBought(widget.id!);
                                            setState(() {});
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 5),
                                              child: Text(
                                                "BUY",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "100",
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                          ),
                                          SizedBox(width: 3),
                                          Image.asset('assets/icons/coin.png',
                                              height: 35),
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Image.asset(
                                          'assets/icons/true.png'), // Displaying 'already bought' icon.
                                      SizedBox(height: 6),
                                      Text(
                                        "Already bought",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
