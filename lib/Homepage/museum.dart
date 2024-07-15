import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Database/database_helper.dart';
import '../Theme/translations.dart';

class Museum extends StatefulWidget {
  const Museum({super.key});

  @override
  State<Museum> createState() => _MuseumState();
}

class _MuseumState extends State<Museum> {
  int color = 0, admin = 0, language = 2, indexColor = 1;
  final _dbHelper = DatabaseHelper.instance;
  Map<int?, Map<String?, String?>> translation = Translations().translation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Lottie.asset(
                    'assets/patrocle.json',
                    frameRate: FrameRate.max,
                    height: 120,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      "Museum",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.primary,
          thickness: 3,
        ),
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Opacity(
                opacity: 0.7,
                child: Image.asset(
                  "assets/icons/background.png",
                  fit: BoxFit.cover,
                ),
              ),
              SingleChildScrollView(
                child: Column(children: [
                  Stack(children:[
                    Center(child: Image.asset('assets/icons/frame.png')),
                    SizedBox(height: 50,),
                    Center(child: SizedBox(height: 50, width: 550,child: Image.asset('assets/flags/Romania.png')))
                  ]),
                ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}
