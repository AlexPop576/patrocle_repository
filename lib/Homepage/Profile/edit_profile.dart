import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../Database/database_helper.dart';
import '../../Theme/translations.dart';

// Main widget for editing profile
class EditProfile extends StatefulWidget {
  EditProfile(
      {super.key,
      required this.username,
      required this.profileIndex,
      this.language});
  String? username;
  int profileIndex = 0;
  int? language;

  @override
  State<EditProfile> createState() => _EditProfileState(
      username: username, profileIndex: profileIndex, language: language);
}

// State class for EditProfile
class _EditProfileState extends State<EditProfile> {
  _EditProfileState(
      {required this.username, required this.profileIndex, this.language});
  
  // Variables for profile data
  String? username;
  int profileIndex = 0, maxIndex = 2;
  int? language = 2;
  
  // Lists for profile colors and photos
  List<Color> profileColor = [
    Colors.blue,
    Colors.red,
    Colors.green,
  ];
  List<Image> profilePhoto = [
    Image.asset('assets/icons/face1.png', height: 100, fit: BoxFit.contain),
    Image.asset('assets/icons/face2.png', height: 100, fit: BoxFit.contain),
    Image.asset('assets/icons/face3.png', height: 100, fit: BoxFit.contain),
  ];
  
  // Translation map
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  
  // Database helper instance
  final _dbHelper = DatabaseHelper.instance;
  
  // Controller for username input
  final usernameController = TextEditingController();
  
  // Variables for faces data
  String? faces;
  List<int>? faceList = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      usernameController.text = username!;
    });
    fetchData();
  }

  void fetchData() async {
    await _dbHelper.queryFaces().then((results) {
      faces = results['faces'];
      if (faces != null) {
        faceList = List<int>.from(jsonDecode(faces!));
      }
      print("List: $faceList");
      print(profileIndex);
      print(faceList!.length);
      setState(() {
        if(faceList!.length!=0)
          maxIndex = faceList!.length+1;
        else maxIndex = 0;
      });
    });
  }

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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                "${translation[language]!["EP_QMSG"]}",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
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
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 102, 102, 255),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                        "${translation[language]!["Continue"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30))),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              height: 58,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 219, 64, 64),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                        "${translation[language]!["Quit"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30))),
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
          "${translation[language]!["Edit profile"]}",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "${translation[language]!["Profile picture"]}",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 15),
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    color: profileColor[profileIndex%3],
                    height: 300,
                    width: double.infinity,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: (() {
                                setState(() {
                                  if (profileIndex < maxIndex) {
                                    profileIndex++;
                                    print(profileIndex);
                                  } else {
                                    profileIndex = 0;
                                    print(profileIndex);
                                  }
                                });
                              }),
                              icon: const Icon(Icons.arrow_back)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                height: 250,
                                width: 250,
                                child: Image.asset('assets/icons/face${faceList![0]}.png', height: 100, fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: (() {
                                setState(() {
                                  if (profileIndex > 0) {
                                    profileIndex--;
                                    print(profileIndex);
                                  } else {
                                    profileIndex = maxIndex;
                                    print(profileIndex);
                                  }
                                });
                              }),
                              icon: const Icon(Icons.arrow_forward)),
                        ]),
                  )),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: usernameController,
                cursorColor: Colors.white,
                maxLength: 10,
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
                  labelText: "${translation[language]!["Username"]}",
                  labelStyle:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                  counterText: '',
                ),
              ),
              const SizedBox(height: 15),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 15),
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
                    onPressed: () async {
                      await _dbHelper.updatePicture(profileIndex);
                      if (usernameController.text.isNotEmpty)
                        await _dbHelper.updateUserame(usernameController.text);
                      Navigator.pop(context);
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
