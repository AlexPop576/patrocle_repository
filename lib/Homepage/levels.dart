import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:patrocle/Database/database_helper.dart';
import '../Components/level_tile.dart';
import 'add_test.dart';

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  int color = 0;
  final _dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(//physics: const BouncingScrollPhysics(),
            child: 
            Column(children: [
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
                    "Levels",
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
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                     color = (index + 1) % 3;
                return LevelTile(
                  colorIndex: color,
                  country: snapshot.data![index]['name'],
                  lessonGeography: snapshot.data![index]['lesson_geography'],
                  lessonHistory: snapshot.data![index]['lesson_history'],
                );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
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
                height: 20,
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: SizedBox(
              height: 190,
              width: double.infinity,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 79, 79, 79),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: Image.asset(
                                    'assets/Flags/addFlag.png',
                                    height: 100,
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: Text(
                                  "Create your test!",
                                  style: const TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(3.0, 3.0),
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(125, 0, 0, 0),
                                        ),
                                        Shadow(
                                          offset: Offset(3.0, 3.0),
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(0, 0, 0, 255),
                                        ),
                                      ],
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child:
                            VerticalDivider(thickness: 3, color: Colors.white),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SizedBox(
                            height: 160,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
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
                                  backgroundColor:
                                      const Color.fromARGB(255, 102, 102, 255),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
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
