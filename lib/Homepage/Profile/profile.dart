import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:patrocle/Database/database_helper.dart';
import 'package:patrocle/Homepage/Profile/admin.dart';
import 'package:patrocle/Homepage/Profile/edit_profile.dart';
import 'package:provider/provider.dart';
import 'package:patrocle/Theme/translations.dart';
import '../../Theme/theme_provider.dart';

// Profile widget which is a StatefulWidget
class Profile extends StatefulWidget {
  Profile({
    super.key,
    required this.setLanguageFunction,
  });
  final Function setLanguageFunction;

  @override
  State<Profile> createState() =>
      _ProfileState(setLanguageFunction: setLanguageFunction);
}

// State class for Profile widget
class _ProfileState extends State<Profile> {
  // Variables to hold profile data
  int? iq = 0,
      trophies = 0,
      language = 2,
      profileIndex = 1,
      admin = 0,
      streakCount = 0,
      coins = 0;
      
  Map<int?, Map<String?, String?>> translation = Translations().translation;
  final Function setLanguageFunction;

  // Constructor to initialize setLanguageFunction
  _ProfileState({
    required this.setLanguageFunction,
  });

  // List of profile colors
  List<Color> profileColor = [
    Colors.grey,
    Colors.blue,
    Colors.red,
    Colors.green,
  ];

  // List of profile photos
  List<Image> profilePhoto = [
    Image.asset('assets/icons/face1.png', height: 100, fit: BoxFit.contain),
    Image.asset('assets/icons/face2.png', height: 100, fit: BoxFit.contain),
    Image.asset('assets/icons/face3.png', height: 100, fit: BoxFit.contain),
    Image.asset('assets/icons/face4.png', height: 100, fit: BoxFit.contain),
  ];

  List<Color> topColor = [
    Colors.grey,
    Colors.green,
    Colors.red,
  ];

  List<Image> topPhoto = [
    Image.asset('assets/icons/face1.png', height: 100, fit: BoxFit.contain),
    Image.asset('assets/icons/face4.png', height: 100, fit: BoxFit.contain),
    Image.asset('assets/icons/face3.png', height: 100, fit: BoxFit.contain),
  ];

  List<String> topName = ["Anto", "Robert", "Maria"];
  List<int> topIQ = [5235, 3770, 3415];

