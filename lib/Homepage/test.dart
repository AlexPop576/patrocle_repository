import 'package:flutter/material.dart';
import 'package:patrocle/Database/country_crud.dart';
import 'package:patrocle/Database/trophy_crud.dart';
import 'package:patrocle/Database/trophy_model.dart';
import '../Database/country_model.dart';
import '../Database/database_helper.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final controllerName = TextEditingController();
  final controllerIndex = TextEditingController();
  List<CountryModel> countryListDB = [];
  List<TrophyModel> trophyListDB = [];
  final crudCountry = CountryCrud();
  final crudTrophy = TrophyCrud();

  @override
  void initState() {
    super.initState();
    crudCountry.readAll().then((value) {
      setState(() {
        countryListDB = value;
      });
    });
    crudTrophy.readAll().then((value) {
      setState(() {
        trophyListDB = value;
      });
    });
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: controllerName,
                    style: TextStyle(color: Colors.white),
                  )),
                  ElevatedButton(
                      onPressed: () async {
                        final name = controllerName.text;
                        CountryModel country = CountryModel(name: name);
                        final id = await crudCountry.insert(country);
                        country = country.copyWith(id: id);
                        controllerName.clear();
                        setState(() {
                          countryListDB.add(country);
                        });
                      },
                      child: const Text('Create Country')),
                  ElevatedButton(
                    onPressed: () async {
                      await DatabaseHelper.instance.clearTableAndResetId();
                      setState(() {
                        countryListDB.clear();
                      });
                    },
                    child: Text('Delete All'),
                  )
                ],
              ),
            ),
            ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: countryListDB.length,
                itemBuilder: (ctx, index) {
                  final country = countryListDB[index];
                  return ListTile(
                    leading: Text(
                      '${country.id}',
                    ),
                    title: Text(
                      country.name,
                    ),
                    trailing: IconButton(
                        onPressed: () async {
                          await crudCountry.delete(country);
                          if (country.id == countryListDB.last.id) {
                            await DatabaseHelper.instance.decreaseMaxId();
                          }
                          setState(() {
                            countryListDB.removeWhere(
                                (element) => element.id == country.id);
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: controllerIndex,
                    style: TextStyle(color: Colors.white),
                  )),
                  ElevatedButton(
                      onPressed: () async {
                        final index = int.parse(controllerIndex.text);
                        TrophyModel trophy = TrophyModel(index: index);
                        final id = await crudTrophy.insert(trophy);
                        trophy = trophy.copyWith(id: id);
                        controllerIndex.clear();
                        setState(() {
                          trophyListDB.add(trophy);
                        });
                      },
                      child: const Text('Add trophy')),
                  ElevatedButton(
                    onPressed: () async {
                      await DatabaseHelper.instance.clearTableAndResetId();
                      setState(() {
                        countryListDB.clear();
                      });
                    },
                    child: Text('Delete All'),
                  ),
                ],
              ),
            ),
            ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: trophyListDB.length,
                itemBuilder: (ctx, index) {
                  final trophy = trophyListDB[index];
                  return ListTile(
                    leading: Text(
                      '${trophy.id}',
                    ),
                    title: Text(
                      trophy.index.toString(),
                    ),
                    trailing: IconButton(
                        onPressed: () async {
                          await crudTrophy.delete(trophy);
                          if (trophy.index == trophyListDB.last.id) {
                            await DatabaseHelper.instance.decreaseMaxId();
                          }
                          setState(() {
                            trophyListDB.removeWhere(
                                (element) => element.id == trophy.id);
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                }),
          ],
        )),
      ),
    );
  }
}
