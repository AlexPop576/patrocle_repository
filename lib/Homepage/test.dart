import 'package:flutter/material.dart';
import '../Database/database_helper.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final _dbHelper = DatabaseHelper.instance;
  final _controller = TextEditingController();
  final _controllerLessonHistory = TextEditingController();
  final _controllerLessonGeography = TextEditingController();
  final _controllerTrophy = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: 'Enter country name'),
                ),
                TextField(
                  controller: _controllerLessonGeography,
                  decoration: InputDecoration(hintText: 'Lesson Geography'),
                ),
                TextField(
                  controller: _controllerLessonHistory,
                  decoration: InputDecoration(hintText: 'Lesson History'),
                ),
              ],
            ),
          ),
            ElevatedButton(
            child: Text('Insert'),
            onPressed: () async {
              //int i = await _dbHelper.insertCountry(_controller.text, _controllerLessonGeography.text, _controllerLessonHistory.text, "Q1.test", "Q2.test", "Q3.test", "Q4.test");
              //print('inserted row: $i');
              setState(() {_controller.clear();});
            },
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _dbHelper.queryAllRows(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text('${snapshot.data![index]['_id']}: ${snapshot.data![index]['name']} - ${snapshot.data![index]['lesson_geography']} - ${snapshot.data![index]['lesson_history']} =  ${snapshot.data![index]['geography_completed']}-${snapshot.data![index]['history_completed']}'),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () async {
                                      int i = await _dbHelper.deleteCountry(snapshot.data![index]['_id']);
                                      print('deleted row: $i');
                                      setState(() {});
                                    },
                                  ),
                                );
                              },
                            );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
          TextField(
                  controller: _controllerTrophy,
                  decoration: InputDecoration(hintText: 'Enter trophy'),
                ),
          ElevatedButton(
            child: Text('Insert'),
            onPressed: () async {
              int i = await _dbHelper.insertTrophy(int.parse(_controllerTrophy.text));
              print('inserted row: $i');
              setState(() {_controllerTrophy.clear();});
            },
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _dbHelper.queryTrophies(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text('${snapshot.data![index]['_trophy_id']}: ${snapshot.data![index]['trophy']}'),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () async {
                                      int i = await _dbHelper.deleteTrophy(snapshot.data![index]['_trophy_id']);
                                      print('deleted row: $i');
                                      setState(() {});
                                    },
                                  ),
                                );
                              },
                            );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _dbHelper.queryProfile(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text('${snapshot.data![index]['profileID']}: ${snapshot.data![index]['username']} + ${snapshot.data![index]['geography_lessons']}+ ${snapshot.data![index]['history_lessons']}'),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () async {
                                      int i = await _dbHelper.deleteTrophy(snapshot.data![index]['_trophy_id']);
                                      print('deleted row: $i');
                                      setState(() {});
                                    },
                                  ),
                                );
                              },
                            );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}