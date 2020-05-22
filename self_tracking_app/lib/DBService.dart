import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  static Database _db;
  static const String DB_NAME = 'self_assessment_app_database.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    Batch initBatch = db.batch();
    initBatch.execute("CREATE TABLE UserDefaults (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, preferenceOption TEXT, preferenceValue TEXT)");
    initBatch.execute("CREATE TABLE FHIRResources (patientId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, patient TEXT, episodeOfCare TEXT, questionnaireResponse TEXT, careTeam TEXT, encounter TEXT, consent TEXT)");
  }




}