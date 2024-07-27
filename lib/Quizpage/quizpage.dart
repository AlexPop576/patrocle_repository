import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle/Components/trophy_tile.dart';
import 'package:patrocle/Database/database_helper.dart';
import 'package:patrocle/Homepage/homepage.dart';
import 'package:patrocle/Homepage/levels.dart';
import 'package:patrocle/Quizpage/lesson.dart';
import 'package:patrocle/Quizpage/testpage2.dart';
import 'dart:math';
import '../Theme/general_info.dart';
import '../Theme/translations.dart';
import 'testpage1.dart';
import 'testpage3.dart';
import 'testpage4.dart';
import 'package:patrocle/Theme/theme.dart';

// ignore: must_be_immutable
class QuizPage extends StatefulWidget {
  QuizPage({
    super.key,
    required this.country,
    required this.difficulty,
    required this.subject,
    required this.mode,
    this.language,
  });
  String? country;
  int? difficulty, subject, language, mode;

  @override
  // ignore: no_logic_in_create_state
  State<QuizPage> createState() => _QuizPageState(
      country: country,
      difficulty: difficulty,
      subject: subject,
      mode: mode,
      language: language);
}

class _QuizPageState extends State<QuizPage> {
  _QuizPageState(
      {required this.country,
      required this.difficulty,
      required this.subject,
      required this.mode,
      this.language});

  //final _homepage = Homepage.instance;
  String? country;
  int? difficulty, subject, language = 2, mode = 1, randomNumber, digits;
  int pageIndex = 0,
      givenAnswer = -1,
      correctAnswersHard = 0,
      correctAnswersEasy = 0,
      bonus = 0,
      pageMax = 11,
      seconds = 60,
      initialSeconds = 0;
  List<int> questionNumber = [],
      easyAnswers = [],
      hardAnswers = [],
      specialQuestionAnswers = [9, 9, 9, 9, 9, 9, 9];
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  Map<String?, Map<int?, String?>> info = Info().info;
  List<Map<String, dynamic>> questions = [];
  double population = 0;
  final _dbHelper = DatabaseHelper.instance;
  List<int> answerBonus = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  int? bonusIQ = 0;
  Timer? timer;
  Timer? correctAnswerTimer;
  int secondsCorrectAnswer = 2;

