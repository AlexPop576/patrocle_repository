import 'country_model.dart';
import 'database_helper.dart';

class CountryCrud {
  final database = DatabaseHelper.instance.db;
  Future<List<CountryModel>> readAll() async {
    final data = await database.query('countries');
    return data.map((e) => CountryModel.fromMap(e)).toList();
  }

  Future<int> insert(CountryModel country) async {
    return await database.insert('countries', {
      'name': country.name,
    });
  }

  Future<void> update(CountryModel country) async {
    await database.update(
      'countries',
      {'name': country.name,},
      where: 'id=?',
      whereArgs: [country.id],
    );
  }

  Future<void> delete(CountryModel country) async {
    await database.delete('countries', where: 'id=?', whereArgs: [country.id]);
  }
}
