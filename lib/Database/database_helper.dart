import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 17;

  static final table = 'country';
  static final tableTrophy = 'trophies';
  static final columnLesson = 'lesson';
  static final columnId = '_id';
  static final columnName = 'name';
  static final columnLessonGeography = 'lesson_geography';
  static final columnLessonHistory = 'lesson_history';
  static final columnGeographyCompleted = 'geography_completed';
  static final columnHistoryCompleted = 'history_completed';
  static final columnTrophyId = '_trophy_id';
  static final columnTrophy = 'trophy';
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
        answersGeographyEasyQ1 TEXT,
        answersGeographyEasyQ2 TEXT,
        answersGeographyEasyQ3 TEXT,
        answersGeographyEasyQ4 TEXT,
        answersGeographyHardQ1 TEXT,
        answersGeographyHardQ2 TEXT,
        answersGeographyHardQ3 TEXT,
        answersGeographyHardQ4 TEXT,
        answersHistoryEasyQ1 TEXT,
        answersHistoryEasyQ2 TEXT,
        answersHistoryEasyQ3 TEXT,
        answersHistoryEasyQ4 TEXT,
        answersHistoryHardQ1 TEXT,
        answersHistoryHardQ2 TEXT,
        answersHistoryHardQ3 TEXT,
        answersHistoryHardQ4 TEXT,
        answersGeographyEasyCorrect INTEGER,
        answersGeographyHardCorrect INTEGER,
        answersHistoryEasyCorrect INTEGER,
        answersHistoryHardCorrect INTEGER
        )
      ''');
        await db.execute('''
            CREATE TABLE trophies (
              $columnTrophyId INTEGER PRIMARY KEY AUTOINCREMENT,
              $columnTrophy INTEGER
            )''');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (newVersion > oldVersion) {
          await db.execute('DROP TABLE $table');
          //await db.execute('DROP TABLE $tableTrophy');
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
        answersGeographyEasyQ1 TEXT,
        answersGeographyEasyQ2 TEXT,
        answersGeographyEasyQ3 TEXT,
        answersGeographyEasyQ4 TEXT,
        answersGeographyHardQ1 TEXT,
        answersGeographyHardQ2 TEXT,
        answersGeographyHardQ3 TEXT,
        answersGeographyHardQ4 TEXT,
        answersHistoryEasyQ1 TEXT,
        answersHistoryEasyQ2 TEXT,
        answersHistoryEasyQ3 TEXT,
        answersHistoryEasyQ4 TEXT,
        answersHistoryHardQ1 TEXT,
        answersHistoryHardQ2 TEXT,
        answersHistoryHardQ3 TEXT,
        answersHistoryHardQ4 TEXT
        answersGeographyEasyCorrect INTEGER,
        answersGeographyHardCorrect INTEGER,
        answersHistoryEasyCorrect INTEGER,
        answersHistoryHardCorrect INTEGER
        )
      ''');

          // Copy the data from the old table to the new one

          // Delete the old table
          /*await db.execute('DROP TABLE $table');
          await db.execute('DROP TABLE countries');

          // Rename the new table to the old one's name
          await db.execute('ALTER TABLE new_table RENAME TO $table');
          */
        }
      },
    );
  }

  Future<int> insertCountry(
      String countryName,
      String lessonGeography,
      String lessonHistory,
      String easyGeographyQuestions,
      String hardGeographyQuestions,
      String easyHistoryQuestions,
      String hardHistoryQuestions,
      String EGA1,
      String EGA2,
      String EGA3,
      String EGA4,
      String HGA1,
      String HGA2,
      String HGA3,
      String HGA4,
      String EHA1,
      String EHA2,
      String EHA3,
      String EHA4,
      String HHA1,
      String HHA2,
      String HHA3,
      String HHA4,) async {
    Database db = await database;
    return await db.insert(table, {
      'name': countryName,
      'lesson_geography': lessonGeography,
      'lesson_history': lessonHistory,
      'geography_completed': 0,
      'history_completed': 0,
      'questionsGeographyEasy': easyGeographyQuestions,
      'questionsGeographyHard': hardGeographyQuestions,
      'questionsHistoryEasy': easyHistoryQuestions,
      'questionsHistoryHard': hardHistoryQuestions,
      'answersGeographyEasyQ1': EGA1,
      'answersGeographyEasyQ2': EGA2,
      'answersGeographyEasyQ3': EGA3,
      'answersGeographyEasyQ4': EGA4,
      'answersGeographyHardQ1': HGA1,
      'answersGeographyHardQ2': HGA2,
      'answersGeographyHardQ3': HGA3,
      'answersGeographyHardQ4': HGA4,
      'answersHistoryEasyQ1': EHA1,
      'answersHistoryEasyQ2': EHA2,
      'answersHistoryEasyQ3': EHA3,
      'answersHistoryEasyQ4': EHA4,
      'answersHistoryHardQ1': HHA1,
      'answersHistoryHardQ2': HHA2,
      'answersHistoryHardQ3': HHA3,
      'answersHistoryHardQ4': HHA4,
    });
  }

  Future<int> insertTrophy(int trophy) async {
    Database db = await database;
    return await db.insert(tableTrophy, {'trophy': trophy});
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table, orderBy: '$columnId ASC');
  }

  Future<List<Map<String, dynamic>>> queryTrophies() async {
    Database db = await instance.database;
    return await db.query(tableTrophy, orderBy: '$columnTrophyId ASC');
  }

  Future<int> deleteCountry(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteTrophy(int id) async {
    Database db = await instance.database;
    return await db
        .delete(tableTrophy, where: '$columnTrophyId = ?', whereArgs: [id]);
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
