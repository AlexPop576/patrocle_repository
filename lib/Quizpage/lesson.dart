import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle/Theme/general_info.dart';

import '../Theme/translations.dart';

// ignore: must_be_immutable
class Lesson extends StatefulWidget {
  String? lesson, country;
  int? subject = 0;
  Lesson({super.key, this.lesson, required this.country, this.subject});

  @override
  // ignore: no_logic_in_create_state
  State<Lesson> createState() => _LessonState(lesson: lesson, country: country, subject: subject);
}

class _LessonState extends State<Lesson> {
  String? lesson, country;
  int? language =2, subject = 0;
  _LessonState({this.lesson, required this.country, this.subject});
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  Map<String?, Map<int?, String?>> info = Info().info;

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
              child: Column(children: [
                const SizedBox(
                  height: 12,
                ),
                Row(children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Lottie.asset('assets/patrocle.json',
                      frameRate: FrameRate.max, height: 100),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Patrocle:",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  )
                ]),
                const SizedBox(
                  height: 12,
                ),
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                  thickness: 3,
                ),
                const SizedBox(
                  height: 12,
                ),
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      color: Theme.of(context).colorScheme.primary,
                      height: 350,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                            child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: Image.asset(
                                  'assets/flags/$country.png',
                                  height: 150,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                            child: subject == 1 ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${translation[language]!["Capital"]}: ${info[country]![1]}", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                                Text("${translation[language]!["Surface"]}: ${info[country]![2]}", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                                Text("${translation[language]!["Population"]}: ${info[country]![3]}", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                              ],
                            ) : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${translation[language]!["Capital"]}: ${info[country]![1]}", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                                Text("${translation[language]!["Independence"]}: ${info[country]![4]}", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                                Text("${translation[language]!["Wars"]}: ${info[country]![5]}", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 12,
                ),
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                  thickness: 3,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  lesson.toString(),
                  style: TextStyle(fontSize: 27),
                ),
                const SizedBox(
                  height: 12,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
