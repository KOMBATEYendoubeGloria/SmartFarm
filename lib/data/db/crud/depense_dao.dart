import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';
import '../../../models/depense.dart';

class DepenseDao {
  final dbHelper = DatabaseHelper.instance;

  // INSERT
  Future<int> insert(Depense depense) async {
    final db = await dbHelper.database;
    return await db.insert(
      'depenses',
      depense.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // GET ALL
  Future<List<Depense>> getAllDepenses() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> result = await db.query('depenses');

    return result.map((map) => Depense.fromMap(map)).toList();
  }

  // GET BY ID
  Future<Depense?> getDepenseById(int id) async {
    final db = await dbHelper.database;

    final List<Map<String, dynamic>> result = await db.query(
      'depenses',
      where: 'idDepense = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return Depense.fromMap(result.first);
    } else {
      return null;
    }
  }

  // UPDATE
  Future<int> updateDepense(Depense depense) async {
    final db = await dbHelper.database;

    return await db.update(
      'depenses',
      depense.toMap(),
      where: 'idDepense = ?',
      whereArgs: [depense.idDepense],
    );
  }

  // DELETE
  Future<int> deleteDepense(int id) async {
    final db = await dbHelper.database;

    return await db.delete(
      'depenses',
      where: 'idDepense = ?',
      whereArgs: [id],
    );
  }
}
