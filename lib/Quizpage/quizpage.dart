import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuizPage extends StatefulWidget {
  QuizPage({super.key, required this.country, required this.difficulty, required this.subject});
  String? country;
  int? difficulty, subject;

  @override
  // ignore: no_logic_in_create_state
  State<QuizPage> createState() => _QuizPageState(
      country: country,
      difficulty: difficulty,
      subject: subject);
}

class _QuizPageState extends State<QuizPage> {
  _QuizPageState(
      {required this.country, required this.difficulty, required this.subject});
  String? country;
  int? difficulty, subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back")),
            Text(
              "Country: $country",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Difficulty: $difficulty",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Subject: $subject",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
