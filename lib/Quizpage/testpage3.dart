import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Theme/general_info.dart';

// ignore: must_be_immutable
class TestPage3 extends StatefulWidget {
  final Function getAnswerFunction;
  int? selected = 0, givenAnswer, subject, randomNumber;
  String? country;
  TestPage3(
      {super.key,
      required this.getAnswerFunction,
      this.selected,
      this.subject,
      this.country,
      this.randomNumber,
      this.givenAnswer});

  @override
  // ignore: no_logic_in_create_state
  State<TestPage3> createState() => _TestPage3State(
      getAnswerFunction: getAnswerFunction,
      selected: selected,
      subject: subject,
      country: country,
      randomNumber: randomNumber,
      givenAnswer: givenAnswer);
}

class _TestPage3State extends State<TestPage3> {
  int? questionAnswer = 1, selected, givenAnswer, randomNumber, subject, digits;
  double _currentSliderValue = 0, value = 0, maxNumber=0, population=0;
  String? country;
  final Function getAnswerFunction;
  Map<String?, Map<int?, String?>> info = Info().info;

  _TestPage3State(
      {required this.getAnswerFunction,
      this.selected,
      this.subject,
      this.country,
      this.randomNumber,
      this.givenAnswer});

  @override
  void initState() {
    super.initState();
    String populationString = info[country]![3]!.replaceAll(',', '');
    digits = populationString.length;
    print(digits);
    population = double.parse(populationString);
    population = digits!>6 ? population/1000000 : population/1000;
    maxNumber = (population/randomNumber!)*6;
    print("$randomNumber $population $maxNumber");
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
                          subject == 1 ? digits!>6 ? "Care este populatia tarii (milioane)?" : "Care este populatia tarii (mii)?" : "In ce an?",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Divider(
                      color: Theme.of(context).colorScheme.primary,
                      thickness: 3),
                  const SizedBox(height: 24),
                  Slider(
                    value: _currentSliderValue,
                    max: maxNumber.toDouble(),
                    activeColor: const Color.fromARGB(255, 102, 102, 255),
                    divisions: 6,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                        //getAnswerFunction();
                      });
                    },
                  ),
                  const SizedBox(height: 12,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
