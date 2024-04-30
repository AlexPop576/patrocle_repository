import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle/Database/database_helper.dart';
import 'package:patrocle/Homepage/test.dart';
import 'package:patrocle/Quizpage/lesson.dart';

import 'testpage1.dart';
import 'testpage2.dart';

// ignore: must_be_immutable
class QuizPage extends StatefulWidget {
  QuizPage({
    super.key,
    required this.country,
    required this.difficulty,
    required this.subject,
    required this.lesson,
    required this.QE,
    required this.QH,
    required this.QEA1,
    required this.QEA2,
    required this.QEA3,
    required this.QEA4,
    required this.QHA1,
    required this.QHA2,
    required this.QHA3,
    required this.QHA4,
  });
  String? country, lesson, QE, QH, QEA1, QEA2, QEA3, QEA4, QHA1, QHA2, QHA3, QHA4;
  int? difficulty, subject;

  @override
  // ignore: no_logic_in_create_state
  State<QuizPage> createState() => _QuizPageState(
      country: country,
      difficulty: difficulty,
      subject: subject,
      lesson: lesson,
      QE: QE,
      QH: QH,
      QEA1: QEA1,
      QEA2: QEA2,
      QEA3: QEA3,
      QEA4: QEA4,
      QHA1: QHA1,
      QHA2: QHA2,
      QHA3: QHA3,
      QHA4: QHA4,
      );
}

class _QuizPageState extends State<QuizPage> {
  _QuizPageState({
    required this.country,
    required this.difficulty,
    required this.subject,
    required this.lesson,
    required this.QE,
    required this.QH,
    required this.QEA1,
    required this.QEA2,
    required this.QEA3,
    required this.QEA4,
    required this.QHA1,
    required this.QHA2,
    required this.QHA3,
    required this.QHA4,
  });
  String? country, lesson, QE, QH, QEA1, QEA2, QEA3, QEA4, QHA1, QHA2, QHA3, QHA4;
  int? difficulty, subject;
  int pageIndex = 0, givenAnswer = -1, correctAnswers = 0, bonus = 0;
  //final _dbHelper = DatabaseHelper.instance;
  late List<String> easyQuestions, hardQuestions, easyQuestionsA1, easyQuestionsA2, easyQuestionsA3, easyQuestionsA4, hardQuestionsA1, hardQuestionsA2, hardQuestionsA3, hardQuestionsA4;

  @override
void initState() {
  super.initState();
  if (QE != null) {
    easyQuestions = List<String>.from(jsonDecode(QE!));
  } else {
    easyQuestions = [];
  }
  // Do the same for QH if it's also a JSON string
  if (QH != null) {
    hardQuestions = List<String>.from(jsonDecode(QH!));
  } else {
    hardQuestions = [];
  }
  if (QEA1 != null) {
    easyQuestionsA1 = List<String>.from(jsonDecode(QEA1!));
    print(easyQuestionsA1);
  } else {
    easyQuestionsA1 = [];
  }
  if (QEA2 != null) {
    easyQuestionsA2 = List<String>.from(jsonDecode(QEA2!));
    print(easyQuestionsA2);
  } else {
    easyQuestionsA2 = [];
  }
  if (QEA3 != null) {
    easyQuestionsA3 = List<String>.from(jsonDecode(QEA3!));
    print(easyQuestionsA3);
  } else {
    easyQuestionsA3 = [];
  }
  if (QEA4 != null) {
    easyQuestionsA4 = List<String>.from(jsonDecode(QEA4!));
    print(easyQuestionsA4);
  } else {
    easyQuestionsA4 = [];
  }
  if (QHA1 != null) {
    hardQuestionsA1 = List<String>.from(jsonDecode(QHA1!));
    print(hardQuestionsA1);
  } else {
    hardQuestionsA1 = [];
  }
  if (QHA2 != null) {
    hardQuestionsA2 = List<String>.from(jsonDecode(QHA2!));
    print(hardQuestionsA2);
  } else {
    hardQuestionsA2 = [];
  }
  if (QHA3 != null) {
    hardQuestionsA3 = List<String>.from(jsonDecode(QHA3!));
    print(hardQuestionsA3);
  } else {
    hardQuestionsA3 = [];
  }
  if (QHA4 != null) {
    hardQuestionsA4 = List<String>.from(jsonDecode(QHA4!));
    print(hardQuestionsA4);
  } else {
    hardQuestionsA4 = [];
  }
}

  void correct() {
    setState(() {
      sections.add(section(Colors.green));
    });
  }

  void wrong() {
    setState(() {
      sections.add(section(Colors.red));
    });
  }

  getAnswer(int answer) {
    setState(() {
      givenAnswer = answer;
    });
  }

