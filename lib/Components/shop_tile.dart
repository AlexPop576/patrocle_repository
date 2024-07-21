// Importing necessary Dart and Flutter packages.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:patrocle/Database/database_helper.dart';

// Defining a StatefulWidget, ShopTile, to represent an item in a shop.
class ShopTile extends StatefulWidget {
  // Constructor for ShopTile with required parameters.
  ShopTile({
    super.key,
    required this.colorIndex,
    required this.price,
    required this.bought,
    required this.id,
  });

  // Declaring variables for ShopTile.
  int? colorIndex = 1, price = 100, bought = 0, id = 1;

  // Overriding createState to return an instance of _ShopTileState.
  @override
  State<ShopTile> createState() => _ShopTileState(
      colorIndex: colorIndex, price: price, bought: bought, id: id);
}

// Private State class for ShopTile.
class _ShopTileState extends State<ShopTile> {
  // Constructor for _ShopTileState with required parameters.
  _ShopTileState({
    required this.colorIndex,
    required this.price,
    required this.bought,
    required this.id,
  });

  // Declaring variables for _ShopTileState.
  int? colorIndex = 1, price = 100, bought = 0, id = 1, coins = 0;
  final _dbHelper = DatabaseHelper.instance; // Instance of DatabaseHelper.

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
          coins = results.first['coins']; // Updating coins from database results.
        });
      }
    });
  }

  // List of colors for the shop items.
  List<Color> color = [
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
              child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: ElevatedButton(
                                onPressed: () {
                                  _dbHelper.setBought(widget.id!); 
                                  setState(() {
                                    
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                    child: Text(
                                      "BUY",
                                      style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).colorScheme.secondary,
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
                                  style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold, fontSize: 30),
                                ),
                                SizedBox(width: 3),
                                Image.asset('assets/icons/coin.png', height: 35),
                              ],
                            ),
                            SizedBox(width: 10),
                          ],
                        )
                      : Column(
                          children: [
                            Image.asset('assets/icons/true.png'), // Displaying 'already bought' icon.
                            SizedBox(height: 6),
                            Text(
                              "Already bought",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold, fontSize: 25),
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