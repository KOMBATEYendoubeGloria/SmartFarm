import 'package:sqflite/sqflite.dart';
import '../../../models/cultive_sur.dart';
import '../database_helper.dart';

class CultiveSurDao {
  final tableName = 'cultive_sur';

  // 🔹 Création de la table
  Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        idSection INTEGER NOT NULL,
        idLegumineuse INTEGER NOT NULL,
        PRIMARY KEY (idSection, idLegumineuse)
      )
    ''');
  }

  // 🔹 Insérer : retourne le nombre de lignes ajoutées
  Future<int> insertCultiveSur(CultiveSur c) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert(
      tableName,
      c.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, // gestion doublons
    );
  }

  // 🔹 Lire toutes les lignes
  Future<List<CultiveSur>> getAll() async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(tableName);

    return result.map((e) => CultiveSur.fromMap(e)).toList();
  }

  // 🔹 Lire une relation précise (clé composite)
  Future<CultiveSur?> getOne(int idSection, int idLegumineuse) async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query(
      tableName,
      where: "idSection = ? AND idLegumineuse = ?",
      whereArgs: [idSection, idLegumineuse],
    );

    if (result.isNotEmpty) {
      return CultiveSur.fromMap(result.first);
    }
    return null;
  }

  // 🔹 Supprimer une relation précise
  Future<int> delete(int idSection, int idLegumineuse) async {
    final db = await DatabaseHelper.instance.database;

    return await db.delete(
      tableName,
      where: "idSection = ? AND idLegumineuse = ?",
      whereArgs: [idSection, idLegumineuse],
    );
  }

  // 🔹 Supprimer tout
  Future<int> deleteAll() async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete(tableName);
  }
}
