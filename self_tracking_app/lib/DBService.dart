import 'dart:async';
import 'package:path/path.dart';
import 'package:selftrackingapp/models/FHIRResources.dart';
import 'package:selftrackingapp/models/UserDefaults.dart';
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
    await initBatch.commit(noResult: true);
  }

  Future<FHIRResources> saveFHIRResources(FHIRResources fhirResources) async {
    var dbClient = await db;
    fhirResources.patientId = await dbClient.insert('FHIRResources', fhirResources.toMap());
    return fhirResources;
  }

  Future<UserDefaults> saveUserDefaults(UserDefaults userDefaults) async {
    var dbClient = await db;
    userDefaults.id = await dbClient.insert('UserDefaults', userDefaults.toMap());
    return userDefaults;
  }

  Future<int> updateFHIRResources(FHIRResources fhirResources) async {
    var dbClient = await db;
    return await dbClient.update('FHIRResources', fhirResources.toMap(),
        where: 'patientId = ?', whereArgs: [fhirResources.patientId]);
  }

  Future<int> updateUserDefaults(UserDefaults userDefaults) async {
    var dbClient = await db;
    return await dbClient.update('UserDefaults' , userDefaults.toMap(),
        where: 'id = ?', whereArgs: [userDefaults.id]);
  }

  Future<int> delete(int id, String tableName) async {
    var dbClient = await db;
    var uniqueKey = tableName == 'FHIRResources' ? 'patientId' : 'id';
    return await dbClient.delete(tableName, where: '$uniqueKey = ?', whereArgs: [id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }

  Future<List<Map<String, dynamic>>> getBySqlQuery(String query) async {
    var dbClient = await db;
    return await dbClient.rawQuery(query);
  }








}