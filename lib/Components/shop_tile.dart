// Importing necessary Dart and Flutter packages.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:patrocle/Database/database_helper.dart';
import 'package:patrocle/Homepage/homepage.dart';
import 'package:patrocle/Theme/translations.dart';

// Defining a StatefulWidget, ShopTile, to represent an item in a shop.
class ShopTile extends StatefulWidget {
  // Constructor for ShopTile with required parameters.
  ShopTile({
    super.key,
    required this.colorIndex,
    required this.price,
    required this.bought,
    required this.id,
    required this.language
  });

  // Declaring variables for ShopTile.
  int? colorIndex = 1, price = 100, bought = 0, id = 1, language = 1;
  
  // Overriding createState to return an instance of _ShopTileState.
  @override
  State<ShopTile> createState() => _ShopTileState(
      colorIndex: colorIndex, price: price, bought: bought, id: id, language: language);
}

// Private State class for ShopTile.
class _ShopTileState extends State<ShopTile> {
  // Constructor for _ShopTileState with required parameters.
  _ShopTileState({
    required this.colorIndex,
    required this.price,
    required this.bought,
    required this.id,
    required this.language
  });

  // Declaring variables for _ShopTileState.
  int? colorIndex = 1, price = 100, bought = 0, id = 1, coins = 0, language = 1;
  final _dbHelper = DatabaseHelper.instance; // Instance of DatabaseHelper.
  Map<int?, Map<String?, String?>> translation = Translations().translation;

  // initState method to perform initial fetch of data.
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // Method to fetch data from the database.
  void fetchData() {
    _dbHelper.queryProfile().then((results) {
      if (results.isNotEmpty) {
        setState(() {
          coins =
              results.first['coins']; // Updating coins from database results.
        });
      }
    });
  }

  // List of colors for the shop items.
  List<Color> color = [
    Colors.grey,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
  ];

  // Building the widget.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 18),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(
          color: color[widget.colorIndex!], // Background color from color list.
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            Expanded(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Image.asset('assets/icons/face${widget.colorIndex! + 1}.png',
                    height: 175, fit: BoxFit.contain), // Displaying face icon.
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
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: widget.bought == 0
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: ElevatedButton(
                                onPressed: () async {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: Center(
                                          child: Text(
                                              textAlign: TextAlign.center,
                                              "${translation[language]!["Are you sure you want to buy?"]}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25))),
                                      content: Container(
                                        child: Column(children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Image.asset(
                                            'assets/icons/face${widget.id!}.png',
                                            height: 200,
                                          )
                                        ]),
                                        height: 210,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: color[widget.colorIndex!],
                                        ),
                                      ),
                                      elevation: 24,
                                      actions: [
                                        TextButton(
                                          onPressed: (() async {
                                            Navigator.pop(context);
                                            if (coins! >= price!) {
                                              Navigator.pop(context);
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return Homepage(
                                                    selectedIndex: 0);
                                              }));
                                              _dbHelper.setBought(widget.id!);
                                              await _dbHelper
                                                  .incrementCoins(-price!);
                                              setState(() {
                                                
                                              });
                                              String? faces;
                                              List<int> facesListInt = [];
                                              await _dbHelper
                                                  .queryFaces()
                                                  .then((results) {
                                                faces = results['faces'];
                                                if (faces != null) {
                                                  facesListInt = List<int>.from(
                                                      jsonDecode(faces!));
                                                  facesListInt.add(widget.id!);
                                                  String faceList =
                                                      jsonEncode(facesListInt);
                                                  _dbHelper
                                                      .setFaceList(faceList);
                                                }
                                              });
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder: (_) => AlertDialog(
                                                  title: Center(
                                                      child: Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          "${translation[language]!["Not enough coins!"]}",
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      25))),
                                                ),
                                              );
                                            }
                                            ;
                                          }),
                                          child: Text("${translation[language]!["Buy"]}",
                                              style: const TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ),
                                        TextButton(
                                          onPressed: (() {
                                            Navigator.pop(context);
                                          }),
                                          child: Text("${translation[language]!["Cancel"]}",
                                              style: const TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 5),
                                    child: Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 40,)
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${widget.price}",
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
                              "${translation[language]!["Already bought"]}",
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
    );
  }
}
