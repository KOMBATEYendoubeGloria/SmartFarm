import '../database_helper.dart';
import '../../../models/legumineuse.dart';

class LegumineuseDao {
  final dbHelper = DatabaseHelper.instance;

  // -----------------------------------
  // INSERT : ajouter une légumineuse
  // -----------------------------------
  Future<int> insertLegumineuse(Legumineuse legumineuse) async {
    final db = await dbHelper.database;
    return await db.insert('Legumineuse', legumineuse.toMap());
  }

  // -------------------------------------------------
  // GET BY ID : récupérer une légumineuse par son ID
  // -------------------------------------------------
  Future<Legumineuse?> getLegumineuseById(int id) async {
    final db = await dbHelper.database;

    final res = await db.query(
      'Legumineuse',
      where: 'idLegumineuse = ?',
      whereArgs: [id],
    );

    if (res.isNotEmpty) {
      return Legumineuse.fromMap(res.first);
    }
    return null;
  }

  // ----------------------------------------------
  // GET ALL : récupérer toutes les légumineuses
  // ----------------------------------------------
  Future<List<Legumineuse>> getAllLegumineuses() async {
    final db = await dbHelper.database;

    final res = await db.query('Legumineuse');

    return res.map((map) => Legumineuse.fromMap(map)).toList();
  }

  // ----------------------------------------
  // UPDATE : modifier une légumineuse
  // ----------------------------------------
  Future<int> updateLegumineuse(Legumineuse legumineuse) async {
    final db = await dbHelper.database;

    return await db.update(
      'Legumineuse',
      legumineuse.toMap(),
      where: 'idLegumineuse = ?',
      whereArgs: [legumineuse.idLegumineuse],
    );
  }

  // -----------------------------------------
  // DELETE : supprimer une légumineuse
  // -----------------------------------------
  Future<int> deleteLegumineuse(int id) async {
    final db = await dbHelper.database;

    return await db.delete(
      'Legumineuse',
      where: 'idLegumineuse = ?',
      whereArgs: [id],
    );
  }

  // ------------------------------------------------
  // DELETE ALL : vider toute la table Legumineuse
  // ------------------------------------------------
  Future<int> deleteAllLegumineuses() async {
    final db = await dbHelper.database;
    return await db.delete('Legumineuse');
  }
}
