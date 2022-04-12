import 'package:appagenda/src/core/constants/constants.dart';
import 'package:appagenda/src/data/models/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper.internal();

  late Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    const databasesPath = getDatabasesPath;
    final path = join(databasesPath.toString(), "contatctsnew.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $kContatcTable($kIdColumn INTEGER PRIMARY KEY, $kNameColumn TEXT, $kEmailColumn TEXT, $kPhoneColumn Text)");
    });
  }

  Future<ContactModel> saveContact(ContactModel contactModel) async {
    Database dbContact = await db;
    contactModel.id =
        await dbContact.insert(kContatcTable, contactModel.toMap());
    return contactModel;
  }

  Future<ContactModel?> getContact(int id) async {
    Database dbContact = await db;
    List<Map<String, dynamic>> maps = await dbContact.query(
      kContatcTable,
      columns: [kIdColumn, kNameColumn, kEmailColumn, kPhoneColumn],
      where: "$kIdColumn = ?",
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ContactModel.fromMap(maps.first);
    } else {
      return null;
    }
  }
}
