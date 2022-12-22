import 'package:first_app/helpers/database_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user.dart';

class LoginHelper {
  DatabaseHelper con = DatabaseHelper();

  Future saveUser(User user) async {
    var dbClient = await con.db;
    dbClient.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<User> login(String email, String pwd) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM users WHERE email = '$email' and password = '$pwd'");
    if (res.isNotEmpty) {
      return User.fromMap(res.first);
    }
    return User();
  }

  Future<List<User>> getUsers() async {
    var dbClient = await con.db;
    var res = await dbClient.query('users');
    List<User> list =
        res.isNotEmpty ? res.map((e) => User.fromMap(e)).toList() : [];
    return list;
  }
}
