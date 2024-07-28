import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle/Database/database_helper.dart';
import 'package:patrocle/Theme/general_info.dart';
import 'package:translator/translator.dart';
//import 'package:flutter_tts/flutter_tts.dart';
import '../Theme/translations.dart';

class Lesson extends StatefulWidget {
  String? country;
  int? subject = 0, language;
   // Constructor for Lesson widget
  Lesson({super.key, required this.country, this.subject, required this.language});

  @override
  State<Lesson> createState() =>
      _LessonState(country: country, subject: subject, language: language);
}
// Define the state for the Lesson widget
class _LessonState extends State<Lesson> {
  String? lesson, country;
  int? language = 2, subject = 0;
  // Constructor for _LessonState
  _LessonState({required this.country, this.subject, required this.language});
  // Translation and information maps
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  Map<String?, Map<int?, String?>> info = Info().info;
  final _dbHelper = DatabaseHelper.instance;
  GoogleTranslator translator = GoogleTranslator();
  //FlutterTts flutterTts = FlutterTts();
  bool _isSpeaking = false;

  @override
  void initState() {
    super.initState();
    //flutterTts.setPitch(1.0);
    fetchData();
  }

  @override
  void dispose() {
    // Stop TTS when disposing
    //flutterTts.stop();
    super.dispose();
  }
  // Method to handle text-to-speech
  /*Future<void> speak(String text) async {
    String languageCode = getLanguageCode(language);
    await flutterTts.setLanguage(languageCode);
    if (_isSpeaking) {
      await flutterTts.stop();
    } else {
      await flutterTts.speak(text);
    }
    _isSpeaking = !_isSpeaking;
  }*/
  
  // Method to get language code based on language ID
  String getLanguageCode(int? language) {
    Map<int, String> languageCodes = {
      1: "en-US",
      2: "ro-RO", // with english accent :|
      3: "hu-HU", // with english accent :|
      4: "es-ES",
    };
    return languageCodes[language] ?? "en-US";
  }
  // Method to fetch data from the database
  void fetchData() async {
    Map<String, dynamic> lessons =
        await _dbHelper.queryLesson(country.toString());
    setState(() {
      lesson =
          subject == 1 ? lessons['geographyLesson'] : lessons['historyLesson'];
      translate(lesson!);
    });
  }
  // Method to translate text
  void translate(String text) {
    String toLanguage;
    if (language == 4) {
      toLanguage = "es";
    } else if (language == 2) {
      toLanguage = "ro";
    } else if (language == 3) {
      toLanguage = "hu";
    } else {
      toLanguage = "en";
    }
    translator.translate(text, to: toLanguage).then((output) {
      setState(() {
        lesson = output.toString();
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
                  ),
                  /*language == 1 || language == 4
                      ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: ElevatedButton(
                            onPressed: () {
                              if (lesson != null) {
                                //speak(lesson!);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Icon(
                                  Icons.volume_up,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      )
                      : SizedBox(),*/
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: Image.asset(
                                  'assets/flags/$country.png',
                                  height: 150,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: subject == 1
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${translation[language]!["Capital"]}: ${info[country]![1]}",
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          "${translation[language]!["Surface"]}: ${info[country]![2]}",
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          "${translation[language]!["Population"]}: ${info[country]![3]}",
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${translation[language]!["Capital"]}: ${info[country]![1]}",
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          "${translation[language]!["Independence"]}: ${info[country]![4]}",
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          "${translation[language]!["Wars"]}: ${info[country]![5]}",
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
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
