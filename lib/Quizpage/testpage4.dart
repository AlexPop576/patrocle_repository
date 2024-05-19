import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class TestPage4 extends StatefulWidget {
  final Function getAnswerFunction;
  String? question;
  int? answer;

  TestPage4(
      {super.key, required this.getAnswerFunction, this.answer, this.question});

  @override
  // ignore: no_logic_in_create_state
  State<TestPage4> createState() => _TestPage4State(
        getAnswerFunction: getAnswerFunction,
        answer: answer,
        question: question,
      );
}

class _TestPage4State extends State<TestPage4> {
  final Function getAnswerFunction;
  String? question;
  int? questionAnswer = 1, selected=0, givenAnswer, answer;

  _TestPage4State({
    required this.getAnswerFunction,
    this.answer,
    this.question,
  });

  @override
  void initState() {
    super.initState();
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
                      Lottie.asset('assets/patrocle.json',
                          frameRate: FrameRate.max, height: 100),
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
                    question ?? "Question",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 27),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,4,0),
                        child: SizedBox(
                          height: 140,
                          width: MediaQuery.of(context).size.width/2 - 30,
                          child: ClipRRect(
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
                                        color: Colors.green,
                                        width: 3)
                                    : BorderSide(
                                        color:
                                            Theme.of(context).colorScheme.primary,
                                        width: 3),
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Image.asset("assets/icons/true.png")
                              )),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4,0,0,0),
                        child: SizedBox(
                          height: 140,
                          width: MediaQuery.of(context).size.width/2 - 30,
                          child: ClipRRect(
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
                                        color: Colors.red,
                                        width: 3)
                                    : BorderSide(
                                        color:
                                            Theme.of(context).colorScheme.primary,
                                        width: 3),
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Image.asset("assets/icons/false.png")
                              )),
                            ),
                          ),
                        ),
                      )
                    ],
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
