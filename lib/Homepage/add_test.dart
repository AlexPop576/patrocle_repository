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

  List<String> easyGeographyQuestions = [],
      hardGeographyQuestions = [],
      easyHistoryQuestions = [],
      hardHistoryQuestions = [];
  List<String> easyGeographyA1 = [],
      hardGeographyA1 = [],
      easyHistoryA1 = [],
      hardHistoryA1 = [];
  List<String> easyGeographyA2 = [],
      hardGeographyA2 = [],
      easyHistoryA2 = [],
      hardHistoryA2 = [];
  List<String> easyGeographyA3 = [],
      hardGeographyA3 = [],
      easyHistoryA3 = [],
      hardHistoryA3 = [];
  List<String> easyGeographyA4 = [],
      hardGeographyA4 = [],
      easyHistoryA4 = [],
      hardHistoryA4 = [];

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

  final _controllerGEQ1A1 = TextEditingController(),
      _controllerGEQ2A1 = TextEditingController(),
      _controllerGEQ3A1 = TextEditingController(),
      _controllerGEQ4A1 = TextEditingController(),
      _controllerGEQ5A1 = TextEditingController(),
      _controllerGEQ6A1 = TextEditingController(),
      _controllerGEQ7A1 = TextEditingController(),
      _controllerGEQ8A1 = TextEditingController(),
      _controllerGEQ9A1 = TextEditingController(),
      _controllerGEQ10A1 = TextEditingController();
  final _controllerGHQ1A1 = TextEditingController(),
      _controllerGHQ2A1 = TextEditingController(),
      _controllerGHQ3A1 = TextEditingController(),
      _controllerGHQ4A1 = TextEditingController(),
      _controllerGHQ5A1 = TextEditingController(),
      _controllerGHQ6A1 = TextEditingController(),
      _controllerGHQ7A1 = TextEditingController(),
      _controllerGHQ8A1 = TextEditingController(),
      _controllerGHQ9A1 = TextEditingController(),
      _controllerGHQ10A1 = TextEditingController();
  final _controllerHEQ1A1 = TextEditingController(),
      _controllerHEQ2A1 = TextEditingController(),
      _controllerHEQ3A1 = TextEditingController(),
      _controllerHEQ4A1 = TextEditingController(),
      _controllerHEQ5A1 = TextEditingController(),
      _controllerHEQ6A1 = TextEditingController(),
      _controllerHEQ7A1 = TextEditingController(),
      _controllerHEQ8A1 = TextEditingController(),
      _controllerHEQ9A1 = TextEditingController(),
      _controllerHEQ10A1 = TextEditingController();
  final _controllerHHQ1A1 = TextEditingController(),
      _controllerHHQ2A1 = TextEditingController(),
      _controllerHHQ3A1 = TextEditingController(),
      _controllerHHQ4A1 = TextEditingController(),
      _controllerHHQ5A1 = TextEditingController(),
      _controllerHHQ6A1 = TextEditingController(),
      _controllerHHQ7A1 = TextEditingController(),
      _controllerHHQ8A1 = TextEditingController(),
      _controllerHHQ9A1 = TextEditingController(),
      _controllerHHQ10A1 = TextEditingController();

  final _controllerGEQ1A2 = TextEditingController(),
      _controllerGEQ2A2 = TextEditingController(),
      _controllerGEQ3A2 = TextEditingController(),
      _controllerGEQ4A2 = TextEditingController(),
      _controllerGEQ5A2 = TextEditingController(),
      _controllerGEQ6A2 = TextEditingController(),
      _controllerGEQ7A2 = TextEditingController(),
      _controllerGEQ8A2 = TextEditingController(),
      _controllerGEQ9A2 = TextEditingController(),
      _controllerGEQ10A2 = TextEditingController();
  final _controllerGHQ1A2 = TextEditingController(),
      _controllerGHQ2A2 = TextEditingController(),
      _controllerGHQ3A2 = TextEditingController(),
      _controllerGHQ4A2 = TextEditingController(),
      _controllerGHQ5A2 = TextEditingController(),
      _controllerGHQ6A2 = TextEditingController(),
      _controllerGHQ7A2 = TextEditingController(),
      _controllerGHQ8A2 = TextEditingController(),
      _controllerGHQ9A2 = TextEditingController(),
      _controllerGHQ10A2 = TextEditingController();
  final _controllerHEQ1A2 = TextEditingController(),
      _controllerHEQ2A2 = TextEditingController(),
      _controllerHEQ3A2 = TextEditingController(),
      _controllerHEQ4A2 = TextEditingController(),
      _controllerHEQ5A2 = TextEditingController(),
      _controllerHEQ6A2 = TextEditingController(),
      _controllerHEQ7A2 = TextEditingController(),
      _controllerHEQ8A2 = TextEditingController(),
      _controllerHEQ9A2 = TextEditingController(),
      _controllerHEQ10A2 = TextEditingController();
  final _controllerHHQ1A2 = TextEditingController(),
      _controllerHHQ2A2 = TextEditingController(),
      _controllerHHQ3A2 = TextEditingController(),
      _controllerHHQ4A2 = TextEditingController(),
      _controllerHHQ5A2 = TextEditingController(),
      _controllerHHQ6A2 = TextEditingController(),
      _controllerHHQ7A2 = TextEditingController(),
      _controllerHHQ8A2 = TextEditingController(),
      _controllerHHQ9A2 = TextEditingController(),
      _controllerHHQ10A2 = TextEditingController();

  final _controllerGEQ1A3 = TextEditingController(),
      _controllerGEQ2A3 = TextEditingController(),
      _controllerGEQ3A3 = TextEditingController(),
      _controllerGEQ4A3 = TextEditingController(),
      _controllerGEQ5A3 = TextEditingController(),
      _controllerGEQ6A3 = TextEditingController(),
      _controllerGEQ7A3 = TextEditingController(),
      _controllerGEQ8A3 = TextEditingController(),
      _controllerGEQ9A3 = TextEditingController(),
      _controllerGEQ10A3 = TextEditingController();
  final _controllerGHQ1A3 = TextEditingController(),
      _controllerGHQ2A3 = TextEditingController(),
      _controllerGHQ3A3 = TextEditingController(),
      _controllerGHQ4A3 = TextEditingController(),
      _controllerGHQ5A3 = TextEditingController(),
      _controllerGHQ6A3 = TextEditingController(),
      _controllerGHQ7A3 = TextEditingController(),
      _controllerGHQ8A3 = TextEditingController(),
      _controllerGHQ9A3 = TextEditingController(),
      _controllerGHQ10A3 = TextEditingController();
  final _controllerHEQ1A3 = TextEditingController(),
      _controllerHEQ2A3 = TextEditingController(),
      _controllerHEQ3A3 = TextEditingController(),
      _controllerHEQ4A3 = TextEditingController(),
      _controllerHEQ5A3 = TextEditingController(),
      _controllerHEQ6A3 = TextEditingController(),
      _controllerHEQ7A3 = TextEditingController(),
      _controllerHEQ8A3 = TextEditingController(),
      _controllerHEQ9A3 = TextEditingController(),
      _controllerHEQ10A3 = TextEditingController();
  final _controllerHHQ1A3 = TextEditingController(),
      _controllerHHQ2A3 = TextEditingController(),
      _controllerHHQ3A3 = TextEditingController(),
      _controllerHHQ4A3 = TextEditingController(),
      _controllerHHQ5A3 = TextEditingController(),
      _controllerHHQ6A3 = TextEditingController(),
      _controllerHHQ7A3 = TextEditingController(),
      _controllerHHQ8A3 = TextEditingController(),
      _controllerHHQ9A3 = TextEditingController(),
      _controllerHHQ10A3 = TextEditingController();
  final _controllerGEQ1A4 = TextEditingController(),
      _controllerGEQ2A4 = TextEditingController(),
      _controllerGEQ3A4 = TextEditingController(),
      _controllerGEQ4A4 = TextEditingController(),
      _controllerGEQ5A4 = TextEditingController(),
      _controllerGEQ6A4 = TextEditingController(),
      _controllerGEQ7A4 = TextEditingController(),
      _controllerGEQ8A4 = TextEditingController(),
      _controllerGEQ9A4 = TextEditingController(),
      _controllerGEQ10A4 = TextEditingController();
  final _controllerGHQ1A4 = TextEditingController(),
      _controllerGHQ2A4 = TextEditingController(),
      _controllerGHQ3A4 = TextEditingController(),
      _controllerGHQ4A4 = TextEditingController(),
      _controllerGHQ5A4 = TextEditingController(),
      _controllerGHQ6A4 = TextEditingController(),
      _controllerGHQ7A4 = TextEditingController(),
      _controllerGHQ8A4 = TextEditingController(),
      _controllerGHQ9A4 = TextEditingController(),
      _controllerGHQ10A4 = TextEditingController();
  final _controllerHEQ1A4 = TextEditingController(),
      _controllerHEQ2A4 = TextEditingController(),
      _controllerHEQ3A4 = TextEditingController(),
      _controllerHEQ4A4 = TextEditingController(),
      _controllerHEQ5A4 = TextEditingController(),
      _controllerHEQ6A4 = TextEditingController(),
      _controllerHEQ7A4 = TextEditingController(),
      _controllerHEQ8A4 = TextEditingController(),
      _controllerHEQ9A4 = TextEditingController(),
      _controllerHEQ10A4 = TextEditingController();
  final _controllerHHQ1A4 = TextEditingController(),
      _controllerHHQ2A4 = TextEditingController(),
      _controllerHHQ3A4 = TextEditingController(),
      _controllerHHQ4A4 = TextEditingController(),
      _controllerHHQ5A4 = TextEditingController(),
      _controllerHHQ6A4 = TextEditingController(),
      _controllerHHQ7A4 = TextEditingController(),
      _controllerHHQ8A4 = TextEditingController(),
      _controllerHHQ9A4 = TextEditingController(),
      _controllerHHQ10A4 = TextEditingController();

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
                                    Lottie.asset('assets/patrocle.json',
                                        frameRate: FrameRate.max, height: 100),
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
          const SliverToBoxAdapter(
            child: Column(children: [
              Text(
                "Easy geography questions",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
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
                q1a1: _controllerGEQ1A1,
                q2a1: _controllerGEQ2A1,
                q3a1: _controllerGEQ3A1,
                q4a1: _controllerGEQ4A1,
                q5a1: _controllerGEQ5A1,
                q6a1: _controllerGEQ6A1,
                q7a1: _controllerGEQ7A1,
                q8a1: _controllerGEQ8A1,
                q9a1: _controllerGEQ9A1,
                q10a1: _controllerGEQ10A1,
                q1a2: _controllerGEQ1A2,
                q2a2: _controllerGEQ2A2,
                q3a2: _controllerGEQ3A2,
                q4a2: _controllerGEQ4A2,
                q5a2: _controllerGEQ5A2,
                q6a2: _controllerGEQ6A2,
                q7a2: _controllerGEQ7A2,
                q8a2: _controllerGEQ8A2,
                q9a2: _controllerGEQ9A2,
                q10a2: _controllerGEQ10A2,
                q1a3: _controllerGEQ1A3,
                q2a3: _controllerGEQ2A3,
                q3a3: _controllerGEQ3A3,
                q4a3: _controllerGEQ4A3,
                q5a3: _controllerGEQ5A3,
                q6a3: _controllerGEQ6A3,
                q7a3: _controllerGEQ7A3,
                q8a3: _controllerGEQ8A3,
                q9a3: _controllerGEQ9A3,
                q10a3: _controllerGEQ10A3,
                q1a4: _controllerGEQ1A4,
                q2a4: _controllerGEQ2A4,
                q3a4: _controllerGEQ3A4,
                q4a4: _controllerGEQ4A4,
                q5a4: _controllerGEQ5A4,
                q6a4: _controllerGEQ6A4,
                q7a4: _controllerGEQ7A4,
                q8a4: _controllerGEQ8A4,
                q9a4: _controllerGEQ9A4,
                q10a4: _controllerGEQ10A4,
              );
            }, childCount: 10),
          ),
          const SliverToBoxAdapter(
            child: Column(children: [
              Text(
                "Hard geography questions",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
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
                q1a1: _controllerGHQ1A1,
                q2a1: _controllerGHQ2A1,
                q3a1: _controllerGHQ3A1,
                q4a1: _controllerGHQ4A1,
                q5a1: _controllerGHQ5A1,
                q6a1: _controllerGHQ6A1,
                q7a1: _controllerGHQ7A1,
                q8a1: _controllerGHQ8A1,
                q9a1: _controllerGHQ9A1,
                q10a1: _controllerGHQ10A1,
                q1a2: _controllerGHQ1A2,
                q2a2: _controllerGHQ2A2,
                q3a2: _controllerGHQ3A2,
                q4a2: _controllerGHQ4A2,
                q5a2: _controllerGHQ5A2,
                q6a2: _controllerGHQ6A2,
                q7a2: _controllerGHQ7A2,
                q8a2: _controllerGHQ8A2,
                q9a2: _controllerGHQ9A2,
                q10a2: _controllerGHQ10A2,
                q1a3: _controllerGHQ1A3,
                q2a3: _controllerGHQ2A3,
                q3a3: _controllerGHQ3A3,
                q4a3: _controllerGHQ4A3,
                q5a3: _controllerGHQ5A3,
                q6a3: _controllerGHQ6A3,
                q7a3: _controllerGHQ7A3,
                q8a3: _controllerGHQ8A3,
                q9a3: _controllerGHQ9A3,
                q10a3: _controllerGHQ10A3,
                q1a4: _controllerGHQ1A4,
                q2a4: _controllerGHQ2A4,
                q3a4: _controllerGHQ3A4,
                q4a4: _controllerGHQ4A4,
                q5a4: _controllerGHQ5A4,
                q6a4: _controllerGHQ6A4,
                q7a4: _controllerGHQ7A4,
                q8a4: _controllerGHQ8A4,
                q9a4: _controllerGHQ9A4,
                q10a4: _controllerGHQ10A4,
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
          const SliverToBoxAdapter(
            child: Column(children: [
              Text(
                "Easy history questions",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
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
                q1a1: _controllerHEQ1A1,
                q2a1: _controllerHEQ2A1,
                q3a1: _controllerHEQ3A1,
                q4a1: _controllerHEQ4A1,
                q5a1: _controllerHEQ5A1,
                q6a1: _controllerHEQ6A1,
                q7a1: _controllerHEQ7A1,
                q8a1: _controllerHEQ8A1,
                q9a1: _controllerHEQ9A1,
                q10a1: _controllerHEQ10A1,
                q1a2: _controllerHEQ1A2,
                q2a2: _controllerHEQ2A2,
                q3a2: _controllerHEQ3A2,
                q4a2: _controllerHEQ4A2,
                q5a2: _controllerHEQ5A2,
                q6a2: _controllerHEQ6A2,
                q7a2: _controllerHEQ7A2,
                q8a2: _controllerHEQ8A2,
                q9a2: _controllerHEQ9A2,
                q10a2: _controllerHEQ10A2,
                q1a3: _controllerHEQ1A3,
                q2a3: _controllerHEQ2A3,
                q3a3: _controllerHEQ3A3,
                q4a3: _controllerHEQ4A3,
                q5a3: _controllerHEQ5A3,
                q6a3: _controllerHEQ6A3,
                q7a3: _controllerHEQ7A3,
                q8a3: _controllerHEQ8A3,
                q9a3: _controllerHEQ9A3,
                q10a3: _controllerHEQ10A3,
                q1a4: _controllerHEQ1A4,
                q2a4: _controllerHEQ2A4,
                q3a4: _controllerHEQ3A4,
                q4a4: _controllerHEQ4A4,
                q5a4: _controllerHEQ5A4,
                q6a4: _controllerHEQ6A4,
                q7a4: _controllerHEQ7A4,
                q8a4: _controllerHEQ8A4,
                q9a4: _controllerHEQ9A4,
                q10a4: _controllerHEQ10A4,
              );
            }, childCount: 10),
          ),
          const SliverToBoxAdapter(
            child: Column(children: [
              Text(
                "Hard history questions",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
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
                q1a1: _controllerHHQ1A1,
                q2a1: _controllerHHQ2A1,
                q3a1: _controllerHHQ3A1,
                q4a1: _controllerHHQ4A1,
                q5a1: _controllerHHQ5A1,
                q6a1: _controllerHHQ6A1,
                q7a1: _controllerHHQ7A1,
                q8a1: _controllerHHQ8A1,
                q9a1: _controllerHHQ9A1,
                q10a1: _controllerHHQ10A1,
                q1a2: _controllerHHQ1A2,
                q2a2: _controllerHHQ2A2,
                q3a2: _controllerHHQ3A2,
                q4a2: _controllerHHQ4A2,
                q5a2: _controllerHHQ5A2,
                q6a2: _controllerHHQ6A2,
                q7a2: _controllerHHQ7A2,
                q8a2: _controllerHHQ8A2,
                q9a2: _controllerHHQ9A2,
                q10a2: _controllerHHQ10A2,
                q1a3: _controllerHHQ1A3,
                q2a3: _controllerHHQ2A3,
                q3a3: _controllerHHQ3A3,
                q4a3: _controllerHHQ4A3,
                q5a3: _controllerHHQ5A3,
                q6a3: _controllerHHQ6A3,
                q7a3: _controllerHHQ7A3,
                q8a3: _controllerHHQ8A3,
                q9a3: _controllerHHQ9A3,
                q10a3: _controllerHHQ10A3,
                q1a4: _controllerHHQ1A4,
                q2a4: _controllerHHQ2A4,
                q3a4: _controllerHHQ3A4,
                q4a4: _controllerHHQ4A4,
                q5a4: _controllerHHQ5A4,
                q6a4: _controllerHHQ6A4,
                q7a4: _controllerHHQ7A4,
                q8a4: _controllerHHQ8A4,
                q9a4: _controllerHHQ9A4,
                q10a4: _controllerHHQ10A4,
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
                        String jsonStringEG = jsonEncode([
                          _controllerGEQ1.text,
                          _controllerGEQ2.text,
                          _controllerGEQ3.text,
                          _controllerGEQ4.text,
                          _controllerGEQ5.text,
                          _controllerGEQ6.text,
                          _controllerGEQ7.text,
                          _controllerGEQ8.text,
                          _controllerGEQ9.text,
                          _controllerGEQ10.text
                        ]);
                        String jsonStringHG = jsonEncode([
                          _controllerGHQ1.text,
                          _controllerGHQ2.text,
                          _controllerGHQ3.text,
                          _controllerGHQ4.text,
                          _controllerGHQ5.text,
                          _controllerGHQ6.text,
                          _controllerGHQ7.text,
                          _controllerGHQ8.text,
                          _controllerGHQ9.text,
                          _controllerGHQ10.text
                        ]);
                        String jsonStringEH = jsonEncode([
                          _controllerHEQ1.text,
                          _controllerHEQ2.text,
                          _controllerHEQ3.text,
                          _controllerHEQ4.text,
                          _controllerHEQ5.text,
                          _controllerHEQ6.text,
                          _controllerHEQ7.text,
                          _controllerHEQ8.text,
                          _controllerHEQ9.text,
                          _controllerHEQ10.text
                        ]);
                        String jsonStringHH = jsonEncode([
                          _controllerHHQ1.text,
                          _controllerHHQ2.text,
                          _controllerHHQ3.text,
                          _controllerHHQ4.text,
                          _controllerHHQ5.text,
                          _controllerHHQ6.text,
                          _controllerHHQ7.text,
                          _controllerHHQ8.text,
                          _controllerHHQ9.text,
                          _controllerHHQ10.text
                        ]);
                        String jsonStringEGA1 = jsonEncode([
                          _controllerGEQ1A1.text,
                          _controllerGEQ2A1.text,
                          _controllerGEQ3A1.text,
                          _controllerGEQ4A1.text,
                          _controllerGEQ5A1.text,
                          _controllerGEQ6A1.text,
                          _controllerGEQ7A1.text,
                          _controllerGEQ8A1.text,
                          _controllerGEQ9A1.text,
                          _controllerGEQ10A1.text
                        ]);
                        String jsonStringHGA1 = jsonEncode([
                          _controllerGHQ1A1.text,
                          _controllerGHQ2A1.text,
                          _controllerGHQ3A1.text,
                          _controllerGHQ4A1.text,
                          _controllerGHQ5A1.text,
                          _controllerGHQ6A1.text,
                          _controllerGHQ7A1.text,
                          _controllerGHQ8A1.text,
                          _controllerGHQ9A1.text,
                          _controllerGHQ10A1.text
                        ]);
                        String jsonStringEHA1 = jsonEncode([
                          _controllerHEQ1A1.text,
                          _controllerHEQ2A1.text,
                          _controllerHEQ3A1.text,
                          _controllerHEQ4A1.text,
                          _controllerHEQ5A1.text,
                          _controllerHEQ6A1.text,
                          _controllerHEQ7A1.text,
                          _controllerHEQ8A1.text,
                          _controllerHEQ9A1.text,
                          _controllerHEQ10A1.text
                        ]);
                        String jsonStringHHA1 = jsonEncode([
                          _controllerHHQ1A1.text,
                          _controllerHHQ2A1.text,
                          _controllerHHQ3A1.text,
                          _controllerHHQ4A1.text,
                          _controllerHHQ5A1.text,
                          _controllerHHQ6A1.text,
                          _controllerHHQ7A1.text,
                          _controllerHHQ8A1.text,
                          _controllerHHQ9A1.text,
                          _controllerHHQ10A1.text
                        ]);
                        String jsonStringEGA2 = jsonEncode([
                          _controllerGEQ1A2.text,
                          _controllerGEQ2A2.text,
                          _controllerGEQ3A2.text,
                          _controllerGEQ4A2.text,
                          _controllerGEQ5A2.text,
                          _controllerGEQ6A2.text,
                          _controllerGEQ7A2.text,
                          _controllerGEQ8A2.text,
                          _controllerGEQ9A2.text,
                          _controllerGEQ10A2.text
                        ]);
                        String jsonStringHGA2 = jsonEncode([
                          _controllerGHQ1A2.text,
                          _controllerGHQ2A2.text,
                          _controllerGHQ3A2.text,
                          _controllerGHQ4A2.text,
                          _controllerGHQ5A2.text,
                          _controllerGHQ6A2.text,
                          _controllerGHQ7A2.text,
                          _controllerGHQ8A2.text,
                          _controllerGHQ9A2.text,
                          _controllerGHQ10A2.text
                        ]);
                        String jsonStringEHA2 = jsonEncode([
                          _controllerHEQ1A2.text,
                          _controllerHEQ2A2.text,
                          _controllerHEQ3A2.text,
                          _controllerHEQ4A2.text,
                          _controllerHEQ5A2.text,
                          _controllerHEQ6A2.text,
                          _controllerHEQ7A2.text,
                          _controllerHEQ8A2.text,
                          _controllerHEQ9A2.text,
                          _controllerHEQ10A2.text
                        ]);
                        String jsonStringHHA2 = jsonEncode([
                          _controllerHHQ1A2.text,
                          _controllerHHQ2A2.text,
                          _controllerHHQ3A2.text,
                          _controllerHHQ4A2.text,
                          _controllerHHQ5A2.text,
                          _controllerHHQ6A2.text,
                          _controllerHHQ7A2.text,
                          _controllerHHQ8A2.text,
                          _controllerHHQ9A2.text,
                          _controllerHHQ10A2.text
                        ]);
                        String jsonStringEGA3 = jsonEncode([
                          _controllerGEQ1A3.text,
                          _controllerGEQ2A3.text,
                          _controllerGEQ3A3.text,
                          _controllerGEQ4A3.text,
                          _controllerGEQ5A3.text,
                          _controllerGEQ6A3.text,
                          _controllerGEQ7A3.text,
                          _controllerGEQ8A3.text,
                          _controllerGEQ9A3.text,
                          _controllerGEQ10A3.text
                        ]);
                        String jsonStringHGA3 = jsonEncode([
                          _controllerGHQ1A3.text,
                          _controllerGHQ2A3.text,
                          _controllerGHQ3A3.text,
                          _controllerGHQ4A3.text,
                          _controllerGHQ5A3.text,
                          _controllerGHQ6A3.text,
                          _controllerGHQ7A3.text,
                          _controllerGHQ8A3.text,
                          _controllerGHQ9A3.text,
                          _controllerGHQ10A3.text
                        ]);
                        String jsonStringEHA3 = jsonEncode([
                          _controllerHEQ1A3.text,
                          _controllerHEQ2A3.text,
                          _controllerHEQ3A3.text,
                          _controllerHEQ4A3.text,
                          _controllerHEQ5A3.text,
                          _controllerHEQ6A3.text,
                          _controllerHEQ7A3.text,
                          _controllerHEQ8A3.text,
                          _controllerHEQ9A3.text,
                          _controllerHEQ10A3.text
                        ]);
                        String jsonStringHHA3 = jsonEncode([
                          _controllerHHQ1A3.text,
                          _controllerHHQ2A3.text,
                          _controllerHHQ3A3.text,
                          _controllerHHQ4A3.text,
                          _controllerHHQ5A3.text,
                          _controllerHHQ6A3.text,
                          _controllerHHQ7A3.text,
                          _controllerHHQ8A3.text,
                          _controllerHHQ9A3.text,
                          _controllerHHQ10A3.text
                        ]);
                        String jsonStringEGA4 = jsonEncode([
                          _controllerGEQ1A4.text,
                          _controllerGEQ2A4.text,
                          _controllerGEQ3A4.text,
                          _controllerGEQ4A4.text,
                          _controllerGEQ5A4.text,
                          _controllerGEQ6A4.text,
                          _controllerGEQ7A4.text,
                          _controllerGEQ8A4.text,
                          _controllerGEQ9A4.text,
                          _controllerGEQ10A4.text
                        ]);
                        String jsonStringHGA4 = jsonEncode([
                          _controllerGHQ1A4.text,
                          _controllerGHQ2A4.text,
                          _controllerGHQ3A4.text,
                          _controllerGHQ4A4.text,
                          _controllerGHQ5A4.text,
                          _controllerGHQ6A4.text,
                          _controllerGHQ7A4.text,
                          _controllerGHQ8A4.text,
                          _controllerGHQ9A4.text,
                          _controllerGHQ10A4.text
                        ]);
                        String jsonStringEHA4 = jsonEncode([
                          _controllerHEQ1A4.text,
                          _controllerHEQ2A4.text,
                          _controllerHEQ3A4.text,
                          _controllerHEQ4A4.text,
                          _controllerHEQ5A4.text,
                          _controllerHEQ6A4.text,
                          _controllerHEQ7A4.text,
                          _controllerHEQ8A4.text,
                          _controllerHEQ9A4.text,
                          _controllerHEQ10A4.text
                        ]);
                        String jsonStringHHA4 = jsonEncode([
                          _controllerHHQ1A4.text,
                          _controllerHHQ2A4.text,
                          _controllerHHQ3A4.text,
                          _controllerHHQ4A4.text,
                          _controllerHHQ5A4.text,
                          _controllerHHQ6A4.text,
                          _controllerHHQ7A4.text,
                          _controllerHHQ8A4.text,
                          _controllerHHQ9A4.text,
                          _controllerHHQ10A4.text
                        ]);
                        String answersGeographyEasyCorrect = jsonEncode(answersGeographyEasy);
                        String answersGeographyHardCorrect = jsonEncode(answersGeographyHard);
                        String answersHistoryEasyCorrect = jsonEncode(answersHistoryEasy);
                        String answersHistoryHardCorrect = jsonEncode(answersHistoryHard);
                        int i = await _dbHelper.insertCountry(
                          _controllerName.text,
                          _controllerLessonGeography.text,
                          _controllerLessonHistory.text,
                          jsonStringEG,
                          jsonStringHG,
                          jsonStringEH,
                          jsonStringHH,
                          jsonStringEGA1,
                          jsonStringEGA2,
                          jsonStringEGA3,
                          jsonStringEGA4,
                          jsonStringHGA1,
                          jsonStringHGA2,
                          jsonStringHGA3,
                          jsonStringHGA4,
                          jsonStringEHA1,
                          jsonStringEHA2,
                          jsonStringEHA3,
                          jsonStringEHA4,
                          jsonStringHHA1,
                          jsonStringHHA2,
                          jsonStringHHA3,
                          jsonStringHHA4,
                          answersGeographyEasyCorrect,
                          answersGeographyHardCorrect,
                          answersHistoryEasyCorrect,
                          answersHistoryHardCorrect,
                        );
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
  var q1a1 = TextEditingController();
  var q2a1 = TextEditingController();
  var q3a1 = TextEditingController();
  var q4a1 = TextEditingController();
  var q5a1 = TextEditingController();
  var q6a1 = TextEditingController();
  var q7a1 = TextEditingController();
  var q8a1 = TextEditingController();
  var q9a1 = TextEditingController();
  var q10a1 = TextEditingController();
  var q1a2 = TextEditingController();
  var q2a2 = TextEditingController();
  var q3a2 = TextEditingController();
  var q4a2 = TextEditingController();
  var q5a2 = TextEditingController();
  var q6a2 = TextEditingController();
  var q7a2 = TextEditingController();
  var q8a2 = TextEditingController();
  var q9a2 = TextEditingController();
  var q10a2 = TextEditingController();
  var q1a3 = TextEditingController();
  var q2a3 = TextEditingController();
  var q3a3 = TextEditingController();
  var q4a3 = TextEditingController();
  var q5a3 = TextEditingController();
  var q6a3 = TextEditingController();
  var q7a3 = TextEditingController();
  var q8a3 = TextEditingController();
  var q9a3 = TextEditingController();
  var q10a3 = TextEditingController();
  var q1a4 = TextEditingController();
  var q2a4 = TextEditingController();
  var q3a4 = TextEditingController();
  var q4a4 = TextEditingController();
  var q5a4 = TextEditingController();
  var q6a4 = TextEditingController();
  var q7a4 = TextEditingController();
  var q8a4 = TextEditingController();
  var q9a4 = TextEditingController();
  var q10a4 = TextEditingController();

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
    required this.q1a1,
    required this.q2a1,
    required this.q3a1,
    required this.q4a1,
    required this.q5a1,
    required this.q6a1,
    required this.q7a1,
    required this.q8a1,
    required this.q9a1,
    required this.q10a1,
    required this.q1a2,
    required this.q2a2,
    required this.q3a2,
    required this.q4a2,
    required this.q5a2,
    required this.q6a2,
    required this.q7a2,
    required this.q8a2,
    required this.q9a2,
    required this.q10a2,
    required this.q1a3,
    required this.q2a3,
    required this.q3a3,
    required this.q4a3,
    required this.q5a3,
    required this.q6a3,
    required this.q7a3,
    required this.q8a3,
    required this.q9a3,
    required this.q10a3,
    required this.q1a4,
    required this.q2a4,
    required this.q3a4,
    required this.q4a4,
    required this.q5a4,
    required this.q6a4,
    required this.q7a4,
    required this.q8a4,
    required this.q9a4,
    required this.q10a4,
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
        q10: q10,
        q1a1: q1a1,
        q2a1: q2a1,
        q3a1: q3a1,
        q4a1: q4a1,
        q5a1: q5a1,
        q6a1: q6a1,
        q7a1: q7a1,
        q8a1: q8a1,
        q9a1: q9a1,
        q10a1: q10a1,
        q1a2: q1a2,
        q2a2: q2a2,
        q3a2: q3a2,
        q4a2: q4a2,
        q5a2: q5a2,
        q6a2: q6a2,
        q7a2: q7a2,
        q8a2: q8a2,
        q9a2: q9a2,
        q10a2: q10a2,
        q1a3: q1a3,
        q2a3: q2a3,
        q3a3: q3a3,
        q4a3: q4a3,
        q5a3: q5a3,
        q6a3: q6a3,
        q7a3: q7a3,
        q8a3: q8a3,
        q9a3: q9a3,
        q10a3: q10a3,
        q1a4: q1a4,
        q2a4: q2a4,
        q3a4: q3a4,
        q4a4: q4a4,
        q5a4: q5a4,
        q6a4: q6a4,
        q7a4: q7a4,
        q8a4: q8a4,
        q9a4: q9a4,
        q10a4: q10a4,
      );
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
  var q1a1 = TextEditingController();
  var q2a1 = TextEditingController();
  var q3a1 = TextEditingController();
  var q4a1 = TextEditingController();
  var q5a1 = TextEditingController();
  var q6a1 = TextEditingController();
  var q7a1 = TextEditingController();
  var q8a1 = TextEditingController();
  var q9a1 = TextEditingController();
  var q10a1 = TextEditingController();
  var q1a2 = TextEditingController();
  var q2a2 = TextEditingController();
  var q3a2 = TextEditingController();
  var q4a2 = TextEditingController();
  var q5a2 = TextEditingController();
  var q6a2 = TextEditingController();
  var q7a2 = TextEditingController();
  var q8a2 = TextEditingController();
  var q9a2 = TextEditingController();
  var q10a2 = TextEditingController();
  var q1a3 = TextEditingController();
  var q2a3 = TextEditingController();
  var q3a3 = TextEditingController();
  var q4a3 = TextEditingController();
  var q5a3 = TextEditingController();
  var q6a3 = TextEditingController();
  var q7a3 = TextEditingController();
  var q8a3 = TextEditingController();
  var q9a3 = TextEditingController();
  var q10a3 = TextEditingController();
  var q1a4 = TextEditingController();
  var q2a4 = TextEditingController();
  var q3a4 = TextEditingController();
  var q4a4 = TextEditingController();
  var q5a4 = TextEditingController();
  var q6a4 = TextEditingController();
  var q7a4 = TextEditingController();
  var q8a4 = TextEditingController();
  var q9a4 = TextEditingController();
  var q10a4 = TextEditingController();
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
    required this.q1a1,
    required this.q2a1,
    required this.q3a1,
    required this.q4a1,
    required this.q5a1,
    required this.q6a1,
    required this.q7a1,
    required this.q8a1,
    required this.q9a1,
    required this.q10a1,
    required this.q1a2,
    required this.q2a2,
    required this.q3a2,
    required this.q4a2,
    required this.q5a2,
    required this.q6a2,
    required this.q7a2,
    required this.q8a2,
    required this.q9a2,
    required this.q10a2,
    required this.q1a3,
    required this.q2a3,
    required this.q3a3,
    required this.q4a3,
    required this.q5a3,
    required this.q6a3,
    required this.q7a3,
    required this.q8a3,
    required this.q9a3,
    required this.q10a3,
    required this.q1a4,
    required this.q2a4,
    required this.q3a4,
    required this.q4a4,
    required this.q5a4,
    required this.q6a4,
    required this.q7a4,
    required this.q8a4,
    required this.q9a4,
    required this.q10a4,
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
            controller: index == 1
                ? q1
                : index == 2
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
        Textfield(
          height: 58,
          text: "Answer 1",
          controller: index == 1
              ? q1a1
              : index == 2
                  ? q2a1
                  : index == 3
                      ? q3a1
                      : index == 4
                          ? q4a1
                          : index == 5
                              ? q5a1
                              : index == 6
                                  ? q6a1
                                  : index == 7
                                      ? q7a1
                                      : index == 8
                                          ? q8a1
                                          : index == 9
                                              ? q9a1
                                              : q10a1,
        ),
        const SizedBox(height: 10),
        Textfield(
          height: 58,
          text: "Answer 2",
          controller: index == 1
              ? q1a2
              : index == 2
                  ? q2a2
                  : index == 3
                      ? q3a2
                      : index == 4
                          ? q4a2
                          : index == 5
                              ? q5a2
                              : index == 6
                                  ? q6a2
                                  : index == 7
                                      ? q7a2
                                      : index == 8
                                          ? q8a2
                                          : index == 9
                                              ? q9a2
                                              : q10a2,
        ),
        const SizedBox(height: 10),
        Textfield(
          height: 58,
          text: "Answer 3",
          controller: index == 1
              ? q1a3
              : index == 2
                  ? q2a3
                  : index == 3
                      ? q3a3
                      : index == 4
                          ? q4a3
                          : index == 5
                              ? q5a3
                              : index == 6
                                  ? q6a3
                                  : index == 7
                                      ? q7a3
                                      : index == 8
                                          ? q8a3
                                          : index == 9
                                              ? q9a3
                                              : q10a3,
        ),
        const SizedBox(height: 10),
        Textfield(
          height: 58,
          text: "Answer 4",
          controller: index == 1
              ? q1a4
              : index == 2
                  ? q2a4
                  : index == 3
                      ? q3a4
                      : index == 4
                          ? q4a4
                          : index == 5
                              ? q5a4
                              : index == 6
                                  ? q6a4
                                  : index == 7
                                      ? q7a4
                                      : index == 8
                                          ? q8a4
                                          : index == 9
                                              ? q9a4
                                              : q10a4,
        ),
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
        maxLength: 150,
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
