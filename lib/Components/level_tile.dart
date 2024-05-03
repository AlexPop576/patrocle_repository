import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:patrocle/Quizpage/quizpage.dart';

// ignore: must_be_immutable
class LevelTile extends StatefulWidget {
  LevelTile({
    super.key,
    required this.colorIndex,
    required this.country,
    required this.lessonGeography,
    required this.lessonHistory,
    required this.jsonStringEG,
    required this.jsonStringHG,
    required this.jsonStringEH,
    required this.jsonStringHH,
    required this.EGA1,
    required this.EGA2,
    required this.EGA3,
    required this.EGA4,
    required this.HGA1,
    required this.HGA2,
    required this.HGA3,
    required this.HGA4,
    required this.EHA1,
    required this.EHA2,
    required this.EHA3,
    required this.EHA4,
    required this.HHA1,
    required this.HHA2,
    required this.HHA3,
    required this.HHA4,
    required this.EGA,
    required this.HGA,
    required this.EHA,
    required this.HHA,
    required this.geography_completed,
    required this.history_completed,
  });
  int? colorIndex, geography_completed, history_completed;
  String? country,
      continent,
      lessonGeography,
      lessonHistory,
      jsonStringEG,
      jsonStringHG,
      jsonStringEH,
      jsonStringHH,
      EGA1, EGA2, EGA3, EGA4, HGA1, HGA2, HGA3, HGA4, EHA1, EHA2, EHA3, EHA4, HHA1, HHA2, HHA3, HHA4, EGA, HGA, EHA, HHA;

  @override
  State<LevelTile> createState() =>
      // ignore: no_logic_in_create_state
      _LevelTileState(
          colorIndex: colorIndex,
          country: country,
          lessonGeography: lessonGeography,
          lessonHistory: lessonHistory,
          jsonStringEG: jsonStringEG,
          jsonStringHG: jsonStringHG,
          jsonStringEH: jsonStringEH,
          jsonStringHH: jsonStringHH,
          EGA1: EGA1,
          EGA2: EGA2,
          EGA3: EGA3,
          EGA4: EGA4,
          HGA1: HGA1,
          HGA2: HGA2,
          HGA3: HGA3,
          HGA4: HGA4,
          EHA1: EHA1,
          EHA2: EHA2,
          EHA3: EHA3,
          EHA4: EHA4,
          HHA1: HHA1,
          HHA2: HHA2,
          HHA3: HHA3,
          HHA4: HHA4,
          EGA: EGA,
          HGA: HGA,
          EHA: EHA,
          HHA: HHA,
          geography_completed: geography_completed,
          history_completed: history_completed,
          );
}

