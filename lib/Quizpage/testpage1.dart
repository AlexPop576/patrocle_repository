import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class TestPage1 extends StatefulWidget {
  final Function getAnswerFunction;
  int? selected = 0, givenAnswer;
  String? questionText, answersJSON, correct_answer;
  TestPage1(
      {super.key,
      required this.getAnswerFunction,
      this.selected,
      required this.questionText,
      required this.answersJSON,
      required this.correct_answer,
      this.givenAnswer});

  @override
  // ignore: no_logic_in_create_state
  State<TestPage1> createState() => _TestPage1State(
      getAnswerFunction: getAnswerFunction,
      selected: selected,
      questionText: questionText,
      answersJSON: answersJSON,
      correct_answer: correct_answer,
      givenAnswer: givenAnswer);
}

class _TestPage1State extends State<TestPage1> {
  int? questionAnswer = 1, selected, givenAnswer, correct_anwerINT;
  String? questionText, answersJSON, correct_answer;
  List<String> answers = ["","","","",""];
  final Function getAnswerFunction;

  _TestPage1State(
      {required this.getAnswerFunction,
      this.selected,
      required this.questionText,
      required this.answersJSON,
      required this.correct_answer,
      this.givenAnswer});

  @override
  void initState()
  {
    super.initState();
    if (answersJSON != null) {
      answers = List<String>.from(jsonDecode(answersJSON!));
    }
    correct_anwerINT = int.parse(correct_answer.toString());
    print("Decoded answers: $answers");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: InteractiveViewer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const SizedBox(width: 12),
                      Lottie.asset(
                          'assets/patrocle.json',
                          frameRate: FrameRate.max,
                          height: 100),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Patrocle:",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontWeight: FontWeight.bold,
                              fontSize: 45),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Divider(
                      color: Theme.of(context).colorScheme.primary,
                      thickness: 3),
                  const SizedBox(height: 12),
                  Text(
                    questionText.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 27),
                  ),
                      const SizedBox(height: 40),
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15)),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            getAnswerFunction(1);
                            selected = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          side: selected == 1
                              ? const BorderSide(
                                  color: Color.fromARGB(255, 102, 102, 255),
                                  width: 3)
                              : BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary,
                                  width: 3),
                        ),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(answers[0].toString(),
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.tertiary, 
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15)),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            getAnswerFunction(2);
                            selected = 2;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          side: selected == 2
                              ? const BorderSide(
                                  color: Color.fromARGB(255, 102, 102, 255),
                                  width: 3)
                              : BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary,
                                  width: 3),
                        ),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(answers[1].toString(),
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.tertiary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15)),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            getAnswerFunction(3);
                            selected = 3;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          side: selected == 3
                              ? const BorderSide(
                                  color: Color.fromARGB(255, 102, 102, 255),
                                  width: 3)
                              : BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary,
                                  width: 3),
                        ),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(answers[2].toString(),
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.tertiary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15)),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            getAnswerFunction(4);
                            selected = 4;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          side: selected == 4
                              ? const BorderSide(
                                  color: Color.fromARGB(255, 102, 102, 255),
                                  width: 3)
                              : BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary,
                                  width: 3),
                        ),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(answers[3].toString(),
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.tertiary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// class _Test1State extends State<Test1> {
//   List<Widget> sections = [
//     createSection(Colors.green),
//     createSection(Colors.red),
//     // Add more sections here
//   ];

//   @override
//   Widget build(BuildContext context) {
//     int remainingSpace = 10 - sections.length;

//     return Scaffold(
//       body: Column(
//         children: [
//           // Your other widgets here
//           Row(
//             children: [
//               ...sections,
//               Expanded(
//                 flex: remainingSpace, // Remaining space of the bar
//                 child: Container(
//                   height: 20, // Altura de la barra
//                   color: Colors.transparent, // Transparent color
//                 ),
//               ),
//             ],
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (remainingSpace > 0) {
//                 setState(() {
//                   sections.add(createSection(Colors.blue)); // Add a new section
//                 });
//               }
//             },
//             child: Text('Add Section'),
//           ),
//         ],
//       ),
//     );
//   }