import 'package:flutter/material.dart';
import 'package:gym_app/models/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class UserHelpers {
  // Table Structure
  String tableName = 'tbl_users';
  String colId = 'id';
  String colName = 'name';
  String colEmail = 'email';
  String colAge = 'age';
  String colWeight = 'weight';
  String colPhone = 'phone';

  // Create and Connect DataBase

  void _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $colId INTEGER PRIMARYKEY AUTOINCREMENT,
        $colName Text,
        $colEmail Text,
        $colAge INTEGER,
        $colWeight DOUBLE,
        $colPhone Text
      )
    ''');
  }

  static UserHelpers? _databasehelper;
  static Database? _database;

  UserHelpers._createInstance();

  factory UserHelpers() {
    _databasehelper ??= UserHelpers._createInstance();
    return _databasehelper!;
  }

  Future<Database> get database async {
    _database ??= await InitializeDB();
    return _database!;
  }

  Future<Database> InitializeDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String way = directory.path + 'dbusers.db';

    var db = await openDatabase(way, version: 1, onCreate: _createTable);
    return db;
  }
}
