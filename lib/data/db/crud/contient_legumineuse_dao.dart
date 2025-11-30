import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';
import '../../../models/contient_legumineuse.dart';

class ContientLegumineuseDao {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  /// ---------------------------------------------------------
  /// 1. INSERTION
  /// ---------------------------------------------------------
  Future<int> insertContient(ContientLegumineuse cl) async {
    final db = await _dbHelper.database;

    return await db.insert(
      'ContientLegumineuse',
      cl.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// ---------------------------------------------------------
  /// 2. RÉCUPÉRER UNE ASSOCIATION SPÉCIFIQUE
  /// ---------------------------------------------------------
  Future<ContientLegumineuse?> getContient(int idLeg, int idLiv) async {
    final db = await _dbHelper.database;

    final List<Map<String, dynamic>> result = await db.query(
      'ContientLegumineuse',
      where: 'idLegumineuse = ? AND idLivraison = ?',
      whereArgs: [idLeg, idLiv],
    );

    if (result.isNotEmpty) {
      return ContientLegumineuse.fromMap(result.first);
    }

    return null;
  }

  /// ---------------------------------------------------------
  /// 3. RÉCUPÉRER TOUTES LES LIGNES
  /// ---------------------------------------------------------
  Future<List<ContientLegumineuse>> getAll() async {
    final db = await _dbHelper.database;

    final List<Map<String, dynamic>> results =
        await db.query('ContientLegumineuse');

    return results.map((map) => ContientLegumineuse.fromMap(map)).toList();
  }

  /// ---------------------------------------------------------
  /// 4. METTRE À JOUR UNE QUANTITÉ
  /// ---------------------------------------------------------
  Future<int> updateContient(ContientLegumineuse cl) async {
    final db = await _dbHelper.database;

    return await db.update(
      'ContientLegumineuse',
      cl.toMap(),
      where: 'idLegumineuse = ? AND idLivraison = ?',
      whereArgs: [cl.idLegumineuse, cl.idLivraison],
    );
  }

  /// ---------------------------------------------------------
  /// 5. SUPPRIMER UNE LIGNE
  /// ---------------------------------------------------------
  Future<int> deleteContient(int idLeg, int idLiv) async {
    final db = await _dbHelper.database;

    return await db.delete(
      'ContientLegumineuse',
      where: 'idLegumineuse = ? AND idLivraison = ?',
      whereArgs: [idLeg, idLiv],
    );
  }
}
