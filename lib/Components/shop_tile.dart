import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:patrocle/Database/database_helper.dart';

class ShopTile extends StatefulWidget {
  ShopTile(
      {super.key,
      required this.colorIndex,
      required this.price,
      required this.bought,
      required this.id});
  int? colorIndex = 1, price = 100, bought = 0, id = 1;

  @override
  State<ShopTile> createState() => _ShopTileState(
      colorIndex: colorIndex, price: price, bought: bought, id: id);
}

class _ShopTileState extends State<ShopTile> {
  _ShopTileState(
      {required this.colorIndex,
      required this.price,
      required this.bought,
      required this.id});
  int? colorIndex = 1, price = 100, bought = 0, id = 1, coins = 0;
  final _dbHelper = DatabaseHelper.instance;

  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    _dbHelper.queryProfile().then((results) {
      if (results.isNotEmpty) {
        setState(() {
          coins = results.first['coins'];
        });
      }
    });
  }

  List<Color> color = [
    Colors.blue,
    Colors.red,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 18),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(
          color: color[widget.colorIndex!],
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            Expanded(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Image.asset('assets/icons/face${widget.colorIndex! + 1}.png',
                    height: 175, fit: BoxFit.contain),
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
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: Center(
                                          child: Text(
                                              textAlign: TextAlign.center,
                                              "Are you sure you want to buy?",
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
                                              List<int> faceList = [];
                                              String faces;
                                              await _dbHelper
                                                  .queryFaces()
                                                  .then((results) {
                                                faces = results['faces'];
                                                if (faces != null) {
                                                  faceList = List<int>.from(
                                                      jsonDecode(faces!));
                                                  faceList.add(widget.id!);
                                                  _dbHelper.setFaces(
                                                      jsonEncode(faceList));
                                                }
                                              });
                                              setState(() {
                                                bought = 1;
                                              });
                                            } else {
                                              print("not enough money");
                                            }
                                          }),
                                          child: Text("Buy",
                                              style: const TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ),
                                        TextButton(
                                          onPressed: (() {
                                            Navigator.pop(context);
                                          }),
                                          child: Text("Cancel",
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
                                    child: Text(
                                      "BUY",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        15), // Large enough value
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
                                SizedBox(
                                  width: 3,
                                ),
                                Image.asset(
                                  'assets/icons/coin.png',
                                  height: 35,
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                          ],
                        )
                      : Column(
                          children: [
                            Image.asset('assets/icons/true.png'),
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
    );
  }
}
