import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../Database/database_helper.dart';

class AddTest extends StatefulWidget {
  const AddTest({super.key});

  @override
  State<AddTest> createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
  final _dbHelper = DatabaseHelper.instance;
  List<int> answersGeographyEasy = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<int> answersGeographyHard = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<int> answersHistoryEasy = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<int> answersHistoryHard = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  List<String> easyGeographyQuestions = [
    "Q1",
    "Q2",
    "Q3",
    "Q4",
    "Q5",
    "Q6",
    "Q7",
    "Q8",
    "Q9",
    "Q10"
  ];
  List<String> hardGeographyQuestions = [
    "Q1",
    "Q2",
    "Q3",
    "Q4",
    "Q5",
    "Q6",
    "Q7",
    "Q8",
    "Q9",
    "Q10"
  ];
  List<String> easyHistoryQuestions = [
    "Q1",
    "Q2",
    "Q3",
    "Q4",
    "Q5",
    "Q6",
    "Q7",
    "Q8",
    "Q9",
    "Q10"
  ];
  List<String> hardHistoryQuestions = [
    "Q1",
    "Q2",
    "Q3",
    "Q4",
    "Q5",
    "Q6",
    "Q7",
    "Q8",
    "Q9",
    "Q10"
  ];

  String? textus;
  final _controllerName = TextEditingController(),
      _controllerLessonGeography = TextEditingController(),
      _controllerLessonHistory = TextEditingController();
  final _controllerGEQ1 = TextEditingController(),
      _controllerGEQ2 = TextEditingController(),
      _controllerGEQ3 = TextEditingController(),
      _controllerGEQ4 = TextEditingController(),
      _controllerGEQ5 = TextEditingController(),
      _controllerGEQ6 = TextEditingController(),
      _controllerGEQ7 = TextEditingController(),
      _controllerGEQ8 = TextEditingController(),
      _controllerGEQ9 = TextEditingController(),
      _controllerGEQ10 = TextEditingController();
  final _controllerGHQ1 = TextEditingController(),
      _controllerGHQ2 = TextEditingController(),
      _controllerGHQ3 = TextEditingController(),
      _controllerGHQ4 = TextEditingController(),
      _controllerGHQ5 = TextEditingController(),
      _controllerGHQ6 = TextEditingController(),
      _controllerGHQ7 = TextEditingController(),
      _controllerGHQ8 = TextEditingController(),
      _controllerGHQ9 = TextEditingController(),
      _controllerGHQ10 = TextEditingController();
  final _controllerHEQ1 = TextEditingController(),
      _controllerHEQ2 = TextEditingController(),
      _controllerHEQ3 = TextEditingController(),
      _controllerHEQ4 = TextEditingController(),
      _controllerHEQ5 = TextEditingController(),
      _controllerHEQ6 = TextEditingController(),
      _controllerHEQ7 = TextEditingController(),
      _controllerHEQ8 = TextEditingController(),
      _controllerHEQ9 = TextEditingController(),
      _controllerHEQ10 = TextEditingController();
  final _controllerHHQ1 = TextEditingController(),
      _controllerHHQ2 = TextEditingController(),
      _controllerHHQ3 = TextEditingController(),
      _controllerHHQ4 = TextEditingController(),
      _controllerHHQ5 = TextEditingController(),
      _controllerHHQ6 = TextEditingController(),
      _controllerHHQ7 = TextEditingController(),
      _controllerHHQ8 = TextEditingController(),
      _controllerHHQ9 = TextEditingController(),
      _controllerHHQ10 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 25.0,
              sigmaY: 25.0,
            ),
            child: Opacity(
              opacity: 0.7,
              child: AppBar(
                flexibleSpace: Container(color: Colors.transparent),
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
                                  color:
                                      Theme.of(context).colorScheme.background,
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
                                        "Do you want to quit adding the test? If you quit, you`ll lose your work.",
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
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 102, 102, 255),
                                          ),
                                          child: const Center(
                                              child: Text("Continue",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 30))),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    SizedBox(
                                      height: 58,
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 219, 64, 64),
                                          ),
                                          child: const Center(
                                              child: Text("Quit",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 30))),
                                        ),
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
                title: const Text(
                  "Add test",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
                centerTitle: true,
                elevation: 0,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              const SizedBox(height: 80),
              const Text(
                "Country name",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 58,
                child: TextField(
                  controller: _controllerName,
                  cursorColor: Colors.white,
                  maxLength: 50,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                          width: 1.0),
                    ),
                    labelText: 'Country name',
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    counterText: '',
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const Text(
                "Geography lesson",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 350,
                child: TextField(
                  controller: _controllerLessonGeography,
                  cursorColor: Colors.white,
                  maxLines: null,
                  expands: true,
                  maxLength: 2000,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                          width: 1.0),
                    ),
                    //labelText: 'Geography lesson',
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    counterText: '',
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(
                height: 5,
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              Text(
                "Easy geography questions",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
            ]),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return NewQuestion(
                answers: answersGeographyEasy,
                index: index + 1,
                q1: _controllerGEQ1,
                q2: _controllerGEQ2,
                q3: _controllerGEQ3,
                q4: _controllerGEQ4,
                q5: _controllerGEQ5,
                q6: _controllerGEQ6,
                q7: _controllerGEQ7,
                q8: _controllerGEQ8,
                q9: _controllerGEQ9,
                q10: _controllerGEQ10,
              );
            }, childCount: 10),
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              Text(
                "Hard geography questions",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
            ]),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return NewQuestion(
                answers: answersGeographyHard,
                index: index + 1,
                q1: _controllerGHQ1,
                q2: _controllerGHQ2,
                q3: _controllerGHQ3,
                q4: _controllerGHQ4,
                q5: _controllerGHQ5,
                q6: _controllerGHQ6,
                q7: _controllerGHQ7,
                q8: _controllerGHQ8,
                q9: _controllerGHQ9,
                q10: _controllerGHQ10,
              );
            }, childCount: 10),
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              const Text(
                "History lesson",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 350,
                child: TextField(
                  controller: _controllerLessonHistory,
                  cursorColor: Colors.white,
                  maxLines: null,
                  expands: true,
                  maxLength: 2000,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                          width: 1.0),
                    ),
                    //labelText: 'History lesson',
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    counterText: '',
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(
                height: 5,
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              Text(
                "Easy history questions",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
            ]),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return NewQuestion(
                answers: answersHistoryEasy,
                index: index + 1,
                q1: _controllerHEQ1,
                q2: _controllerHEQ2,
                q3: _controllerHEQ3,
                q4: _controllerHEQ4,
                q5: _controllerHEQ5,
                q6: _controllerHEQ6,
                q7: _controllerHEQ7,
                q8: _controllerHEQ8,
                q9: _controllerHEQ9,
                q10: _controllerHEQ10,
              );
            }, childCount: 10),
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              Text(
                "Hard history questions",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
            ]),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return NewQuestion(
                answers: answersHistoryHard,
                index: index + 1,
                q1: _controllerHHQ1,
                q2: _controllerHHQ2,
                q3: _controllerHHQ3,
                q4: _controllerHHQ4,
                q5: _controllerHHQ5,
                q6: _controllerHHQ6,
                q7: _controllerHHQ7,
                q8: _controllerHHQ8,
                q9: _controllerHHQ9,
                q10: _controllerHHQ10,
              );
            }, childCount: 10),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 58,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        easyGeographyQuestions[0] = _controllerGEQ1.text;
                        easyGeographyQuestions[1] = _controllerGEQ2.text;
                        easyGeographyQuestions[2] = _controllerGEQ3.text;
                        easyGeographyQuestions[3] = _controllerGEQ4.text;
                        easyGeographyQuestions[4] = _controllerGEQ5.text;
                        easyGeographyQuestions[5] = _controllerGEQ6.text;
                        easyGeographyQuestions[6] = _controllerGEQ7.text;
                        easyGeographyQuestions[7] = _controllerGEQ8.text;
                        easyGeographyQuestions[8] = _controllerGEQ9.text;
                        easyGeographyQuestions[9] = _controllerGEQ10.text;
                        hardGeographyQuestions[0] = _controllerGHQ1.text;
                        hardGeographyQuestions[1] = _controllerGHQ2.text;
                        hardGeographyQuestions[2] = _controllerGHQ3.text;
                        hardGeographyQuestions[3] = _controllerGHQ4.text;
                        hardGeographyQuestions[4] = _controllerGHQ5.text;
                        hardGeographyQuestions[5] = _controllerGHQ6.text;
                        hardGeographyQuestions[6] = _controllerGHQ7.text;
                        hardGeographyQuestions[7] = _controllerGHQ8.text;
                        hardGeographyQuestions[8] = _controllerGHQ9.text;
                        hardGeographyQuestions[9] = _controllerGHQ10.text;
                        easyHistoryQuestions[0] = _controllerHEQ1.text;
                        easyHistoryQuestions[1] = _controllerHEQ2.text;
                        easyHistoryQuestions[2] = _controllerHEQ3.text;
                        easyHistoryQuestions[3] = _controllerHEQ4.text;
                        easyHistoryQuestions[4] = _controllerHEQ5.text;
                        easyHistoryQuestions[5] = _controllerHEQ6.text;
                        easyHistoryQuestions[6] = _controllerHEQ7.text;
                        easyHistoryQuestions[7] = _controllerHEQ8.text;
                        easyHistoryQuestions[8] = _controllerHEQ9.text;
                        easyHistoryQuestions[9] = _controllerHEQ10.text;
                        hardHistoryQuestions[0] = _controllerHHQ1.text;
                        hardHistoryQuestions[1] = _controllerHHQ2.text;
                        hardHistoryQuestions[2] = _controllerHHQ3.text;
                        hardHistoryQuestions[3] = _controllerHHQ4.text;
                        hardHistoryQuestions[4] = _controllerHHQ5.text;
                        hardHistoryQuestions[5] = _controllerHHQ6.text;
                        hardHistoryQuestions[6] = _controllerHHQ7.text;
                        hardHistoryQuestions[7] = _controllerHHQ8.text;
                        hardHistoryQuestions[8] = _controllerHHQ9.text;
                        hardHistoryQuestions[9] = _controllerHHQ10.text;
                        String jsonStringEG =
                            jsonEncode(easyGeographyQuestions);
                        String jsonStringHG =
                            jsonEncode(hardGeographyQuestions);
                        String jsonStringEH = jsonEncode(easyHistoryQuestions);
                        String jsonStringHH = jsonEncode(hardHistoryQuestions);
                        int i = await _dbHelper.insertCountry(
                            _controllerName.text,
                            _controllerLessonGeography.text,
                            _controllerLessonHistory.text,
                            jsonStringEG,
                            jsonStringHG,
                            jsonStringEH,
                            jsonStringHH);
                        setState(() {
                          _controllerName.clear();
                          _controllerLessonGeography.clear();
                          _controllerLessonHistory.clear();
                          _controllerGEQ1.clear();
                          _controllerGEQ2.clear();
                          _controllerGEQ3.clear();
                          _controllerGEQ4.clear();
                          _controllerGEQ5.clear();
                          _controllerGEQ6.clear();
                          _controllerGEQ7.clear();
                          _controllerGEQ8.clear();
                          _controllerGEQ9.clear();
                          _controllerGEQ10.clear();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 102, 102, 255)),
                      child: const Center(
                        child: Text("Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

// ignore: must_be_immutable
class NewQuestion extends StatefulWidget {
  int index;
  List<int> answers;
  var q1 = TextEditingController();
  var q2 = TextEditingController();
  var q3 = TextEditingController();
  var q4 = TextEditingController();
  var q5 = TextEditingController();
  var q6 = TextEditingController();
  var q7 = TextEditingController();
  var q8 = TextEditingController();
  var q9 = TextEditingController();
  var q10 = TextEditingController();

  NewQuestion({
    super.key,
    required this.answers,
    required this.index,
    required this.q1,
    required this.q2,
    required this.q3,
    required this.q4,
    required this.q5,
    required this.q6,
    required this.q7,
    required this.q8,
    required this.q9,
    required this.q10,
  });

  @override
  // ignore: no_logic_in_create_state
  State<NewQuestion> createState() => _NewQuestionState(
      answers: answers,
      index: index,
      q1: q1,
      q2: q2,
      q3: q3,
      q4: q4,
      q5: q5,
      q6: q6,
      q7: q7,
      q8: q8,
      q9: q9,
      q10: q10);
}

class _NewQuestionState extends State<NewQuestion> {
  int index;
  var q1 = TextEditingController();
  var q2 = TextEditingController();
  var q3 = TextEditingController();
  var q4 = TextEditingController();
  var q5 = TextEditingController();
  var q6 = TextEditingController();
  var q7 = TextEditingController();
  var q8 = TextEditingController();
  var q9 = TextEditingController();
  var q10 = TextEditingController();
  List<int> answers;
  _NewQuestionState({
    required this.answers,
    required this.index,
    required this.q1,
    required this.q2,
    required this.q3,
    required this.q4,
    required this.q5,
    required this.q6,
    required this.q7,
    required this.q8,
    required this.q9,
    required this.q10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          children: [
            Text(
              "Question ${widget.index}",
              style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Textfield(
            height: 58,
            text: "Question",
            controller: index == 0
                ? q1
                : index == 1
                    ? q2
                    : index == 3
                        ? q3
                        : index == 4
                            ? q4
                            : index == 5
                                ? q5
                                : index == 6
                                    ? q6
                                    : index == 7
                                        ? q7
                                        : index == 8
                                            ? q8
                                            : index == 9
                                                ? q9
                                                : q10),
        const SizedBox(height: 20),
        Textfield(height: 58, text: "Answer 1"),
        const SizedBox(height: 10),
        Textfield(height: 58, text: "Answer 2"),
        const SizedBox(height: 10),
        Textfield(height: 58, text: "Answer 3"),
        const SizedBox(height: 10),
        Textfield(height: 58, text: "Answer 4"),
        const SizedBox(height: 15),
        SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        answers[index] == 1 ? Colors.green : Colors.red,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                    ),
                  ),
                  child: Icon(
                    answers[index] == 1 ? Icons.check : Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      answers[widget.index] = 1;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        answers[widget.index] == 2 ? Colors.green : Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Icon(
                    answers[widget.index] == 2 ? Icons.check : Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      answers[widget.index] = 2;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        answers[widget.index] == 3 ? Colors.green : Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Icon(
                    answers[widget.index] == 3 ? Icons.check : Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      answers[widget.index] = 3;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        answers[widget.index] == 4 ? Colors.green : Colors.red,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                  ),
                  child: Icon(
                    answers[widget.index] == 4 ? Icons.check : Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      answers[widget.index] = 4;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.primary,
          thickness: 3,
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class Textfield extends StatelessWidget {
  double? height;
  String? text;
  TextEditingController? controller;
  Textfield({super.key, this.height, this.text, this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        cursorColor: Colors.white,
        maxLength: 50,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary, width: 1.0),
          ),
          labelText: text,
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          counterText: '',
        ),
      ),
    );
  }
}
