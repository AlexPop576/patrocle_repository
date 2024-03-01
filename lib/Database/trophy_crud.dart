import 'trophy_model.dart';
import 'database_helper.dart';

class TrophyCrud {
  final database = DatabaseHelper.instance.trophies;
  Future<List<TrophyModel>> readAll() async {
    final data = await database.query('trophies');
    return data.map((e) => TrophyModel.fromMap(e)).toList();
  }

  Future<int> insert(TrophyModel trophy) async {
    return await database.insert('trophies', {
      'index': trophy.index,
    });
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
