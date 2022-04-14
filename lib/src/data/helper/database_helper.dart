import 'package:appagenda/src/data/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._();

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _databaseHelper;
  }

  Future<Database> initDb() async {
    String path = await getDatabasesPath();
    final db = await openDatabase(
      join(path, 'users_demo.db'),
      onCreate: (database, version) async {
        await database.execute(
          """
            CREATE TABLE IF NOT EXISTS users (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              name TEXT NOT NULL,
              age INTEGER NOT NULL, 
              email TEXT NOT NULL
            )
          """,
        );
      },
      version: 1,
    );
    return db;
  }

  Future<int> insertUser(UserModel user) async {
    final connection = await initDb();
    int result = await connection.insert('users', user.toMap());
    return result;
  }

  Future<int> updateUser(UserModel user) async {
    final connection = await initDb();
    int result = await connection.update(
      'users',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
    return result;
  }

  Future<void> deleteUser(int id) async {
    final connection = await initDb();
    await connection.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<UserModel>> getAllUsers() async {
    final connection = await initDb();
    final List<Map<String, Object?>> queryResult =
        await connection.query('users');
    return queryResult.map((e) => UserModel.fromMap(e)).toList();
  }
}