  @override
  void initState() {
    super.initState();
    fetchData(country.toString(), subject.toString());
  }

  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 500), (_) {
      setState(() {
        seconds--;
        if (seconds == 0) {
          pageIndex = pageMax + 1;
        }
      });
    });
  }

  void startCorrectAnswerTimer() {
    secondsCorrectAnswer = 5;
    correctAnswerTimer = Timer.periodic(Duration(milliseconds: 500), (_) {
      setState(() {
        secondsCorrectAnswer--;
        if (secondsCorrectAnswer == 0) {
          Navigator.pop(context);
          setState(() {
            if (pageIndex < pageMax + 1) {
              pageIndex++;
              givenAnswer = 0;
              bonus = 0;
            }
          });
        }
      });
    });
  }

  void fetchData(String country, String subject) async {
    if (difficulty == 1) {
      questions = await _dbHelper.queryQuestions(country, subject, 1);
    } else if (difficulty == 3) {
      questions = await _dbHelper.queryQuestions(country, subject, 2);
    } else {
      questions = await _dbHelper.queryQuestions(country, subject, 1) +
          await _dbHelper.queryQuestions(country, subject, 2);
    }
    setState(() {
      pageMax = questions.length;
      if (pageMax > 10) {
        pageMax = 10;
      }
      seconds = questions.length * 20;
      initialSeconds = seconds;
    });
    var random = Random();
    var numbers = List<int>.generate(questions.length, (index) => index)
      ..shuffle(random);
    questionNumber = numbers.take(pageMax).toList();
    print('questions: $questions');
  }

  void correct() {
    setState(() {
      // Use the correctColor from the ThemeData extension
      sections.add(section(Theme.of(context).correctColor));
    });
  }

  void wrong() {
    setState(() {
      // Use the wrongColor from the ThemeData extension
      sections.add(section(Theme.of(context).wrongColor));
    });
  }

  void updateLessonStatus() async {
    await _dbHelper.updateLessonDone(subject!, country!);
    await _dbHelper.updateProfileLesson(subject!);
    mode == 2
        ? await _dbHelper.incrementCoins(10)
        : await _dbHelper.incrementCoins(5);
    ;
    await _dbHelper.incrementStreak();
    //_homepage.fetchStreak();
  }

  void updateIQ() async {
    await _dbHelper
        .updateProfileIQ(correctAnswersEasy * 5 + correctAnswersHard * 10);
  }

  void updateTrophies() async {
    int iq = 0, geography_lessons = 0, history_lessons = 0;
    _dbHelper.queryProfile().then((results) {
      if (results.isNotEmpty) {
        setState(() {
          iq = results.first['iq'];
          geography_lessons = subject == 1
              ? results.first['geography_lessons'] + 1
              : results.first['geography_lessons'];
          history_lessons = subject == 2
              ? results.first['history_lessons'] + 1
              : results.first['history_lessons'];
          if (geography_lessons == 5 && subject == 1) {
            _dbHelper.insertTrophy(1);
            _dbHelper.updateProfileTrophies();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Center(
                    child: Text(
                        "${translation[language]!["New trophy unlocked!"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
                content: SizedBox(
                    width: 100,
                    child: TrophyTile(
                      trophy: 1,
                      language: language,
                    )),
                elevation: 24,
              ),
            );
          } else if (history_lessons == 5 && subject == 2) {
            _dbHelper.insertTrophy(2);
            _dbHelper.updateProfileTrophies();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Center(
                    child: Text(
                        "${translation[language]!["New trophy unlocked!"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
                content: SizedBox(
                    width: 100,
                    child: TrophyTile(
                      trophy: 2,
                      language: language,
                    )),
                elevation: 24,
              ),
            );
          }
          if (geography_lessons + history_lessons == 20) {
            _dbHelper.insertTrophy(3);
            _dbHelper.updateProfileTrophies();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Center(
                    child: Text(
                        "${translation[language]!["New trophy unlocked!"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
                content: SizedBox(
                    width: 100,
                    child: TrophyTile(
                      trophy: 3,
                      language: language,
                    )),
                elevation: 24,
              ),
            );
          } else if (geography_lessons + history_lessons == 50) {
            _dbHelper.insertTrophy(5);
            _dbHelper.updateProfileTrophies();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Center(
                    child: Text(
                        "${translation[language]!["New trophy unlocked!"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
                content: SizedBox(
                    width: 100,
                    child: TrophyTile(
                      trophy: 5,
                      language: language,
                    )),
                elevation: 24,
              ),
            );
          } else if (geography_lessons + history_lessons == 100) {
            _dbHelper.insertTrophy(6);
            _dbHelper.updateProfileTrophies();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Center(
                    child: Text(
                        "${translation[language]!["New trophy unlocked!"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
                content: SizedBox(
                    width: 100,
                    child: TrophyTile(
                      trophy: 6,
                      language: language,
                    )),
                elevation: 24,
              ),
            );
          }
          if (iq < 500 &&
              iq + correctAnswersEasy * 5 + correctAnswersHard * 10 >= 500) {
            _dbHelper.insertTrophy(4);
            _dbHelper.updateProfileTrophies();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Center(
                    child: Text(
                        "${translation[language]!["New trophy unlocked!"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
                content: SizedBox(
                    width: 100,
                    child: TrophyTile(
                      trophy: 4,
                      language: language,
                    )),
                elevation: 24,
              ),
            );
          } else if (iq < 5000 &&
              iq + correctAnswersEasy * 5 + correctAnswersHard * 10 >= 5000) {
            _dbHelper.insertTrophy(7);
            _dbHelper.updateProfileTrophies();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Center(
                    child: Text(
                        "${translation[language]!["New trophy unlocked!"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
                content: SizedBox(
                    width: 100,
                    child: TrophyTile(
                      trophy: 7,
                      language: language,
                    )),
                elevation: 24,
              ),
            );
          } else if (iq < 10000 &&
              iq + correctAnswersEasy * 5 + correctAnswersHard * 10 >= 10000) {
            _dbHelper.insertTrophy(8);
            _dbHelper.updateProfileTrophies();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Center(
                    child: Text(
                        "${translation[language]!["New trophy unlocked!"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
                content: SizedBox(
                    width: 100,
                    child: TrophyTile(
                      trophy: 8,
                      language: language,
                    )),
                elevation: 24,
              ),
            );
          }
        });
      }
    });
  }

  getAnswer(int answer) {
    setState(() {
      givenAnswer = answer;
    });
    print('update: $givenAnswer');
  }

  List<Widget> sections = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pageIndex != pageMax + 1
          ? mode == 1
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17),
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Lottie.asset('assets/patrocle.json',
                                          frameRate: FrameRate.max,
                                          height: 100),
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
                                            backgroundColor:
                                                const Color.fromARGB(
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                            backgroundColor:
                                                const Color.fromARGB(
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                    flex: pageMax + 1 - pageIndex - bonus,
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
              : AppBar(
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17),
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Lottie.asset('assets/patrocle.json',
                                          frameRate: FrameRate.max,
                                          height: 100),
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
                                            backgroundColor:
                                                const Color.fromARGB(
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                  Expanded(
                                    flex: seconds,
                                    child: Container(
                                      height: 20,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  Expanded(
                                    flex: initialSeconds - seconds,
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
          child: getPage()),
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
                      if (givenAnswer != 0 && pageIndex != pageMax + 1) {
                        if (pageIndex == 0 && mode == 2) {
                          startTimer();
                        } else if (pageIndex > 0 && pageIndex < pageMax + 1) {
                          setState(() {
                            bonus = 1;
                          });
                          if (int.parse(questions[questionNumber[pageIndex - 1]]
                                  ['correct_answer']) ==
                              givenAnswer) {
                            correct();
                            difficulty == 1
                                ? correctAnswersEasy++
                                : difficulty == 2 &&
                                        questions[questionNumber[pageIndex - 1]]
                                                ['difficulty'] ==
                                            1
                                    ? correctAnswersEasy++
                                    : correctAnswersHard++;
                            startCorrectAnswerTimer();
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              isScrollControlled: true,
                              isDismissible: false,
                              enableDrag: false, // Disable dragging
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {},
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
                                                  "${translation[language]!["Well done!"]}",
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
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
                            setState(() {
                              answerBonus[pageIndex - 1] = 1;
                            });
                            if (pageIndex - 3 >= 0) {
                              if (answerBonus[pageIndex - 1] +
                                      answerBonus[pageIndex - 2] +
                                      answerBonus[pageIndex - 3] ==
                                  3) {
                                setState(() {
                                  bonusIQ = bonusIQ! + 3;
                                });
                              }
                            }
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
                                                  "${translation[language]!["Wrong!"]}",
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
                                                    correctAnswer(),
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
                                                    if (pageIndex <
                                                        pageMax + 1) {
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
                                                    "${translation[language]!["Continue"]}",
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
                      } else if (pageIndex == pageMax + 1) {
                        updateLessonStatus();
                        updateIQ();
                        updateTrophies();
                        Navigator.pop(context);
                        Navigator.pop(context);
                        mode == 2 ? Navigator.pop(context) : null;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Homepage(selectedIndex: 1);
                        }));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          givenAnswer == 0 && pageIndex != pageMax + 1
                              ? const Color.fromARGB(255, 59, 59, 73)
                              : const Color.fromARGB(255, 102, 102, 255),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    child: Text(
                        pageIndex == 0 || pageIndex == pageMax + 1
                            ? "${translation[language]!["Continue"]}"
                            : "${translation[language]!["Check"]}",
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

  Widget getPage() {
    if (pageIndex == 0) {
      return Lesson(
        country: country,
        subject: subject,
        language: language,
      );
    } else if (pageIndex != pageMax + 1) {
      final question = questions[questionNumber[pageIndex - 1]];

      // Adaugă declarații print pentru debugging
      print('Question Type: ${question['type']}');
      print('Question Data: $question');

      // Convertirea valorii la int, dacă este necesar
      final int questionType = int.parse(question['type'].toString());

      if (questionType == 1) {
        return TestPage1(
          key: ValueKey('TestPage1-${pageIndex}'),
          getAnswerFunction: getAnswer,
          selected: 0,
          questionText: question['question_text'].toString(),
          answersJSON: question['answer'].toString(),
          correct_answer: question['correct_answer'].toString(),
          givenAnswer: 0,
          language: language,
        );
      } else if (questionType == 2) {
        return TestPage2(
          key: ValueKey('TestPage3-${pageIndex}'),
          getAnswerFunction: getAnswer,
          question: question['question_text'].toString(),
          answer: question['correct_answer'].toString(),
          language: language,
        );
      } else if (questionType == 3) {
        return TestPage3(
          key: ValueKey('TestPage4-${pageIndex}'),
          getAnswerFunction: getAnswer,
          answers: question['answer'].toString(),
          language: language,
        );
      } else if (questionType == 4) {
        return TestPage4(
          key: ValueKey('TestPage5-${pageIndex}'),
          getAnswerFunction: getAnswer,
          answer: int.parse(question['correct_answer']),
          question: question['question_text'].toString(),
          language: language,
        );
      } else {
        print('Unexpected Question Type: $questionType');
        return Scaffold();
      }
    } else {
      return FinishPage(
        correctAnswersEasy: correctAnswersEasy,
        correctAnswersHard: correctAnswersHard,
        correctAnswers: correctAnswersEasy + correctAnswersHard,
        pageMax: pageMax,
        bonusIQ: bonusIQ,
        language: language,
      );
    }
  }

  String correctAnswer() {
    var currentQuestion = questions[questionNumber[pageIndex - 1]];
    var type = int.parse(currentQuestion['type']);
    print(currentQuestion['type']);
    if (type == 4) {
      print(' yes ');
      if (int.parse(currentQuestion['correct_answer']) == 1) {
        return "${translation[language]!["Correct answer"]}: ${translation[language]!["true"]}";
      } else {
        return "${translation[language]!["Correct answer"]}: ${translation[language]!["false"]}";
      }
    } else if (type == 1) {
      List<String> answers =
          List<String>.from(jsonDecode(currentQuestion['answer']));
      return "${translation[language]!["Correct answer"]}: ${answers[int.parse(currentQuestion['correct_answer']) - 1]}";
    } else if (type == 2) {
      return "${translation[language]!["Correct answer"]}: ${currentQuestion['correct_answer']}";
    } else {
      return "";
    }
  }
}

// ignore: must_be_immutable
class FinishPage extends StatelessWidget {
  FinishPage({
    super.key,
    required this.correctAnswersEasy,
    required this.correctAnswersHard,
    required this.correctAnswers,
    required this.pageMax,
    required this.bonusIQ,
    this.language,
  });
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  final int correctAnswersEasy, correctAnswersHard, correctAnswers;
  int? language = 2, pageMax, bonusIQ = 0;

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
              height: 200,
              child: Lottie.asset('assets/patrocle.json',
                  frameRate: FrameRate.max, fit: BoxFit.contain)),
          const SizedBox(
            height: 20,
          ),
          correctAnswers == 0 ||
                  correctAnswers == (0.1 * pageMax!).round() ||
                  correctAnswers == (0.2 * pageMax!).round()
              ? Text(
                  "${translation[language]!["Try again"]}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 219, 64, 64),
                  ),
                )
              : correctAnswers == (0.3 * pageMax!).round() ||
                      correctAnswers == (0.4 * pageMax!).round()
                  ? Text(
                      "${translation[language]!["Almost there!"]}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 219, 121, 64),
                      ),
                    )
                  : correctAnswers == (0.5 * pageMax!).round() ||
                          correctAnswers == (0.6 * pageMax!).round()
                      ? Text(
                          "${translation[language]!["Good job!"]}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 216, 219, 64),
                          ),
                        )
                      : correctAnswers == (0.7 * pageMax!).round() ||
                              correctAnswers == (0.8 * pageMax!).round()
                          ? Text(
                              "${translation[language]!["Fantastic!"]}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 196, 219, 64),
                              ),
                            )
                          : correctAnswers == (0.9 * pageMax!).round()
                              ? Text(
                                  "${translation[language]!["Almost perfect!"]}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromARGB(255, 131, 219, 64),
                                  ),
                                )
                              : Text(
                                  "${translation[language]!["Perfect!"]}",
                                  textAlign: TextAlign.center,
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
                ? "${translation[language]!["You`ve got"]} $correctAnswers ${translation[language]!["correct answers!"]}"
                : "${translation[language]!["You`ve got 1 correct answer!"]}",
            style: const TextStyle(fontSize: 23),
          ),
          const SizedBox(
            height: 40,
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
                          Text(
                              "${translation[language]!["Total IQ"]}"
                                  .toUpperCase(),
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
                                  "+${correctAnswersEasy * 5 + correctAnswersHard * 10 + bonusIQ!} IQ",
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
                              correctAnswers == (0.1 * pageMax!).round() ||
                              correctAnswers == (0.2 * pageMax!).round()
                          ? const Color.fromARGB(255, 219, 64, 64)
                          : correctAnswers == (0.3 * pageMax!).round() ||
                                  correctAnswers == (0.4 * pageMax!).round()
                              ? const Color.fromARGB(255, 219, 121, 64)
                              : correctAnswers == (0.5 * pageMax!).round() ||
                                      correctAnswers == (0.6 * pageMax!).round()
                                  ? const Color.fromARGB(255, 216, 219, 64)
                                  : correctAnswers ==
                                              (0.7 * pageMax!).round() ||
                                          correctAnswers ==
                                              (0.8 * pageMax!).round()
                                      ? const Color.fromARGB(255, 196, 219, 64)
                                      : correctAnswers ==
                                              (0.9 * pageMax!).round()
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
                          Text("${translation[language]!["Score"]}",
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
                                  "$correctAnswers/$pageMax",
                                  style: TextStyle(
                                      color: correctAnswers == 0 ||
                                              correctAnswers ==
                                                  (0.1 * pageMax!).round() ||
                                              correctAnswers ==
                                                  (0.2 * pageMax!).round()
                                          ? const Color.fromARGB(
                                              255, 219, 64, 64)
                                          : correctAnswers == (0.3 * pageMax!).round() ||
                                                  correctAnswers ==
                                                      (0.4 * pageMax!).round()
                                              ? const Color.fromARGB(
                                                  255, 219, 121, 64)
                                              : correctAnswers ==
                                                          (0.5 * pageMax!)
                                                              .round() ||
                                                      correctAnswers ==
                                                          (0.6 * pageMax!)
                                                              .round()
                                                  ? const Color.fromARGB(
                                                      255, 216, 219, 64)
                                                  : correctAnswers ==
                                                              (0.7 * pageMax!)
                                                                  .round() ||
                                                          correctAnswers ==
                                                              (0.8 * pageMax!)
                                                                  .round()
                                                      ? const Color.fromARGB(
                                                          255, 196, 219, 64)
                                                      : correctAnswers ==
                                                              (0.9 * pageMax!)
                                                                  .round()
                                                          ? const Color.fromARGB(
                                                              255, 131, 219, 64)
                                                          : const Color.fromARGB(
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
