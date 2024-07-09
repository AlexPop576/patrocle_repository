import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:patrocle/Database/database_helper.dart';
import 'package:patrocle/Quizpage/quizpage.dart';

class DailyQuiz extends StatefulWidget {
  DailyQuiz({super.key, required this.language});
  int? language;
  
  @override
  State<DailyQuiz> createState() => _DailyQuizState(language: language);
}

class _DailyQuizState extends State<DailyQuiz> {
  _DailyQuizState({required this.language});
  int? countryIndex, subjectIndex, len = 0, language = 1;
  final _dbHelper = DatabaseHelper.instance;
  List<String>? countryNames;

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
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Daily challange",
              textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
                      SizedBox(height: 100),
              Text(countryNames![countryIndex!],
              textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
              subjectIndex == 1
                  ? Text("Geography",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))
                  : Text("History",
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
              BackButton()
            ],
          ),
        ),
      ),
    );
  }
}
