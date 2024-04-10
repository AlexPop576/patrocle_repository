import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 13;

  static final table = 'country';
  static final columnLesson = 'lesson';
  static final columnId = '_id';
  static final columnName = 'name';
  static final columnLessonGeography = 'lesson_geography';
  static final columnLessonHistory = 'lesson_history';
  static final columnGeographyCompleted = 'geography_completed';
  static final columnHistoryCompleted = 'history_completed';
  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE $table (
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnLessonGeography TEXT,
        $columnLessonHistory TEXT,
        $columnGeographyCompleted INTEGER,
        $columnHistoryCompleted INTEGER,
        questionsGeographyEasy TEXT,
        questionsGeographyHard TEXT,
        questionsHistoryEasy TEXT,
        questionsHistoryHard TEXT,
        answersGeographyEasy TEXT,
        answersGeographyHard TEXT,
        answersHistoryEasy TEXT,
        answersHistoryHard TEXT
        )
      ''');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (newVersion > oldVersion) {
          // Create a new table with the new schema
          await db.execute('''
      CREATE TABLE new_table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnLessonGeography TEXT,
        $columnLessonHistory TEXT,
        $columnGeographyCompleted INTEGER,
        $columnHistoryCompleted INTEGER,
        questionsGeographyEasy TEXT,
        questionsGeographyHard TEXT,
        questionsHistoryEasy TEXT,
        questionsHistoryHard TEXT,
        answersGeographyEasy TEXT,
        answersGeographyHard TEXT,
        answersHistoryEasy TEXT,
        answersHistoryHard TEXT
      )
    ''');

          // Copy the data from the old table to the new one

          // Delete the old table
          await db.execute('DROP TABLE $table');
          await db.execute('DROP TABLE countries');

          // Rename the new table to the old one's name
          await db.execute('ALTER TABLE new_table RENAME TO $table');
        }
      },
    );
  }

  // Helper methods

  Future<int> insert(
      String countryName, String lessonGeography, String lessonHistory) async {
    Database db = await database;
    return await db.insert(table, {
      'name': countryName,
      'lesson_geography': lessonGeography,
      'lesson_history': lessonHistory
    });
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table, orderBy: '$columnId ASC');
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<void> clearTableAndResetId(String tableName) async {
    final db = _databaseName;
    if (db != null) {
      /*await db.transaction((txn) async {
        // Delete ALL
        await txn.rawDelete('DELETE FROM $tableName');
        // Reset  :)
        await txn.rawUpdate(
            'DELETE FROM sqlite_sequence WHERE name = ?', [tableName]);
      });*/
    }
  }

  Future<void> decreaseMaxId(String tableName) async {
    final db = _databaseName;
    if (db != null) {
      /*// Get the maximum ID
      final maxIdResult =
          await db.rawQuery('SELECT MAX(id) as max_id FROM $tableName');
      final maxId = maxIdResult.first['max_id'] as int? ?? 1;
      // Set the ID to maxId - 1
      await db.rawUpdate('UPDATE sqlite_sequence SET seq = ? WHERE name = ?',
          [maxId - 1, tableName]);*/
    }
  }
}
