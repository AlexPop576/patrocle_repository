import 'package:flutter/material.dart';

class TrophyTile extends StatelessWidget {
  TrophyTile({super.key, required this.trophy});
  int? trophy;

  Map<int, String> name = {
    1: "Geographer",
    2: "Historian",
    3: "Curious",
    4: "Knowledgeable",
    5: "Expert",
    6: "Champion",
    7: "Untouchable",
    8: "Legend",
    9: "Locked",
  };
  Map<int, Map<int, Color>> color = {
    1: {
      1: const Color.fromARGB(255, 0, 255, 132),
      2: const Color.fromARGB(120, 0, 255, 132),
    },
    2: {
      1: const Color.fromARGB(255, 0, 238, 255),
      2: const Color.fromARGB(120, 0, 238, 255),
    },
    3: {
      1: const Color.fromARGB(255, 255, 0, 0),
      2: const Color.fromARGB(120, 255, 0, 0),
    },
    4: {
      1: const Color.fromARGB(255, 255, 200, 0),
      2: const Color.fromARGB(120, 255, 200, 0),
    },
    5: {
      1: const Color.fromARGB(255, 157, 0, 255),
      2: const Color.fromARGB(120, 157, 0, 255),
    },
    6: {
      1: const Color.fromARGB(255, 0, 55, 255),
      2: const Color.fromARGB(120, 0, 55, 255),
    },
    7: {
      1: const Color.fromARGB(255, 255, 132, 0),
      2: const Color.fromARGB(120, 255, 132, 0),
    },
    8: {
      1: const Color.fromARGB(255, 255, 0, 234),
      2: const Color.fromARGB(120, 255, 0, 234),
    },
    9: {
      1: const Color.fromARGB(255, 129, 129, 129),
      2: const Color.fromARGB(120, 129, 129, 129),
    },
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.5),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color[trophy]![1] ?? Colors.white,
              color[trophy]![2] ?? Colors.black,
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(children: [
            SizedBox(
                height: 125,
                child: Image.asset(
                  "assets/trophies/${name[trophy]}.png",
                )),
            const SizedBox(height: 18),
            Text("${name[trophy]}" ?? "Trophy",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.054 < 25
                      ? MediaQuery.of(context).size.width * 0.054
                      : 25,
                  fontWeight: FontWeight.w500,
                  shadows: const <Shadow>[
                    Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(125, 0, 0, 0),
                    ),
                    Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(0, 0, 0, 255),
                    ),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
