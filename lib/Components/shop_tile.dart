import 'package:flutter/material.dart';

class ShopTile extends StatelessWidget {
  ShopTile({super.key, required this.colorIndex});
  int? colorIndex = 1, price = 100;
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
          color: color[colorIndex!],
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Image.asset('assets/icons/face${colorIndex! + 1}.png',
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
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
                                      'assets/icons/face${colorIndex! + 1}.png',
                                      height: 200,
                                    )
                                  ]),
                                  height: 210,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: color[colorIndex!],
                                  ),
                                ),
                                elevation: 24,
                                actions: [
                              TextButton(
                                onPressed: (() {
                                  Navigator.pop(context);
                                }),
                                child: Text("Buy",
                                    style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20)),
                              ),
                              TextButton(
                                onPressed: (() {
                                  Navigator.pop(context);
                                }),
                                child: Text("Cancel",
                                    style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20)),
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
                      Text(
                        "$price\$",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      SizedBox(width: 10),
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
