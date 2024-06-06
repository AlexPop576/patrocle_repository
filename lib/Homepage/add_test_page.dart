import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../Database/database_helper.dart';
import '../Theme/translations.dart';

class AddTestPage extends StatefulWidget {
  AddTestPage({super.key, this.language});
  int? language;

  @override
  State<AddTestPage> createState() => _AddTestPageState(language: language);
}

class _AddTestPageState extends State<AddTestPage> {
  _AddTestPageState({this.language});
  int? language;
  int pageIndex = 0;
  Map<int?, Map<String?, String?>> translation = Translations().translation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: ClipRect(
            child: AppBar(
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
                                color: Theme.of(context).colorScheme.background,
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
                                      "${translation[language]!["QP_QMSG"]}",
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
                                          backgroundColor: const Color.fromARGB(
                                              255, 102, 102, 255),
                                        ),
                                        child: Center(
                                            child: Text("${translation[language]!["Continue"]}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
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
                                          backgroundColor: const Color.fromARGB(
                                              255, 219, 64, 64),
                                        ),
                                        child: const Center(
                                            child: Text("Quit",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
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
              title: Text(
                "${translation[language]!["Add test"]}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              centerTitle: true,
              elevation: 0,
            ),
          ),
        ),
        body: addCountry(language: language,));
  }
}

class addCountry extends StatefulWidget {
  addCountry({super.key, this.language});
  int? language;

  @override
  State<addCountry> createState() => _addCountryState(language: language);
}

class _addCountryState extends State<addCountry> {
  _addCountryState({this.language});
  int? language;
  final _dbHelper = DatabaseHelper.instance;
  Map<int?, Map<String?, String?>> translation = Translations().translation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _dbHelper.queryAllRows(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      int color = index % 2;
                      return ListTile(
                          tileColor: color == 1
                              ? const Color.fromARGB(80, 0, 0, 0)
                              : Colors.transparent,
                          title: Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: Image.asset(
                                  'assets/flags/${snapshot.data![index]['name']}.png',
                                  height: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(child: Text("${translation[language]![snapshot.data![index]['name']]}")),
                            ],
                          ),
                          trailing: snapshot.data![index]['doesExist'] == 0
                              ? IconButton(
                                  icon: const CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 18,
                                      child:
                                          Icon(Icons.add, color: Colors.white)),
                                  onPressed: () async {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: addLesson(
                                            country: snapshot.data![index]
                                                ['name'],
                                            language: language,),
                                        type: PageTransitionType
                                            .rightToLeftWithFade,
                                        duration:
                                            const Duration(milliseconds: 250),
                                      ),
                                    );
                                    setState(() {});
                                  },
                                )
                              : IconButton(
                                      icon: const CircleAvatar(
                                        backgroundColor: Colors.red,
                                        radius: 18,
                                        child: Icon(Icons.delete,
                                            color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        setState(() {

                                          _dbHelper.deleteCountry(snapshot.data![index]
                                                ['name'].toString());
                                        });
                                      },
                                    ));
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class addQuestion extends StatefulWidget {
  addQuestion({super.key, required this.country, required this.language});
  int? language;
  String? country;

  @override
  State<addQuestion> createState() => _addQuestionState(country: country, language: language);
}

