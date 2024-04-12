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
              int i = await _dbHelper.insert(_controller.text, _controllerLessonGeography.text, _controllerLessonHistory.text);
              print('inserted row: $i');
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
                                  title: Text('${snapshot.data![index]['_id']}: ${snapshot.data![index]['name']} - ${snapshot.data![index]['lesson_geography']} - ${snapshot.data![index]['lesson_history']}'),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () async {
                                      int i = await _dbHelper.delete(snapshot.data![index]['_id']);
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