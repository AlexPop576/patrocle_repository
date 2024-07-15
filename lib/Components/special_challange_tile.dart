import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:patrocle/Database/database_helper.dart';
import 'package:patrocle/Quizpage/special_challenge.dart';

class SpecialChallengeTile extends StatefulWidget {
  SpecialChallengeTile({super.key});
 

  @override
  State<SpecialChallengeTile> createState() =>
      _SpecialChallengeTileState();
}

class _SpecialChallengeTileState extends State<SpecialChallengeTile> {
  
  int? language;
  final _dbHelper = DatabaseHelper.instance;
  @override void initState()
  {super.initState();
    fetchData();
  }
  void fetchData() async {
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
    return SizedBox(
      height: 190,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: AnimateGradient(
          primaryBegin: Alignment.topLeft,
          primaryEnd: Alignment.bottomLeft,
          secondaryBegin: Alignment.topRight,
          secondaryEnd: Alignment.bottomRight,
          primaryColors: const [
            Color.fromARGB(200, 255, 198, 255),
            Color.fromARGB(200, 189, 178, 255),
            Color.fromARGB(200, 160, 196, 255),
            Color.fromARGB(200, 155, 246, 255),
          ],
          secondaryColors: const [
            Color.fromARGB(200, 255, 173, 173),
            Color.fromARGB(200, 255, 214, 165),
            Color.fromARGB(200, 253, 255, 191),
            Color.fromARGB(200, 202, 255, 191),
          ],
          duration: Duration(seconds: 5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: Image.asset(
                            'assets/flags/addFlag.png',
                            height: 100,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Random",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              shadows: <Shadow>[
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
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: VerticalDivider(thickness: 3, color: Colors.white),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 78,
                        width: 78,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: SpecialChallenge(language: language),
                                  type: PageTransitionType.bottomToTop,
                                  duration: const Duration(milliseconds: 300),
                                ),
                              );
                            },
                            child:
                                Image.asset('assets/icons/randomButton.png'))),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
