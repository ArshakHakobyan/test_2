import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;

class DatabaseHelper {
  static const _databaseName = "telCell.db";
  static const _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    //
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    //
    bool fileExists = await databaseExists(path);

    // copy from assets
    if (!fileExists) await _copyDatabaseFromAssets(path);

    // open database
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // copy from assets method
  Future<void> _copyDatabaseFromAssets(String path) async {
    ByteData data = await rootBundle.load(join("assets", _databaseName));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
  }

  // create Tab method
  // create Tab method
  Future<void> _onCreate(Database db, int version) async {
    bool tableExists = await _checkIfTableExists(db, 'credit_cards');
    if (!tableExists) {
      await db.execute(
        "CREATE TABLE credit_cards (id TEXT PRIMARY KEY, card_number INTEGER, card_holder TEXT, expiration_date INTEGER)",
      );
    }
  }

// Check if table exists method
  Future<bool> _checkIfTableExists(Database db, String tableName) async {
    var res = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName'",
    );
    return res.isNotEmpty;
  }

  // Read from database
  Future<List<Map<String, dynamic>>> readDataFromDatabase() async {
    Database db = await instance.database;
    return await db.query('credit_cards');
  }

// for add into db
  Future<int> insertDataToDatabase({
    required String id,
    required int cardNumber,
    required String cardHolder,
    required int expirationDate,
  }) async {
    final db = await instance.database;
    return await db.insert(
      'credit_cards',
      {
        'id': id,
        'card_number': cardNumber,
        'card_holder': cardHolder,
        'expiration_date': expirationDate,
      },
    );
  }
}