  // Database helper instance
  final _dbHelper = DatabaseHelper.instance;
  String username = "user";

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch profile data on initialization
  }

  void fetchData() {
    _dbHelper.queryProfile().then((results) {
      if (results.isNotEmpty) {
        setState(() {
          username = results.first['username'];
          iq = results.first['iq'];
          trophies = results.first['trophies'];
          profileIndex = results.first['picture'];
          admin = results.first['admin'];
          language = results.first['language'];
          coins = results.first['coins'];
          profileIndex = results.first['picture'];
          print(profileIndex);
        });
      }
    });
    _dbHelper.getStreakCount().then((results) {
      setState(() {
        streakCount = results;
      });
    });
  }

  Future<void> setAdmin() async {
    _dbHelper.queryProfile().then((results) {
      if (results.isNotEmpty) {
        if (results.first['admin'] == 1) {
          setState(() {
            admin = 1;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: profileColor[profileIndex! - 1]),
                            width: double.infinity,
                            height: 280,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                              child: profilePhoto[profileIndex! - 1],
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).colorScheme.primary,
                            thickness: 3,
                            height: 0,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Text(
                                username,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: EditProfile(
                                        username: username,
                                        profileIndex: profileIndex!,
                                        language: language,
                                      ),
                                      type: PageTransitionType.bottomToTop,
                                      duration:
                                          const Duration(milliseconds: 250),
                                    ),
                                  ).then((_) {
                                    fetchData();
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Divider(
                            color: Theme.of(context).colorScheme.primary,
                            thickness: 3,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                "${translation[language]!["Statistics"]}",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 85,
                                  child: Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 8.3, 0),
                                    padding: const EdgeInsets.all(2.8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 3.2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: Column(
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              iq == 0 ? '0 IQ' : "$iq IQ",
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 102, 102, 255),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 27),
                                            ),
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              "${translation[language]!["Total IQ"]}",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 85,
                                  child: Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(8.3, 0, 0, 0),
                                    padding: const EdgeInsets.all(2.8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 3.2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: Column(
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              trophies == 0
                                                  ? '0/6'
                                                  : '$trophies/6',
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 200, 0),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 27),
                                            ),
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              "${translation[language]!["Trophies"]}",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 85,
                                  child: Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 8.3, 0),
                                    padding: const EdgeInsets.all(2.8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 3.2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: Column(
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              streakCount == 1
                                                  ? '1 ${translation[language]!['Day']}'
                                                  : "$streakCount ${translation[language]!['Days']}",
                                              style: const TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 27),
                                            ),
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              "${translation[language]!['Streak']}",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 85,
                                  child: Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(8.3, 0, 0, 0),
                                    padding: const EdgeInsets.all(2.8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 3.2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: Column(
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              '$coins',
                                              style: const TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 27),
                                            ),
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              "${translation[language]!['Coins']}",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Center(
                                  child: Text(
                                overflow: TextOverflow.ellipsis,
                                "${translation[language]!["Geography"]}",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              )),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Center(
                                  child: Text(
                                overflow: TextOverflow.ellipsis,
                                "${translation[language]!["History"]}",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Center(
                                child:
                                    FutureBuilder<List<Map<String, dynamic>>>(
                                  future: _dbHelper.queryAllRows(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          if (snapshot.data![index]
                                                  ['geography_completed'] ==
                                              1) {
                                            return Column(
                                              children: [
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    child: Image.asset(
                                                      'assets/flags/${snapshot.data![index]['name']}.png',
                                                      height: 70,
                                                    )),
                                              ],
                                            );
                                          } else {
                                            return Container();
                                          }
                                        },
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text("${snapshot.error}");
                                    }
                                    return const CircularProgressIndicator();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Center(
                                child:
                                    FutureBuilder<List<Map<String, dynamic>>>(
                                  future: _dbHelper.queryAllRows(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          if (snapshot.data![index]
                                                  ['history_completed'] ==
                                              1) {
                                            return Column(
                                              children: [
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    child: Image.asset(
                                                      'assets/flags/${snapshot.data![index]['name']}.png',
                                                      height: 70,
                                                    )),
                                              ],
                                            );
                                          } else {
                                            return Container();
                                          }
                                        },
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text("${snapshot.error}");
                                    }
                                    return const CircularProgressIndicator();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Divider(
                        color: Theme.of(context).colorScheme.primary,
                        thickness: 3,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "${translation[language]!["Weekly top"]}",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: SizedBox(
                                    height: 56,
                                    child: Container(
                                      color: topColor[index],
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(width: 20),
                                                topPhoto[index],
                                                SizedBox(width: 15),
                                                Text(
                                                  topName[index],
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${topIQ[index]} IQ",
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(width: 30),
                                              ],
                                            )
                                          ]),
                                    ),
                                  )),
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: SizedBox(
                              height: 56,
                              child: Container(
                                color: profileColor[profileIndex! - 1],
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          profilePhoto[profileIndex! - 1],
                                          SizedBox(width: 15),
                                          Text(
                                            username,
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "$iq IQ",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 30),
                                        ],
                                      )
                                    ]),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Divider(
                            color: Theme.of(context).colorScheme.primary,
                            thickness: 3,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                "${translation[language]!["Settings"]}",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            height: 58,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: ElevatedButton(
                                onPressed: () {
                                  Provider.of<ThemeProvider>(context,
                                          listen: false)
                                      .toggleTheme();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        overflow: TextOverflow.ellipsis,
                                        Provider.of<ThemeProvider>(context,
                                                        listen: false)
                                                    .getTheme() ==
                                                1
                                            ? "${translation[language]!["Light mode"]}"
                                            : "${translation[language]!["Dark mode"]}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                        )),
                                    const SizedBox(width: 10),
                                    Icon(
                                      Provider.of<ThemeProvider>(context,
                                                      listen: false)
                                                  .getTheme() ==
                                              1
                                          ? Icons.brightness_7_rounded
                                          : Icons.brightness_2,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 58,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (language! < 4) {
                                    setState(() {
                                      language = language! + 1;
                                    });
                                  } else {
                                    setState(() {
                                      language = 1;
                                    });
                                  }
                                  await _dbHelper.updateLanguage(language!);
                                  setState(() {
                                    setLanguageFunction(language);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      language == 1
                                          ? "English"
                                          : language == 2
                                              ? "Română"
                                              : language == 3
                                                  ? "Magyar"
                                                  : "Español",
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
                            height: 10,
                          ),
                          SizedBox(
                            height: 58,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: ElevatedButton(
                                onPressed: () async {
                                  admin == 0
                                      ? {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              child:
                                                  AdminPage(language: language),
                                              type: PageTransitionType
                                                  .bottomToTop,
                                              duration: const Duration(
                                                  milliseconds: 250),
                                            ),
                                          ).then((_) => setAdmin()),
                                        }
                                      : {
                                          await _dbHelper.updateAdmin(),
                                          setState(() {
                                            admin = 0;
                                          })
                                        };
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                ),
                                child: Center(
                                    child: admin == 0
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  "${translation[language]!["Admin mode"]}",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                  )),
                                              const SizedBox(width: 10),
                                              const Icon(
                                                Icons.admin_panel_settings,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  "${translation[language]!["User mode"]}",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                  )),
                                              const SizedBox(width: 10),
                                              const Icon(
                                                Icons.person,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                            ],
                                          )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Divider(
                            color: Theme.of(context).colorScheme.primary,
                            thickness: 3,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ));
  }
}
