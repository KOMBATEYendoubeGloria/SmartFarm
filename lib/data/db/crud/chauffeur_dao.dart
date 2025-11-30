import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';
import '../../../models/Chauffeur.dart';

class ChauffeurDao {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  /// ---------------------------------------------------------
  /// 1. INSERTION D'UN CHAUFFEUR
  /// ---------------------------------------------------------
  Future<int> insertChauffeur(Chauffeur chauffeur) async {
    final db = await _dbHelper.database;

    return await db.insert(
      'Chauffeur',
      chauffeur.topMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// ---------------------------------------------------------
  /// 2. RÉCUPÉRER UN CHAUFFEUR PAR ID
  /// ---------------------------------------------------------
  Future<Chauffeur?> getChauffeur(int id) async {
    final db = await _dbHelper.database;

    final List<Map<String, dynamic>> result = await db.query(
      'Chauffeur',
      where: 'idChauffeur = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return Chauffeur.fromMap(result.first);
    }
    return null;
  }

  /// ---------------------------------------------------------
  /// 3. RÉCUPÉRER TOUS LES CHAUFFEURS
  /// ---------------------------------------------------------
  Future<List<Chauffeur>> getAllChauffeurs() async {
    final db = await _dbHelper.database;

    final List<Map<String, dynamic>> results = await db.query('Chauffeur');

    return results.map((map) => Chauffeur.fromMap(map)).toList();
  }

  /// ---------------------------------------------------------
  /// 4. METTRE À JOUR UN CHAUFFEUR
  /// ---------------------------------------------------------
  Future<int> updateChauffeur(Chauffeur chauffeur) async {
    final db = await _dbHelper.database;

    return await db.update(
      'Chauffeur',
      chauffeur.topMap(),
      where: 'idChauffeur = ?',
      whereArgs: [chauffeur.idChauffeur],
    );
  }

  /// ---------------------------------------------------------
  /// 5. SUPPRIMER UN CHAUFFEUR PAR ID
  /// ---------------------------------------------------------
  Future<int> deleteChauffeur(int id) async {
    final db = await _dbHelper.database;

    return await db.delete(
      'Chauffeur',
      where: 'idChauffeur = ?',
      whereArgs: [id],
    );
  }
}
