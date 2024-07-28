import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle/Database/database_helper.dart';
import 'package:patrocle/Homepage/homepage.dart';
import 'package:patrocle/Theme/translations.dart';

class StreakPage extends StatefulWidget {
  StreakPage({super.key, required this.language});
  int? language;

  @override
  State<StreakPage> createState() => _StreakPageState(language: language);
}

class _StreakPageState extends State<StreakPage> {
  _StreakPageState({required this.language});
  int streak = 0;
  int? language = 0;
  final _dbHelper = DatabaseHelper.instance;
  Map<int?, Map<String?, String?>> translation = Translations().translation;

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch streak data on initialization
  }

  void fetchData() {
    _dbHelper.getStreakCount().then((results) {
      setState(() {
        streak = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/flame.json',
                  frameRate: FrameRate.max, fit: BoxFit.contain),
              Text(
                'Your streak: $streak',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 58,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Homepage(selectedIndex: 1);
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 102, 102, 255),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    child: Text("${translation[language]!["Continue"]}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
