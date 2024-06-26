import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:translator/translator.dart';

// ignore: must_be_immutable
class TestPage2 extends StatefulWidget {
  final Function getAnswerFunction;
  String? question, answer;
  int? language;

  TestPage2(
      {super.key, required this.getAnswerFunction, this.answer, this.question, required this.language});

  @override
  // ignore: no_logic_in_create_state
  State<TestPage2> createState() => _TestPage2State(
        getAnswerFunction: getAnswerFunction,
        answer: answer,
        question: question,
        language: language,
      );
}

class _TestPage2State extends State<TestPage2> {
  final Function getAnswerFunction;
  String? question, answer;
  int? questionAnswer = 1, selected, givenAnswer, language;
  int randomNumber = 3;
  double _currentSliderValue = 0, value = 0;
  GoogleTranslator translator = GoogleTranslator();

  _TestPage2State({
    required this.getAnswerFunction,
    this.answer,
    this.question,
    required this.language,
  });

  @override
  void initState() {
    super.initState();
    var random = Random();
    randomNumber = random.nextInt(6) + 1;
    translate(question!);
  }

  void translate(String text)
  {
    String toLanguage;
    if(language==4)
    {
      toLanguage = "es";
    }else if(language==2)
    {
      toLanguage = "ro";
    }else if(language==3)
    {
      toLanguage = "hu";
    }else{
      toLanguage = "en";
    }
    translator.translate(text, to: toLanguage).then((output){
      setState(() {
        question = output.toString();
      });
    });
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
                  SliderTheme(
                    data: const SliderThemeData(
                      trackHeight: 25,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 17),
                      inactiveTrackColor: Color.fromARGB(255, 210, 210, 210),
                      activeTrackColor: Colors.green,
                      thumbColor: Colors.green,
                      valueIndicatorColor: Colors.green,
                      activeTickMarkColor: Colors.transparent,
                      inactiveTickMarkColor: Colors.transparent,
                      valueIndicatorTextStyle: TextStyle(color: Colors.white),
                    ),
                    child: Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: int.parse(answer.toString()) / randomNumber * 6,
                      divisions: 6,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          getAnswerFunction(value.toInt());
                          _currentSliderValue = value;
                        });
                      },
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
