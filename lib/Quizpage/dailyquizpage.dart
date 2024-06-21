import 'dart:math';

import 'package:flutter/material.dart';

class DailyQuiz extends StatefulWidget {
  const DailyQuiz({super.key});

  @override
  State<DailyQuiz> createState() => _DailyQuizState();
}

class _DailyQuizState extends State<DailyQuiz> {
  int? countryIndex, subjectIndex;

  @override
  void initState() {
    super.initState();
    selectChallange();
    selectChallange();
    selectChallange();
  }

  void selectChallange() async {
    var random = Random();
    setState(() {
      subjectIndex = random.nextInt(2) + 1;
      countryIndex = random.nextInt(197) + 1;
    });
    await Future.delayed(Duration(milliseconds: 30));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Country $countryIndex"),
          Text(subjectIndex == 1 ? "Geography" : "History"),
          BackButton()
        ],
      ),
    );
  }
}