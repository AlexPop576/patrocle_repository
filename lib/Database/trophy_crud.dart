import 'package:sqflite/sqflite.dart';

import 'trophy_model.dart';
import 'database_helper.dart';

class TrophyCrud {
    Database get database => DatabaseHelper.instance.db;
  Future<List<TrophyModel>> readAll() async {
    final data = await database.query('trophies');
    return data.map((e) => TrophyModel.fromMap(e)).toList();
  }

  Future<int> insert(TrophyModel trophy) async {
  print('Inserting trophy with index: ${trophy.index}');
  try {
    return await database.insert('trophies', {
      'index': trophy.index,
    });
  } catch (e) {
    print('Failed to insert trophy: $e');
    return -1;
  }
}

  Future<void> update(TrophyModel trophy) async {
    await database.update(
      'trophies',
      {'index': trophy.index,},
      where: 'id=?',
      whereArgs: [trophy.id],
    );
  }

  Future<void> delete(TrophyModel trophy) async {
    await database.delete('trophies', where: 'id=?', whereArgs: [trophy.id]);
  }
}
