import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../Database/database_helper.dart';
import '../../Theme/translations.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key, required this.username});
  String? username;

  @override
  State<EditProfile> createState() => _EditProfileState(username: username);
}

class _EditProfileState extends State<EditProfile> {
  _EditProfileState({required this.username});
  String? username;
  int profileIndex = 0, maxIndex = 3, language = 2;
  List<Color> profileColor = [Colors.red, Colors.green, Colors.blue, Colors.yellow];
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  final _dbHelper = DatabaseHelper.instance;
  final usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      usernameController.text = username!;
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
                                    child: Text("${translation[language]!["Continue"]}",
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
                                    child: Text("${translation[language]!["Quit"]}",
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
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                    color: profileColor[profileIndex],
                    height: 300,
                    width: double.infinity,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      IconButton(
                          onPressed: (() {
                            setState(() {
                              if (profileIndex < maxIndex) {
                                profileIndex++;
                              } else {
                                profileIndex = 0;
                              }
                            });
                          }),
                          icon: const Icon(Icons.arrow_back)),
                      Image.asset('assets/icons/Face.png'),
                      IconButton(
                          onPressed: (() {
                            setState(() {
                              if (profileIndex > 0) {
                                profileIndex--;
                              } else {
                                profileIndex = maxIndex;
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
                maxLength: 150,
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
                      if(usernameController.text.isNotEmpty)await _dbHelper.updateUserame(usernameController.text);
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
