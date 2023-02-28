// ignore_for_file: empty_catches

import 'package:sqflite/sqflite.dart' as sql;

class UserHelpers {
  // Create and Connect DataBase

  static Future<void> createTable(sql.Database database) async {
    await database.execute('''
      CREATE TABLE data (
        id INTEGER PRIMARYKEY AUTO_INCREMENT,
        name Text,
        email Text,
        age INTEGER,
        weight DOUBLE,
        phone Text
      )
    ''');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'db_users.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTable(database);
      },
    );
  }

  static Future<int> createData(
      String name, String email, int age, double weight, String phone) async {
    final db = await UserHelpers.db();

    final data = {
      'name': name,
      'email': email,
      'age': age,
      'weight': weight,
      'phone': phone
    };
    final id = await db.insert('data', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await UserHelpers.db();
    return db.query('data', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getSingleData(int id) async {
    final db = await UserHelpers.db();
    return db.query('data', where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateData(int id, String name, String email, int age,
      double weight, String phone) async {
    final db = await UserHelpers.db();
    final data = {
      'name': name,
      'email': email,
      'age': age,
      'weight': weight,
      'phone': phone
    };
    final result =
        await db.update('data', data, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  static Future<void> deleteData(int id) async {
    final db = await UserHelpers.db();
    try {
      await db.delete('data', where: 'id = ?', whereArgs: [id]);
    } catch (e) {}
  }
}
