import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:patrocle/Database/database_helper.dart';
import 'package:patrocle/Homepage/add_test_page.dart';
import '../Components/level_tile.dart';
import '../Theme/translations.dart';
import 'add_test.dart';

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  int color = 0, admin = 0, language = 2;
  final _dbHelper = DatabaseHelper.instance;
  Map<int?, Map<String?, String?>> translation = Translations().translation;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    _dbHelper.queryProfile().then((results) {
      if (results.isNotEmpty) {
        setState(() {
          admin = results.first['admin'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      Lottie.asset('assets/patrocle.json',
                          frameRate: FrameRate.max, height: 120),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Text(
                        "${translation[language]!["Levels"]}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
              ),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: _dbHelper.queryAllRows(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        color = (index + 1) % 3;
                        if(snapshot.data![index]
                              ['doesExist']==0) {
                          return LevelTile(
                          colorIndex: color,
                          country: snapshot.data![index]['name'],
                          lessonGeography: snapshot.data![index]
                              ['lesson_geography'],
                          lessonHistory: snapshot.data![index]
                              ['lesson_history'],
                          jsonStringEG: snapshot.data![index]
                              ['questionsGeographyEasy'],
                          jsonStringHG: snapshot.data![index]
                              ['questionsGeographyHard'],
                          jsonStringEH: snapshot.data![index]
                              ['questionsHistoryEasy'],
                          jsonStringHH: snapshot.data![index]
                              ['questionsHistoryHard'],
                          EGA1: snapshot.data![index]['answersGeographyEasyQ1'],
                          EGA2: snapshot.data![index]['answersGeographyEasyQ2'],
                          EGA3: snapshot.data![index]['answersGeographyEasyQ3'],
                          EGA4: snapshot.data![index]['answersGeographyEasyQ4'],
                          HGA1: snapshot.data![index]['answersGeographyHardQ1'],
                          HGA2: snapshot.data![index]['answersGeographyHardQ2'],
                          HGA3: snapshot.data![index]['answersGeographyHardQ3'],
                          HGA4: snapshot.data![index]['answersGeographyHardQ4'],
                          EHA1: snapshot.data![index]['answersHistoryEasyQ1'],
                          EHA2: snapshot.data![index]['answersHistoryEasyQ2'],
                          EHA3: snapshot.data![index]['answersHistoryEasyQ3'],
                          EHA4: snapshot.data![index]['answersHistoryEasyQ4'],
                          HHA1: snapshot.data![index]['answersHistoryHardQ1'],
                          HHA2: snapshot.data![index]['answersHistoryHardQ2'],
                          HHA3: snapshot.data![index]['answersHistoryHardQ3'],
                          HHA4: snapshot.data![index]['answersHistoryHardQ4'],
                          EGA: snapshot.data![index]
                              ['answersGeographyEasyCorrect'],
                          HGA: snapshot.data![index]
                              ['answersGeographyHardCorrect'],
                          EHA: snapshot.data![index]
                              ['answersHistoryEasyCorrect'],
                          HHA: snapshot.data![index]
                              ['answersHistoryHardCorrect'],
                          geography_completed: snapshot.data![index]
                              ['geography_completed'],
                          history_completed: snapshot.data![index]
                              ['history_completed'],
                        );
                        }
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                },
              ),
              admin == 1
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Column(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 3,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 190,
                              width: double.infinity,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 79, 79, 79),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: Image.asset(
                                                    'assets/flags/addFlag.png',
                                                    height: 100,
                                                  )),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "${translation[language]!["Create your test!"]}",
                                                  style: const TextStyle(
                                                      shadows: <Shadow>[
                                                        Shadow(
                                                          offset:
                                                              Offset(3.0, 3.0),
                                                          blurRadius: 3.0,
                                                          color: Color.fromARGB(
                                                              125, 0, 0, 0),
                                                        ),
                                                        Shadow(
                                                          offset:
                                                              Offset(3.0, 3.0),
                                                          blurRadius: 3.0,
                                                          color: Color.fromARGB(
                                                              0, 0, 0, 255),
                                                        ),
                                                      ],
                                                      color: Colors.white,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          child: const AddTest(),
                                          type: PageTransitionType.bottomToTop,
                                          duration:
                                              const Duration(milliseconds: 400),
                                        ),
                                      ).then((_) => setState(() {}));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 63, 255, 38),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(0),
                                          bottomLeft: Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 20.0),
                                      child: Text(
                                        "${translation[language]!["Add"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),
                                
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          child: const AddTestPage(),
                                          type: PageTransitionType.bottomToTop,
                                          duration:
                                              const Duration(milliseconds: 400),
                                        ),
                                      ).then((_) => setState(() {}));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 255, 55, 55),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(0),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 20.0),
                                      child: Text(
                                        "${translation[language]!["Update"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ]),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ]),
          ),
        ));
  }
}
