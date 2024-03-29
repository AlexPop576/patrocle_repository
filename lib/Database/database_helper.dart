import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._internal();
  static DatabaseHelper get instance =>
      _databaseHelper ??= DatabaseHelper._internal();
  Database? _db;
  Database get db => _db!;

  Future<void> init() async {
    _db = await openDatabase('database.db', version: 3, onCreate: (db, version) {
  db.execute('CREATE TABLE trophies (id INTEGER PRIMARY KEY AUTOINCREMENT, index INT)');
  db.execute('CREATE TABLE countries (id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(255))');
  
}, onUpgrade: (db, oldVersion, newVersion) {
  if (newVersion > oldVersion) {
    // Upgrade database, create trophies table if it doesn't exist
    db.execute('CREATE TABLE IF NOT EXISTS trophies (id INTEGER PRIMARY KEY AUTOINCREMENT, index INT)');
  }
});
try {
    await _db!.rawQuery('SELECT * FROM trophies');
  } catch (e) {
    print('Error when selecting from trophies table: $e');
  }
    print('Finished creating tables.');
  }

  Future<void> clearTableAndResetId(String tableName) async {
    final db = _db;
    if (db != null) {
      await db.transaction((txn) async {
        // Delete ALL
        await txn.rawDelete('DELETE FROM $tableName');
        // Reset  :)
        await txn.rawUpdate(
            'DELETE FROM sqlite_sequence WHERE name = ?', [tableName]);
      });
    }
  }

  Future<void> decreaseMaxId(String tableName) async {
    final db = _db;
    if (db != null) {
      // Get the maximum ID
      final maxIdResult =
          await db.rawQuery('SELECT MAX(id) as max_id FROM $tableName');
      final maxId = maxIdResult.first['max_id'] as int? ?? 1;
      // Set the ID to maxId - 1
      await db.rawUpdate('UPDATE sqlite_sequence SET seq = ? WHERE name = ?',
          [maxId - 1, tableName]);
    }
  }
  
}