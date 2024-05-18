import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class TestPage3 extends StatefulWidget {
  final Function getAnswerFunction;
  String? answers;

  TestPage3({super.key, required this.getAnswerFunction, required this.answers});

  @override
  // ignore: no_logic_in_create_state
  State<TestPage3> createState() => _TestPage3State(
        getAnswerFunction: getAnswerFunction,
        answers: answers,
      );
}

class _TestPage3State extends State<TestPage3> {
  final Function getAnswerFunction;
  String? answers;
  List<String> answersColumn = [];
  List<int> randomNumbers = [];
  int selected1 = 0, selected2 = 0, selected3 = 0, selected4 = 0, givenAnswer=0, correctAnswer = 0;

  _TestPage3State({
    required this.getAnswerFunction, required this.answers
  });

  @override
  void initState() {
    super.initState();
    var random = Random();
    randomNumbers = List<int>.generate(4, (index) => index)..shuffle(random);
    answersColumn = List<String>.from(jsonDecode(answers!));
    print('randomm $randomNumbers');
    correctAnswer = (randomNumbers[0]+1)*1000+(randomNumbers[1]+1)*100+(randomNumbers[2]+1)*10+(randomNumbers[3]+1);
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
                              fontSize: 50),
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
                    "Match the words with the help of the colors:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 27),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 58,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      side: const BorderSide(
                                          color: Colors.red, width: 3),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(answersColumn[0],
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30)),
                                    )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 58,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      side: const BorderSide(
                                          color: Colors.yellow, width: 3),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(answersColumn[1],
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30)),
                                    )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 58,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      side: const BorderSide(
                                          color: Colors.green, width: 3),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(answersColumn[2],
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30)),
                                    )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 58,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      side: const BorderSide(
                                          color: Colors.blue, width: 3),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(answersColumn[3],
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30)),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 58,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (selected1 < 4) {
                                          selected1++;
                                        } else {
                                          selected1 = 1;
                                        }
                                        if(selected1!=0&&selected2!=0&&selected3!=0&&selected4!=0&&selected1!=selected2&&selected1!=selected3&&selected1!=selected4&&selected2!=selected3&&selected2!=selected4&&selected3!=selected4)
                                        {
                                          int finalAnswer = selected1*1000+selected2*100+selected3*10+selected4;
                                          if(finalAnswer==correctAnswer){
                                            getAnswerFunction(1);
                                          }else{
                                            getAnswerFunction(2);
                                          }
                                        }else{
                                          getAnswerFunction(0);
                                        }
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      side: selected1 == 1
                                          ? const BorderSide(
                                              color: Colors.red, width: 3)
                                          : selected1 == 2
                                              ? const BorderSide(
                                                  color: Colors.yellow,
                                                  width: 3)
                                              : selected1 == 3
                                                  ? const BorderSide(
                                                      color: Colors.green,
                                                      width: 3)
                                                  : selected1 == 4
                                                      ? const BorderSide(
                                                          color: Colors.blue,
                                                          width: 3)
                                                      : BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                          width: 3),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(
                                          answersColumn[randomNumbers[0]+4],
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30)),
                                    )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 58,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (selected2 < 4) {
                                          selected2++;
                                        } else {
                                          selected2 = 1;
                                        }
                                        if(selected1!=0&&selected2!=0&&selected3!=0&&selected4!=0&&selected1!=selected2&&selected1!=selected3&&selected1!=selected4&&selected2!=selected3&&selected2!=selected4&&selected3!=selected4)
                                        {
                                          int finalAnswer = selected1*1000+selected2*100+selected3*10+selected4;
                                          if(finalAnswer==correctAnswer){
                                            getAnswerFunction(1);
                                          }else{
                                            getAnswerFunction(2);
                                          }
                                        }else{
                                          getAnswerFunction(0);
                                        }
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      side: selected2 == 1
                                          ? const BorderSide(
                                              color: Colors.red, width: 3)
                                          : selected2 == 2
                                              ? const BorderSide(
                                                  color: Colors.yellow,
                                                  width: 3)
                                              : selected2 == 3
                                                  ? const BorderSide(
                                                      color: Colors.green,
                                                      width: 3)
                                                  : selected2 == 4
                                                      ? const BorderSide(
                                                          color: Colors.blue,
                                                          width: 3)
                                                      : BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                          width: 3),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(
                                          answersColumn[randomNumbers[1]+4],
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30)),
                                    )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 58,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (selected3 < 4) {
                                          selected3++;
                                        } else {
                                          selected3 = 1;
                                        }
                                        if(selected1!=0&&selected2!=0&&selected3!=0&&selected4!=0&&selected1!=selected2&&selected1!=selected3&&selected1!=selected4&&selected2!=selected3&&selected2!=selected4&&selected3!=selected4)
                                        {
                                          int finalAnswer = selected1*1000+selected2*100+selected3*10+selected4;
                                          if(finalAnswer==correctAnswer){
                                            getAnswerFunction(1);
                                          }else{
                                            getAnswerFunction(2);
                                          }
                                        }else{
                                          getAnswerFunction(0);
                                        }
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      side: selected3 == 1
                                          ? const BorderSide(
                                              color: Colors.red, width: 3)
                                          : selected3 == 2
                                              ? const BorderSide(
                                                  color: Colors.yellow,
                                                  width: 3)
                                              : selected3 == 3
                                                  ? const BorderSide(
                                                      color: Colors.green,
                                                      width: 3)
                                                  : selected3 == 4
                                                      ? const BorderSide(
                                                          color: Colors.blue,
                                                          width: 3)
                                                      : BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                          width: 3),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(
                                          answersColumn[randomNumbers[2]+4],
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30)),
                                    )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 58,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (selected4 < 4) {
                                          selected4++;
                                        } else {
                                          selected4 = 1;
                                        }
                                        if(selected1!=0&&selected2!=0&&selected3!=0&&selected4!=0&&selected1!=selected2&&selected1!=selected3&&selected1!=selected4&&selected2!=selected3&&selected2!=selected4&&selected3!=selected4)
                                        {
                                          int finalAnswer = selected1*1000+selected2*100+selected3*10+selected4;
                                          if(finalAnswer==correctAnswer){
                                            getAnswerFunction(1);
                                          }else{
                                            getAnswerFunction(2);
                                          }
                                        }else{
                                          getAnswerFunction(0);
                                        }
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      side: selected4 == 1
                                          ? const BorderSide(
                                              color: Colors.red, width: 3)
                                          : selected4 == 2
                                              ? const BorderSide(
                                                  color: Colors.yellow,
                                                  width: 3)
                                              : selected4 == 3
                                                  ? const BorderSide(
                                                      color: Colors.green,
                                                      width: 3)
                                                  : selected4 == 4
                                                      ? const BorderSide(
                                                          color: Colors.blue,
                                                          width: 3)
                                                      : BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                          width: 3),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(
                                          answersColumn[randomNumbers[3]+4],
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30)),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