class _LevelTileState extends State<LevelTile> {
  _LevelTileState({
    required this.colorIndex,
    required this.country,
    required this.lessonGeography,
    required this.lessonHistory,
    required this.jsonStringEG,
    required this.jsonStringHG,
    required this.jsonStringEH,
    required this.jsonStringHH,
    required this.EGA1,
    required this.EGA2,
    required this.EGA3,
    required this.EGA4,
    required this.HGA1,
    required this.HGA2,
    required this.HGA3,
    required this.HGA4,
    required this.EHA1,
    required this.EHA2,
    required this.EHA3,
    required this.EHA4,
    required this.HHA1,
    required this.HHA2,
    required this.HHA3,
    required this.HHA4,
    required this.EGA,
    required this.HGA,
    required this.EHA,
    required this.HHA,
    required this.geography_completed,
    required this.history_completed,
  });
  int? colorIndex = 1, selectedSubject = 0, geography_completed, history_completed;
  String? country,
      lessonGeography,
      lessonHistory,
      jsonStringEG,
      jsonStringHG,
      jsonStringEH,
      jsonStringHH,
      EGA1, EGA2, EGA3, EGA4, HGA1, HGA2, HGA3, HGA4, EHA1, EHA2, EHA3, EHA4, HHA1, HHA2, HHA3, HHA4, EGA, HGA, EHA, HHA;

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
                              country.toString(),
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
                                    ? geography_completed!=1 ? 'assets/icons/Geography.png' : 'assets/icons/Tick.png'
                                    : geography_completed!=1 ? 'assets/icons/GeographySelected.png' : 'assets/icons/TickOutlined.png'))),
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
                                    ? history_completed!=1 ? 'assets/icons/History.png' : 'assets/icons/Tick.png'
                                    : history_completed!=1 ? 'assets/icons/HistorySelected.png' : 'assets/icons/TickOutlined.png'))),
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
                              lesson: lessonGeography,
                              QE: jsonStringEG,
                              QH: jsonStringHG,
                              QEA1: EGA1,
                              QEA2: EGA2,
                              QEA3: EGA3,
                              QEA4: EGA4,
                              QHA1: HGA1,
                              QHA2: HGA2,
                              QHA3: HGA3,
                              QHA4: HGA4,
                              EA: EGA,
                              HA: HGA,
                            ),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 300),
                          ),
                        ).then((_) => setState(() {selectedSubject = 0;}));
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
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Easy",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
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
                              lesson: lessonGeography,
                              QE: jsonStringEG,
                              QH: jsonStringHG,
                              QEA1: EGA1,
                              QEA2: EGA2,
                              QEA3: EGA3,
                              QEA4: EGA4,
                              QHA1: HGA1,
                              QHA2: HGA2,
                              QHA3: HGA3,
                              QHA4: HGA4,
                              EA: EGA,
                              HA: HGA,
                            ),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 300),
                          ),
                        ).then((_) => setState(() {selectedSubject = 0;}));
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
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Medium",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
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
                              lesson: lessonGeography,
                              QE: jsonStringEG,
                              QH: jsonStringHG,
                              QEA1: EGA1,
                              QEA2: EGA2,
                              QEA3: EGA3,
                              QEA4: EGA4,
                              QHA1: HGA1,
                              QHA2: HGA2,
                              QHA3: HGA3,
                              QHA4: HGA4,
                              EA: EGA,
                              HA: HGA,
                            ),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 300),
                          ),
                        ).then((_) => setState(() {selectedSubject = 0;}));
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
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Hard",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
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
                              lesson: lessonHistory,
                              QE: jsonStringEH,
                              QH: jsonStringHH,
                              QEA1: EHA1,
                              QEA2: EHA2,
                              QEA3: EHA3,
                              QEA4: EHA4,
                              QHA1: HHA1,
                              QHA2: HHA2,
                              QHA3: HHA3,
                              QHA4: HHA4,
                              EA: EHA,
                              HA: HHA,
                            ),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 300),
                          ),
                        ).then((_) => setState(() {selectedSubject = 0;}));
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
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Easy",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
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
                              lesson: lessonHistory,
                              QE: jsonStringEH,
                              QH: jsonStringHH,
                              QEA1: EHA1,
                              QEA2: EHA2,
                              QEA3: EHA3,
                              QEA4: EHA4,
                              QHA1: HHA1,
                              QHA2: HHA2,
                              QHA3: HHA3,
                              QHA4: HHA4,
                              EA: EHA,
                              HA: HHA,
                            ),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 300),
                          ),
                        ).then((_) => setState(() {selectedSubject = 0;}));
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
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Medium",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
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
                              lesson: lessonHistory,
                              QE: jsonStringEH,
                              QH: jsonStringHH,
                              QEA1: EHA1,
                              QEA2: EHA2,
                              QEA3: EHA3,
                              QEA4: EHA4,
                              QHA1: HHA1,
                              QHA2: HHA2,
                              QHA3: HHA3,
                              QHA4: HHA4,
                              EA: EHA,
                              HA: HHA,
                            ),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 300),
                          ),
                        ).then((_) => setState(() {selectedSubject = 0;}));
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
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Hard",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
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