class _addQuestionState extends State<addQuestion> {
  _addQuestionState({required this.country, required this.language});
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  int? language;
  String? country;
  int subject = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: ClipRect(
          child: AppBar(
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
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17),
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
                                    "${translation[language]!['AP_QMSG']}",
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
                                        backgroundColor: const Color.fromARGB(
                                            255, 102, 102, 255),
                                      ),
                                      child: Center(
                                          child: Text("${translation[language]!["Continue"]}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
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
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 219, 64, 64),
                                      ),
                                      child: Center(
                                          child: Text("${translation[language]!["Quit"]}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
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
            title: Text(
              "${translation[language]![country.toString()]}",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            centerTitle: true,
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Center(
                child: Text(
              "${translation[language]!['Add new question']}",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            )),
            const SizedBox(height: 30),
            SizedBox(
              height: 58,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: ElevatedButton(
                  onPressed: () {
                    if (subject != 0) {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: addQuiz(
                              language: 2, country: country, subject: subject),
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 250),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  child: Text("${translation[language]!["Quiz"]}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 58,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: ElevatedButton(
                  onPressed: () {
                    if (subject != 0) {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: addSlider(
                              country: country, language: 2, subject: subject),
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 250),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  child: Text("${translation[language]!["Value slider"]}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 58,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: ElevatedButton(
                  onPressed: () {
                    if (subject != 0) {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: addMatch(
                              country: country, language: 2, subject: subject),
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 250),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  child: Text("${translation[language]!["Match words"]}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 58,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: ElevatedButton(
                  onPressed: () {
                    if (subject != 0) {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: addTrueFalse(
                              country: country, language: 2, subject: subject),
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 250),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  child: Text("${translation[language]!["True or False"]}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 3,
            ),
            const SizedBox(height: 15),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: subject == 1
                            ? Colors.green
                            : Colors.grey, // This is the button color
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          subject = 1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/icons/Geography.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: subject == 2
                              ? Colors.red
                              : Colors.grey, // This is the button color
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            subject = 2;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/icons/History.png'),
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class addLesson extends StatefulWidget {
  addLesson({super.key, required this.country, required this.language});
  int? language;
  String? country;

  @override
  State<addLesson> createState() => _addLessonState(country: country, language: language);
}

class _addLessonState extends State<addLesson> {
  _addLessonState({required this.country, required this.language});
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  String? country;
  int? language = 1;
  final _dbHelper = DatabaseHelper.instance;
  final _controllerLessonGeography = TextEditingController();
  final _controllerLessonHistory = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: ClipRect(
          child: AppBar(
            //flexibleSpace: Container(color: Colors.transparent),
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
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17),
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
                                    "${translation[language]!["AP_QMSG"]}",
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
                                        backgroundColor: const Color.fromARGB(
                                            255, 102, 102, 255),
                                      ),
                                      child: Center(
                                          child: Text("${translation[language]!["Continue"]}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
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
                                        backgroundColor: const Color.fromARGB(
                                            255, 219, 64, 64),
                                      ),
                                      child: Center(
                                          child: Text("${translation[language]!["Quit"]}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
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
            title: Text(
              "${translation[language]!["Lessons"]}",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            centerTitle: true,
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            const SizedBox(height: 20),
            Text(
              "${translation[language]!["Geography lesson"]}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
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
                  labelText: "${translation[language]!['Geography lesson']}",
                  labelStyle:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                  counterText: '',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 3,
            ),
            const SizedBox(height: 20),
            Text(
              "${translation[language]!["History lesson"]}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
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
                  labelText: "${translation[language]!['History lesson']}",
                  labelStyle:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                  counterText: '',
                ),
              ),
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ),
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
                    onPressed: () async {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: addQuestion(country: country, language: language),
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 250),
                        ),
                      );
                      await _dbHelper.setCountry(country.toString());
                      await _dbHelper.setLesson(country.toString(),
                          _controllerLessonGeography.text, 1);
                      await _dbHelper.setLesson(
                          country.toString(), _controllerLessonHistory.text, 2);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 102, 102, 255)),
                    child: Center(
                      child: Text("${translation[language]!["Save"]}",
                          style: const TextStyle(
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
        ),
      ),
    );
  }
}

class addQuiz extends StatefulWidget {
  addQuiz(
      {super.key, this.language, required this.country, required this.subject});
  int? language, subject = 1;
  String? country;

  @override
  State<addQuiz> createState() =>
      _addQuizState(language: language, country: country, subject: subject);
}

class _addQuizState extends State<addQuiz> {
  _addQuizState({this.language, required this.country, required this.subject});
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  final _dbHelper = DatabaseHelper.instance;
  int? language = 1, subject = 1;
  String? country;
  final _controllerQuestion = TextEditingController(),
      _controllerAnswer1 = TextEditingController(),
      _controllerAnswer2 = TextEditingController(),
      _controllerAnswer3 = TextEditingController(),
      _controllerAnswer4 = TextEditingController();
  int answer = 0, difficulty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: ClipRect(
          child: AppBar(
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
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17),
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
                                    "${translation[language]!["AP_QMSG"]}",
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
                                        backgroundColor: const Color.fromARGB(
                                            255, 102, 102, 255),
                                      ),
                                      child: Center(
                                          child: Text("${translation[language]!["Continue"]}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
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
                                        backgroundColor: const Color.fromARGB(
                                            255, 219, 64, 64),
                                      ),
                                      child: Center(
                                          child: Text("${translation[language]!["Quit"]}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
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
            title: Text(
              "${translation[language]!["Quiz"]}",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Textfield(
                  height: 58,
                  text: "${translation[language]!["Question"]}",
                  controller: _controllerQuestion),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 15),
              Textfield(
                  height: 58, text: "${translation[language]!["Answer"]} 1", controller: _controllerAnswer1),
              const SizedBox(height: 15),
              Textfield(
                  height: 58, text: "${translation[language]!["Answer"]} 2", controller: _controllerAnswer2),
              const SizedBox(height: 15),
              Textfield(
                  height: 58, text: "${translation[language]!["Answer"]} 3", controller: _controllerAnswer3),
              const SizedBox(height: 15),
              Textfield(
                  height: 58, text: "${translation[language]!["Answer"]} 4", controller: _controllerAnswer4),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              answer == 1 ? Colors.green : Colors.red,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                          ),
                        ),
                        child: Icon(
                          answer == 1 ? Icons.check : Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            answer = 1;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              answer == 2 ? Colors.green : Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        child: Icon(
                          answer == 2 ? Icons.check : Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            answer = 2;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              answer == 3 ? Colors.green : Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        child: Icon(
                          answer == 3 ? Icons.check : Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            answer = 3;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              answer == 4 ? Colors.green : Colors.red,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                          ),
                        ),
                        child: Icon(
                          answer == 4 ? Icons.check : Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            answer = 4;
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
              const SizedBox(height: 15),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: difficulty == 1
                              ? Colors.green
                              : Colors.grey, // This is the button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            difficulty = 1;
                          });
                        },
                        child: Text(
                          "${translation[language]!["Easy"]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: difficulty == 2
                              ? Colors.red
                              : Colors.grey, // This is the button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            difficulty = 2;
                          });
                        },
                        child: Text(
                          "${translation[language]!["Hard"]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
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
                    onPressed: () async {
                      Navigator.pop(context);
                      //await _dbHelper.setCountry(country.toString());
                      String answersText = jsonEncode([
                        _controllerAnswer1.text,
                        _controllerAnswer2.text,
                        _controllerAnswer3.text,
                        _controllerAnswer4.text
                      ]);
                      await _dbHelper.insertQuestion(
                          country.toString(),
                          _controllerQuestion.text,
                          answersText,
                          answer,
                          1,
                          subject!,
                          difficulty);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 102, 102, 255)),
                    child: Center(
                      child: Text("${translation[language]!["Save"]}",
                          style: const TextStyle(
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
        ),
      ),
    );
  }
}

class addSlider extends StatefulWidget {
  addSlider(
      {super.key, required this.country, this.language, required this.subject});
  int? language, subject = 1;
  String? country;

  @override
  State<addSlider> createState() =>
      _addSliderState(country: country, language: language, subject: subject);
}

class _addSliderState extends State<addSlider> {
  _addSliderState(
      {required this.country, this.language, required this.subject});
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  int? language = 1, subject = 1;
  int difficulty = 1;
  String? country;
  final _dbHelper = DatabaseHelper.instance;
  final _controllerQuestion = TextEditingController(),
      _controllerAnswer = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: ClipRect(
          child: AppBar(
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
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17),
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
                                    "${translation[language]!["AP_QMSG"]}",
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
                                        backgroundColor: const Color.fromARGB(
                                            255, 102, 102, 255),
                                      ),
                                      child: Center(
                                          child: Text("${translation[language]!["Continue"]}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
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
                                        backgroundColor: const Color.fromARGB(
                                            255, 219, 64, 64),
                                      ),
                                      child: Center(
                                          child: Text("${translation[language]!["Quit"]}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
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
            title: Text(
              "${translation[language]!["Value slider"]}",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Textfield(
                  height: 58,
                  text: "${translation[language]!["Question"]}",
                  controller: _controllerQuestion),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 15),
              Textfield(
                  height: 58,
                  text: "${translation[language]!["Correct value"]}",
                  controller: _controllerAnswer),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 15),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: difficulty == 1
                              ? Colors.green
                              : Colors.grey, // This is the button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            difficulty = 1;
                          });
                        },
                        child: Text(
                          "${translation[language]!["Easy"]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: difficulty == 2
                              ? Colors.red
                              : Colors.grey, // This is the button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            difficulty = 2;
                          });
                        },
                        child: Text(
                          "${translation[language]!["Hard"]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
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
                    onPressed: () async {
                      Navigator.pop(context);
                      await _dbHelper.insertQuestion(
                          country.toString(),
                          _controllerQuestion.text,
                          "",
                          int.parse(_controllerAnswer.text),
                          2,
                          subject!,
                          difficulty);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 102, 102, 255)),
                    child: Center(
                      child: Text("${translation[language]!["Save"]}",
                          style: const TextStyle(
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
        ),
      ),
    );
  }
}

class addMatch extends StatefulWidget {
  addMatch(
      {super.key, required this.country, this.language, required this.subject});
  int? language, subject = 1;
  String? country;

  @override
  State<addMatch> createState() =>
      _addMatchState(country: country, language: language, subject: subject);
}

class _addMatchState extends State<addMatch> {
  _addMatchState({required this.country, this.language, required this.subject});
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  int? language = 1, subject = 1;
  int difficulty = 0;
  String? country;
  final _dbHelper = DatabaseHelper.instance;
  final _controllerQuestion = TextEditingController(),
      _controllerW1C1 = TextEditingController(),
      _controllerW1C2 = TextEditingController(),
      _controllerW2C1 = TextEditingController(),
      _controllerW2C2 = TextEditingController(),
      _controllerW3C1 = TextEditingController(),
      _controllerW3C2 = TextEditingController(),
      _controllerW4C1 = TextEditingController(),
      _controllerW4C2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: ClipRect(
          child: AppBar(
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
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17),
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
                                    "${translation[language]!["QP_QMSG"]}",
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
                                        backgroundColor: const Color.fromARGB(
                                            255, 102, 102, 255),
                                      ),
                                      child: Center(
                                          child: Text("${translation[language]!["Continue"]}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
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
                                        backgroundColor: const Color.fromARGB(
                                            255, 219, 64, 64),
                                      ),
                                      child: Center(
                                          child: Text("${translation[language]!["Quit"]}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
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
              "Match columns",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 15),
              Textfield(
                  height: 58,
                  text: "${translation[language]!["Word"]} 1, ${translation[language]!["Column"]} 1",
                  controller: _controllerW1C1),
              const SizedBox(height: 15),
              Textfield(
                  height: 58,
                  text: "${translation[language]!["Word"]} 1, ${translation[language]!["Column"]} 2",
                  controller: _controllerW1C2),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 15),
              Textfield(
                  height: 58,
                  text: "${translation[language]!["Word"]} 2, ${translation[language]!["Column"]} 1",
                  controller: _controllerW2C1),
              const SizedBox(height: 15),
              Textfield(
                  height: 58,
                  text: "${translation[language]!["Word"]} 2, ${translation[language]!["Column"]} 2",
                  controller: _controllerW2C2),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 15),
              Textfield(
                  height: 58,
                  text: "${translation[language]!["Word"]} 3, ${translation[language]!["Column"]} 1",
                  controller: _controllerW3C1),
              const SizedBox(height: 15),
              Textfield(
                  height: 58,
                  text: "${translation[language]!["Word"]} 3, ${translation[language]!["Column"]} 2",
                  controller: _controllerW3C2),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 15),
              Textfield(
                  height: 58,
                  text: "${translation[language]!["Word"]} 4, ${translation[language]!["Column"]} 1",
                  controller: _controllerW4C1),
              const SizedBox(height: 15),
              Textfield(
                  height: 58,
                  text: "${translation[language]!["Word"]} 4, ${translation[language]!["Column"]} 2",
                  controller: _controllerW4C2),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 15),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: difficulty == 1
                              ? Colors.green
                              : Colors.grey, // This is the button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            difficulty = 1;
                          });
                        },
                        child: Text(
                          "${translation[language]!["Easy"]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: difficulty == 2
                              ? Colors.red
                              : Colors.grey, // This is the button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            difficulty = 2;
                          });
                        },
                        child: Text(
                          "${translation[language]!["Hard"]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
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
                    onPressed: () async {
                      Navigator.pop(context);
                      String answersText = jsonEncode([
                        _controllerW1C1.text,
                        _controllerW2C1.text,
                        _controllerW3C1.text,
                        _controllerW4C1.text,
                        _controllerW1C2.text,
                        _controllerW2C2.text,
                        _controllerW3C2.text,
                        _controllerW4C2.text,
                      ]);
                      await _dbHelper.insertQuestion(
                          country.toString(),
                          _controllerQuestion.text,
                          answersText,
                          1,
                          3,
                          subject!,
                          difficulty);
                      //await _dbHelper.setCountry(country.toString());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 102, 102, 255)),
                    child: Center(
                      child: Text("${translation[language]!["Save"]}",
                          style: const TextStyle(
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
        ),
      ),
    );
  }
}

