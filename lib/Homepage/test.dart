import 'package:flutter/material.dart';
import 'package:patrocle/Database/country_crud.dart';
import '../Database/country_model.dart';
import '../Database/database_helper.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final controllerName = TextEditingController();
  final controllerID = TextEditingController();
  List<CountryModel> countryListDB = [];
  final crud = CountryCrud();

  @override
  void initState() {
    super.initState();
    crud.readAll().then((value) {
      setState(() {
        countryListDB = value;
      });
    });
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerID.dispose();
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
                        final id = await crud.insert(country);
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
                          await crud.delete(country);
                          if(country.id== countryListDB.last.id){
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
                })
          ],
        )),
      ),
    );
  }
}
