import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user_model.dart';

class UserHelpers {
  static Database? _db;

  static const String DB_Name = 'userdb.db';
  static const String Table_User = 'users';
  static const int Version = 1;

  static const String C_UserID = 'userId';
  static const String C_UserName = 'userName';
  static const String C_Email = 'email';
  static const String C_Password = 'password';

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDB();
    return _db!;
  }

  initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $Table_User ($C_UserID TEXT PRIMARY KEY, $C_UserName TEXT, $C_Email TEXT, $C_Password TEXT)',
    );
  }

  Future<UserModel> saveData(UserModel user) async {
    var dbClient = await db;
    user.userId = dbClient.insert(Table_User, user.toMap()).toString();
    return user;
  }
}
