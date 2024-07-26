import 'package:flutter/material.dart';
import 'package:patrocle/Database/database_helper.dart';

import '../../Theme/translations.dart';

// Defining a StatefulWidget, AdminPage.
class AdminPage extends StatefulWidget {
  // Constructor for AdminPage.
  AdminPage({super.key, this.language});
  int? language;

  @override
  State<AdminPage> createState() => _AdminPageState(language: language);
}

// State class for AdminPage.
class _AdminPageState extends State<AdminPage> {
  // Constructor for _AdminPageState.
  _AdminPageState({this.language});

  // Database helper instance.
  final _dbHelper = DatabaseHelper.instance;
  // Translation map.
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  // Controller for the PIN input field.
  final pinController = TextEditingController();
  // Default language.
  int? language = 2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 29,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "${translation[language]!["Admin"]}",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "${translation[language]!["Input admin pin"]}",
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 3,
            ),
            const SizedBox(height: 15),
            TextField(
              controller: pinController,
              cursorColor: Colors.white,
              maxLength: 150,
              keyboardType: TextInputType.number,
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
                labelText: "${translation[language]!["PIN"]}",
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.tertiary),
                counterText: '',
              ),
            ),
          ],
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
                      if (pinController.text == "1234") {
                        await _dbHelper.updateAdmin();
                        Navigator.pop(context);
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/Wrong.png',
                                  height: 30,
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  "${translation[language]!["Wrong!"]}",
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                                const SizedBox(width: 15),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: (() {
                                  Navigator.pop(context);
                                }),
                                child: Text("${translation[language]!["Try again"]}",
                                    style: const TextStyle(color: Colors.white)),
                              ),
                              TextButton(
                                onPressed: (() {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }),
                                child: Text("${translation[language]!["Quit"]}",
                                    style: const TextStyle(color: Colors.white)),
                              ),
                            ],
                            elevation: 24,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 102, 102, 255)),
                    child: Center(
                      child: Text("${translation[language]!["Continue"]}",
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
