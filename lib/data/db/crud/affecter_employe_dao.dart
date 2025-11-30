import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';
import '../../../models/affecter_employe.dart';

class AffecterEmployeDao {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  /// ---------------------------------------------------------
  /// 1. INSERTION
  /// ---------------------------------------------------------
  Future<int> insertAffectation(AffecterEmploye affectation) async {
    final db = await _dbHelper.database;
    return await db.insert(
      'AffecterEmploye',
      affectation.topMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// ---------------------------------------------------------
  /// 2. LECTURE : récupérer une affectation précise
  /// ---------------------------------------------------------
  Future<AffecterEmploye?> getAffectation(int idEmploye, int idSection) async {
    final db = await _dbHelper.database;

    final result = await db.query(
      'AffecterEmploye',
      where: 'idEmploye = ? AND idSection = ?',
      whereArgs: [idEmploye, idSection],
    );

    if (result.isNotEmpty) {
      return AffecterEmploye.fromMap(result.first);
    }
    return null;
  }

  /// ---------------------------------------------------------
  /// 3. LECTURE : toutes les affectations
  /// ---------------------------------------------------------
  Future<List<AffecterEmploye>> getAllAffectations() async {
    final db = await _dbHelper.database;

    final List<Map<String, dynamic>> results = await db.query('AffecterEmploye');

    return results.map((map) => AffecterEmploye.fromMap(map)).toList();
  }

  /// ---------------------------------------------------------
  /// 4. MISE À JOUR : modifier la quantité d'employés affectés
  /// ---------------------------------------------------------
  Future<int> updateAffectation(AffecterEmploye affectation) async {
    final db = await _dbHelper.database;

    return await db.update(
      'AffecterEmploye',
      affectation.topMap(),
      where: 'idEmploye = ? AND idSection = ?',
      whereArgs: [affectation.idEmploye, affectation.idSection],
    );
  }

  /// ---------------------------------------------------------
  /// 5. SUPPRESSION : retirer une affectation
  /// ---------------------------------------------------------
  Future<int> deleteAffectation(int idEmploye, int idSection) async {
    final db = await _dbHelper.database;

    return await db.delete(
      'AffecterEmploye',
      where: 'idEmploye = ? AND idSection = ?',
      whereArgs: [idEmploye, idSection],
    );
  }
}