  List<Widget> sections = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pageIndex != 11
          ? AppBar(
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
                                  Lottie.asset(
                                      'assets/patrocle.json',
                                      frameRate: FrameRate.max,
                                      height: 100),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: Text(
                                      "Do you want to end your learning session? If you quit, you`ll lose your progress.",
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
                                      child: const Center(
                                          child: Text("Continue",
                                              style: TextStyle(
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
                                      child: const Center(
                                          child: Text("Quit",
                                              style: TextStyle(
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
              title: pageIndex == 0
                  ? Text(
                      country.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Row(
                            children: [
                              ...sections,
                              Expanded(
                                flex: 11 - pageIndex! - bonus!,
                                child: Container(
                                  height: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ),
              centerTitle: true,
              elevation: 0,
            )
          : null,
      body: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (child, animation, secondaryAnimation) =>
              SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                fillColor: Theme.of(context).colorScheme.background,
                child: child,
              ),
          child: pageIndex == 0
              ? Lesson(lesson: lesson)
              : pageIndex != 11 && pageIndex % 2 == 0
                  ? TestPage1(
                      getAnswerFunction: getAnswer,
                      selected: 0,
                      questionText: difficulty == 1 ? easyQuestions[pageIndex-1]: difficulty == 2 ? easyQuestions[pageIndex-1]: hardQuestions[pageIndex-1] ,
                      answer1: difficulty == 1 ? easyQuestionsA1[pageIndex-1] : difficulty == 2 ? easyQuestionsA1[pageIndex-1] : hardQuestionsA1[pageIndex-1],
                      answer2: difficulty == 1 ? easyQuestionsA2[pageIndex-1] : difficulty == 2 ? easyQuestionsA2[pageIndex-1] : hardQuestionsA2[pageIndex-1],
                      answer3: difficulty == 1 ? easyQuestionsA3[pageIndex-1] : difficulty == 2 ? easyQuestionsA3[pageIndex-1] : hardQuestionsA3[pageIndex-1],
                      answer4: difficulty == 1 ? easyQuestionsA4[pageIndex-1] : difficulty == 2 ? easyQuestionsA4[pageIndex-1] : hardQuestionsA4[pageIndex-1],
                      givenAnswer: 0,
                    )
                  : pageIndex != 11 && pageIndex % 2 == 1
                      ? TestPage2(
                          getAnswerFunction: getAnswer,
                          selected: 0,
                          questionText: difficulty == 1 ? easyQuestions[pageIndex-1]: difficulty == 2 ? easyQuestions[pageIndex-1]: hardQuestions[pageIndex-1],
                          answer1: difficulty == 1 ? easyQuestionsA1[pageIndex-1] : difficulty == 2 ? easyQuestionsA1[pageIndex-1] : hardQuestionsA1[pageIndex-1],
                          answer2: difficulty == 1 ? easyQuestionsA2[pageIndex-1] : difficulty == 2 ? easyQuestionsA2[pageIndex-1] : hardQuestionsA2[pageIndex-1],
                          answer3: difficulty == 1 ? easyQuestionsA3[pageIndex-1] : difficulty == 2 ? easyQuestionsA3[pageIndex-1] : hardQuestionsA3[pageIndex-1],
                          answer4: difficulty == 1 ? easyQuestionsA4[pageIndex-1] : difficulty == 2 ? easyQuestionsA4[pageIndex-1] : hardQuestionsA4[pageIndex-1],
                          givenAnswer: 0,
                        )
                      : FinishPage(correctAnswers: correctAnswers)),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 58,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (givenAnswer != 0 && pageIndex != 11) {
                        if (pageIndex > 0 && pageIndex < 11) {
                          setState(() {
                            bonus = 1;
                          });
                          if ( //answersQuiz[country]?[subject]?[pageIndex - 1] ==
                              1 == givenAnswer) {
                            correct();
                            correctAnswers++;
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              isScrollControlled: true,
                              isDismissible: false,
                              enableDrag: false, // Disable dragging
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {
                                    // Do nothing on tap outside
                                  },
                                  child: Container(
                                    height: 170,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 15),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/icons/Correct.png',
                                                  height: 30,
                                                ),
                                                const SizedBox(width: 15),
                                                Text(
                                                  "Well done!",
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            SizedBox(
                                              height: 58,
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    if (pageIndex < 11) {
                                                      pageIndex++;
                                                      givenAnswer = 0;
                                                      bonus = 0;
                                                    }
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.green,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(15),
                                                    ),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Continue",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 30,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                            //await _correct.seek(Duration.zero);
                            //await _correct.play();
                          } else {
                            wrong();
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              isScrollControlled: true,
                              isDismissible: false,
                              enableDrag: false, // Disable dragging
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {
                                    // Do nothing on tap outside
                                  },
                                  child: Container(
                                    height: 190,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 15),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/icons/Wrong.png',
                                                  height: 30,
                                                ),
                                                const SizedBox(width: 15),
                                                Text(
                                                  "Wrong!",
                                                  style: const TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Correct answer: to be done",
                                                    //"Correct answer: ${allAnswersQuiz[country]![subject]!["Answer$pageIndex${answersQuiz[country]![subject]![pageIndex - 1]}"]}",
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            SizedBox(
                                              height: 58,
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    if (pageIndex < 11) {
                                                      pageIndex++;
                                                      givenAnswer = 0;
                                                      bonus = 0;
                                                    }
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(15),
                                                    ),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Continue",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 30,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                            //await _incorrect.seek(Duration.zero);
                            //await _incorrect.play();
                          }
                        }
                        setState(() {
                          if (pageIndex < 1) {
                            pageIndex++;
                            givenAnswer = 0;
                            bonus = 0;
                          }
                        });
                      } else if (pageIndex == 11) {
                        Navigator.pop(context);
                        //trophy
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: givenAnswer == 0 && pageIndex != 11
                          ? const Color.fromARGB(255, 59, 59, 73)
                          : const Color.fromARGB(255, 102, 102, 255),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    child: Text(
                        pageIndex == 0 || pageIndex == 11
                            ? "Continue"
                            : "Check",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class FinishPage extends StatelessWidget {
  FinishPage({
    super.key,
    required this.correctAnswers,
  });

  final int correctAnswers;
  int? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          SizedBox(
              height: 220,
              child: Lottie.asset('assets/patrocle.json',
                  frameRate: FrameRate.max, fit: BoxFit.contain)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          correctAnswers == 0 || correctAnswers == 1 || correctAnswers == 2
              ? Text(
                  "Try again",
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 219, 64, 64),
                  ),
                )
              : correctAnswers == 3 || correctAnswers == 4
                  ? Text(
                      "Almost there!",
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 219, 121, 64),
                      ),
                    )
                  : correctAnswers == 5 || correctAnswers == 6
                      ? Text(
                          "Good job!",
                          style: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 216, 219, 64),
                          ),
                        )
                      : correctAnswers == 7 || correctAnswers == 8
                          ? Text(
                              "Fantastic!",
                              style: const TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 196, 219, 64),
                              ),
                            )
                          : correctAnswers == 9
                              ? Text(
                                  "Almost perfect!",
                                  style: const TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromARGB(255, 131, 219, 64),
                                  ),
                                )
                              : Text(
                                  "Perfect!",
                                  style: const TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromARGB(255, 77, 219, 64),
                                  ),
                                ),
          const SizedBox(
            height: 10,
          ),
          Text(
            correctAnswers != 1
                ? "You`ve got $correctAnswers correct answers!"
                : "You`ve got 1 correct answer!",
            style: const TextStyle(fontSize: 23),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 100,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 8.3, 0),
                    //padding: const EdgeInsets.all(2.8),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromARGB(255, 102, 102, 255),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          Text("TOTAL IQ",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17)),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                height: 64,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                                child: Center(
                                    child: Text(
                                  "+${correctAnswers * 10} IQ",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 102, 102, 255),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27),
                                ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 100,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8.3, 0, 0, 0),
                    //padding: const EdgeInsets.all(2.8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: correctAnswers == 0 ||
                              correctAnswers == 1 ||
                              correctAnswers == 2
                          ? const Color.fromARGB(255, 219, 64, 64)
                          : correctAnswers == 3 || correctAnswers == 4
                              ? const Color.fromARGB(255, 219, 121, 64)
                              : correctAnswers == 5 || correctAnswers == 6
                                  ? const Color.fromARGB(255, 216, 219, 64)
                                  : correctAnswers == 7 || correctAnswers == 8
                                      ? const Color.fromARGB(255, 196, 219, 64)
                                      : correctAnswers == 9
                                          ? const Color.fromARGB(
                                              255, 131, 219, 64)
                                          : const Color.fromARGB(
                                              255, 77, 219, 64),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          Text("SCORE",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17)),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                height: 64,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                                child: Center(
                                    child: Text(
                                  "$correctAnswers/10",
                                  style: TextStyle(
                                      color: correctAnswers == 0 ||
                                              correctAnswers == 1 ||
                                              correctAnswers == 2
                                          ? const Color.fromARGB(
                                              255, 219, 64, 64)
                                          : correctAnswers == 3 ||
                                                  correctAnswers == 4
                                              ? const Color.fromARGB(
                                                  255, 219, 121, 64)
                                              : correctAnswers == 5 ||
                                                      correctAnswers == 6
                                                  ? const Color.fromARGB(
                                                      255, 216, 219, 64)
                                                  : correctAnswers == 7 ||
                                                          correctAnswers == 8
                                                      ? const Color.fromARGB(
                                                          255, 196, 219, 64)
                                                      : correctAnswers == 9
                                                          ? const Color
                                                              .fromARGB(
                                                              255, 131, 219, 64)
                                                          : const Color
                                                              .fromARGB(
                                                              255, 77, 219, 64),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27),
                                ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

Widget section(Color color) {
  return Expanded(
    flex: 1,
    child: Container(
      height: 20,
      color: color,
    ),
  );
}
