import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class DBLocalUtil {
  final database = openDatabase('astronacci.db');

  static const String user = 'User';

  Future<void> createTable() async {
    final db = await database;

    //Create Table User
    await db.execute(
      'CREATE TABLE if not exists User('
      'id TEXT PRIMARY KEY, '
      'email TEXT, '
      'fullname TEXT, '
      'phone TEXT, '
      'password TEXT, '
      'profilePicture TEXT)',
    );
  }

  Future<List<Map<String, Object?>>> getData(
    String table,
    dynamic query,
  ) async {
    final db = await database;

    return await db.rawQuery(
      'SELECT * FROM $table ${query.toString().isNotEmpty ? 'WHERE $query ' : ''}',
    );
  }

  Future<int> addData(
      String table, Map<String, Object?> data, String query) async {
    List<Map<String, Object?>> list = await getData(table, query);
    if (list.isEmpty) {
      return await insertData(table, data);
    } else {
      return await updateData(table, data, query);
    }
  }

  Future<int> insertData(String table, Map<String, Object?> data) async {
    final db = await database;

    return await db.insert(table, data);
  }

  Future<int> updateData(
    String table,
    Map<String, Object?> data,
    String query,
  ) async {
    final db = await database;

    return await db.update(table, data, where: query);
  }

  Future<int> deleteData(String table, dynamic query) async {
    final db = await database;

    return await db.delete(table, where: query);
  }

  Future<List<Map<String, Object?>>> getCustomQuery(dynamic query) async {
    final db = await database;

    return await db.rawQuery(query);
  }

  void dropDb() async {
    final db = await database;
    databaseFactory.deleteDatabase(db.path);
  }

  String generateUUID() {
    const uuid = Uuid();
    return uuid.v1();
  }

  Future<List<Map<String, Object?>>> getDataWithPagination(
    String table,
    String? where,
    int limit,
    int offset,
    String? orderBy,
  ) async {
    final db = await database;

    return await db.query(table,
        where: where, limit: limit, offset: offset, orderBy: orderBy);
  }
}
