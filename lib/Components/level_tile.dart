import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:patrocle/Quizpage/quizpage.dart';

import '../Theme/translations.dart';

// ignore: must_be_immutable
class LevelTile extends StatefulWidget {
  LevelTile(
      {super.key,
      required this.colorIndex,
      required this.country,
      required this.geography_completed,
      required this.history_completed,
      required this.language,
      required this.refreshAppbar,
      required this.refreshLevels});
  int? colorIndex, geography_completed, history_completed, language;
  String? country, continent;
  final Function refreshAppbar, refreshLevels;

  @override
  State<LevelTile> createState() =>
      // ignore: no_logic_in_create_state
      _LevelTileState(
          colorIndex: colorIndex,
          country: country,
          geography_completed: geography_completed,
          history_completed: history_completed,
          language: language,
          refreshAppbar: refreshAppbar,
          refreshLevels: refreshLevels);
}

class _LevelTileState extends State<LevelTile> {
  _LevelTileState(
      {required this.colorIndex,
      required this.country,
      required this.geography_completed,
      required this.history_completed,
      required this.language,
      required this.refreshAppbar,
      required this.refreshLevels});
  int? colorIndex = 1,
      selectedSubject = 0,
      geography_completed,
      history_completed,
      language = 2;
  String? country;
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  final Function refreshAppbar, refreshLevels;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 18),
        child: Column(children: [
          SizedBox(
            height: 190,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: selectedSubject == 0
                      ? const BorderRadius.all(Radius.circular(15))
                      : const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                  gradient: colorIndex == 0
                      ? const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 253, 60, 60),
                            Color.fromARGB(255, 253, 40, 40),
                          ],
                        )
                      : colorIndex == 1
                          ? const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 80, 126, 253),
                                Color.fromARGB(255, 40, 86, 253),
                              ],
                            )
                          : const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 253, 201, 80),
                                Color.fromARGB(255, 253, 161, 40),
                              ],
                            )),
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
                                'assets/flags/$country.png',
                                height: 100,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Text(
                              "${translation[language]![country.toString()]}",
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
                      children: [
                        const SizedBox(height: 15),
                        SizedBox(
                            height: 78,
                            width: 78,
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (selectedSubject != 1) {
                                      selectedSubject = 1;
                                    } else {
                                      selectedSubject = 0;
                                    }
                                  });
                                },
                                child: Image.asset(selectedSubject != 1
                                    ? geography_completed != 1
                                        ? 'assets/icons/Geography.png'
                                        : 'assets/icons/Tick.png'
                                    : geography_completed != 1
                                        ? 'assets/icons/GeographySelected.png'
                                        : 'assets/icons/TickOutlined.png'))),
                        const SizedBox(height: 5),
                        SizedBox(
                            height: 78,
                            width: 78,
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (selectedSubject != 2) {
                                      selectedSubject = 2;
                                    } else {
                                      selectedSubject = 0;
                                    }
                                  });
                                },
                                child: Image.asset(selectedSubject != 2
                                    ? history_completed != 1
                                        ? 'assets/icons/History.png'
                                        : 'assets/icons/Tick.png'
                                    : history_completed != 1
                                        ? 'assets/icons/HistorySelected.png'
                                        : 'assets/icons/TickOutlined.png'))),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
          Visibility(
            visible: selectedSubject == 1,
            child: SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: QuizPage(
                                country: country,
                                difficulty: 1,
                                subject: 1,
                                mode: 1,
                                language: language),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 300),
                          ),
                        ).then((_) async {
                          setState(() {
                            selectedSubject = 0;
                          });
                          await Future.delayed(Duration(milliseconds: 30));
                          refreshAppbar();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 63, 255, 38),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(0),
                            bottomLeft: Radius.circular(15),
                          ), // Set the radius to 0 for a square shape
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${translation[language]!["Easy"]}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: QuizPage(
                                country: country,
                                difficulty: 2,
                                subject: 1,
                                mode: 1,
                                language: language),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 300),
                          ),
                        ).then((_) async {
                          setState(() {
                            selectedSubject = 0;
                          });
                          await Future.delayed(Duration(milliseconds: 30));
                          refreshAppbar();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 194, 38),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                          ), // Set the radius to 0 for a square shape
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${translation[language]!["Medium"]}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: QuizPage(
                                country: country,
                                difficulty: 3,
                                subject: 1,
                                mode: 1,
                                language: language),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 300),
                          ),
                        ).then((_) async {
                          setState(() {
                            selectedSubject = 0;
                          });
                          await Future.delayed(Duration(milliseconds: 30));
                          refreshAppbar();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 55, 55),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(0),
                          ), // Set the radius to 0 for a square shape
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${translation[language]!["Hard"]}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: selectedSubject == 2,
            child: SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: QuizPage(
                                country: country,
                                difficulty: 1,
                                subject: 2,
                                mode: 1,
                                language: language),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 300),
                          ),
                        ).then((_) async {
                          setState(() {
                            selectedSubject = 0;
                          });
                          await Future.delayed(Duration(milliseconds: 30));
                          refreshAppbar();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 63, 255, 38),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(0),
                            bottomLeft: Radius.circular(15),
                          ), // Set the radius to 0 for a square shape
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${translation[language]!["Easy"]}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: QuizPage(
                                country: country,
                                difficulty: 2,
                                subject: 2,
                                mode: 1,
                                language: language),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 300),
                          ),
                        ).then((_) async {
                          setState(() {
                            selectedSubject = 0;
                          });
                          await Future.delayed(Duration(milliseconds: 30));
                          refreshAppbar();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 194, 38),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                          ), // Set the radius to 0 for a square shape
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${translation[language]!["Medium"]}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: QuizPage(
                                country: country,
                                difficulty: 3,
                                subject: 2,
                                mode: 1,
                                language: language),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 300),
                          ),
                        ).then((_) async {
                          setState(() {
                            selectedSubject = 0;
                          });
                          await Future.delayed(Duration(milliseconds: 30));
                          refreshAppbar();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 55, 55),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(0),
                          ), // Set the radius to 0 for a square shape
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${translation[language]!["Hard"]}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
