import 'package:flutter/material.dart';

class ShopTile extends StatelessWidget {
  ShopTile({super.key, required this.colorIndex});
  int? colorIndex = 1;
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
      )
    );
  }
}