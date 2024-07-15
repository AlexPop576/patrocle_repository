import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:patrocle/Database/database_helper.dart';
import 'package:patrocle/Quizpage/quizpage.dart';
import 'package:patrocle/Theme/translations.dart';

class SpecialChallenge extends StatefulWidget {
  SpecialChallenge({super.key, required this.language});
  int? language;

  @override
  State<SpecialChallenge> createState() => _SpecialChallengeState(language: language);
}

class _SpecialChallengeState extends State<SpecialChallenge> {
  _SpecialChallengeState({required this.language});
  int? countryIndex, subjectIndex, len = 0, language;
  final _dbHelper = DatabaseHelper.instance;
  List<String>? countryNames;
  Map<int?, Map<String?, String?>> translation = Translations().translation;

  @override
  void initState() {
    super.initState();
    selectChallange();
  }

  void selectChallange() async {
    var random = Random();
    {
      countryNames = await _dbHelper.queryExistingCountries();
      len = countryNames!.length;
      setState(() {
        subjectIndex = random.nextInt(2) + 1;
        countryIndex = random.nextInt(len!);
      });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
              leading: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 29,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 17),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Lottie.asset('assets/patrocle.json',
                                      frameRate: FrameRate.max, height: 100),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: Text(
                                      "${translation[language]!["QP_QMSG"]}",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                    height: 58,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 102, 102, 255),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                          child: Text(
                                              "${translation[language]!["Continue"]}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30))),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    height: 58,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 219, 64, 64),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                          child: Text(
                                              "${translation[language]!["Quit"]}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30))),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ]),
                              ),
                            ),
                          );
                        });
                  }),
        title: Text("${translation[language]!["Special challenge"]}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(  "${translation[language]![countryNames![countryIndex!]]}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              subjectIndex == 1
                  ? Text("${translation[language]!["Geography"]}",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))
                  : Text("${translation[language]!["History"]}",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
              SizedBox(height: 100),
              SizedBox(
                height: 58,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            child: QuizPage(
                                country: countryNames![countryIndex!],
                                difficulty: 3,
                                subject: subjectIndex,
                                mode: 2,
                                language: language),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 300),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    child: Text(
                        overflow: TextOverflow.ellipsis,
                        "Play",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