class addTrueFalse extends StatefulWidget {
  addTrueFalse(
      {super.key, required this.country, this.language, required this.subject});
  int? language, subject = 1;
  String? country;

  @override
  State<addTrueFalse> createState() => _addTrueFalseState(
      country: country, language: language, subject: subject);
}

class _addTrueFalseState extends State<addTrueFalse> {
  _addTrueFalseState(
      {required this.country, this.language, required this.subject});
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  int? language = 1, subject = 1;
  String? country;
  final _dbHelper = DatabaseHelper.instance;
  final _controllerQuestion = TextEditingController();
  int selected = 0, difficulty = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: ClipRect(
          child: AppBar(
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
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17),
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
                                    "${translation[language]!["QP_QMSG"]}",
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
                                        backgroundColor: const Color.fromARGB(
                                            255, 102, 102, 255),
                                      ),
                                      child: Center(
                                          child: Text("${translation[language]!["Continue"]}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
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
                                        backgroundColor: const Color.fromARGB(
                                            255, 219, 64, 64),
                                      ),
                                      child: Center(
                                          child: Text("${translation[language]!["Quit"]}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
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
            title: Text(
              "${translation[language]!["True or False"]}",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Textfield(
                  height: 58,
                  text: "${translation[language]!["Question"]}",
                  controller: _controllerQuestion),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: SizedBox(
                      height: 140,
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selected = 1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            side: selected == 1
                                ? const BorderSide(
                                    color: Colors.green, width: 3)
                                : BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 3),
                          ),
                          child: Center(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Image.asset("assets/icons/true.png"))),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: SizedBox(
                      height: 140,
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selected = 2;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            side: selected == 2
                                ? const BorderSide(color: Colors.red, width: 3)
                                : BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 3),
                          ),
                          child: Center(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child:
                                      Image.asset("assets/icons/false.png"))),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 15),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: difficulty == 1
                              ? Colors.green
                              : Colors.grey, // This is the button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            difficulty = 1;
                          });
                        },
                        child: Text(
                          "${translation[language]!["Easy"]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: difficulty == 2
                              ? Colors.red
                              : Colors.grey, // This is the button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            difficulty = 2;
                          });
                        },
                        child: Text(
                          "${translation[language]!["Hard"]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
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
                    onPressed: () async {
                      Navigator.pop(context);
                      await _dbHelper.insertQuestion(
                          country.toString(),
                          _controllerQuestion.text,
                          "",
                          selected,
                          4,
                          subject!,
                          difficulty);
                      //await _dbHelper.setCountry(country.toString());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 102, 102, 255)),
                    child: Center(
                      child: Text("${translation[language]!["Save"]}",
                          style: const TextStyle(
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
        ),
      ),
    );
  }
}

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
