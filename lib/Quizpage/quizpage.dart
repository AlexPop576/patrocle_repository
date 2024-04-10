import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle/Database/database_helper.dart';
import 'package:patrocle/Quizpage/lesson.dart';

// ignore: must_be_immutable
class QuizPage extends StatefulWidget {
  QuizPage(
      {super.key,
      required this.country,
      required this.difficulty,
      required this.subject,
      required this.lesson});
  String? country, lesson;
  int? difficulty, subject;

  @override
  // ignore: no_logic_in_create_state
  State<QuizPage> createState() => _QuizPageState(
      country: country,
      difficulty: difficulty,
      subject: subject,
      lesson: lesson);
}

class _QuizPageState extends State<QuizPage> {
  _QuizPageState(
      {required this.country,
      required this.difficulty,
      required this.subject,
      required this.lesson});
  String? country, lesson;
  int? difficulty, subject;
  int pageIndex = 0, givenAnswer = 0, correctAnswers = 0;
  final _dbHelper = DatabaseHelper.instance;

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
                                  Lottie.network(
                                      'https://lottie.host/491f2840-4c44-425a-924e-4fbc86237dfc/s8x6EccXsD.json',
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
                                      child: Center(
                                          child: Text("Continue",
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
                                          child: Text("Quit",
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
                                flex: 11 - pageIndex!,
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
        child: pageIndex == 0 ? Lesson(lesson: lesson) : Lesson(lesson: lesson),
      ),
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
                          if (//answersQuiz[country]?[subject]?[pageIndex - 1] ==
                              1 ==
                              givenAnswer) {
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
                                                  'assets/Correct.png',
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
                                                  'assets/Wrong.png',
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

Widget section(Color color) {
  return Expanded(
    flex: 1,
    child: Container(
      height: 20,
      color: color,
    ),
  );
}
