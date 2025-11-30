import '../database_helper.dart';
import '../../../models/rendement.dart';

class RendementDao {
  final dbHelper = DatabaseHelper.instance;

  // -----------------------------------
  // INSERT : ajouter un rendement
  // -----------------------------------
  Future<int> insertRendement(Rendement rendement) async {
    final db = await dbHelper.database;
    return await db.insert('Rendement', rendement.toMap());
  }

  // -------------------------------------------------
  // GET BY ID : récupérer un rendement par son ID
  // -------------------------------------------------
  Future<Rendement?> getRendementById(int id) async {
    final db = await dbHelper.database;

    final res = await db.query(
      'Rendement',
      where: 'idRendement = ?',
      whereArgs: [id],
    );

    if (res.isNotEmpty) {
      return Rendement.fromMap(res.first);
    }
    return null;
  }

  // ----------------------------------------------
  // GET ALL : récupérer tous les rendements
  // ----------------------------------------------
  Future<List<Rendement>> getAllRendements() async {
    final db = await dbHelper.database;

    final res = await db.query('Rendement');

    return res.map((map) => Rendement.fromMap(map)).toList();
  }

  // ------------------------------------------------------
  // GET BY SECTION : récupérer les rendements d'une section
  // ------------------------------------------------------
  Future<List<Rendement>> getRendementsBySection(int idSection) async {
    final db = await dbHelper.database;

    final res = await db.query(
      'Rendement',
      where: 'idSection = ?',
      whereArgs: [idSection],
    );

    return res.map((m) => Rendement.fromMap(m)).toList();
  }

  // -------------------------------------------------
  // GET BY MOIS + ANNÉE : pratique pour tes analyses
  // -------------------------------------------------
  Future<Rendement?> getRendementByDate(int mois, int annee) async {
    final db = await dbHelper.database;

    final res = await db.query(
      'Rendement',
      where: 'moisRendement = ? AND anneeRendement = ?',
      whereArgs: [mois, annee],
    );

    if (res.isNotEmpty) {
      return Rendement.fromMap(res.first);
    }
    return null;
  }

  // ----------------------------------------
  // UPDATE : modifier un rendement
  // ----------------------------------------
  Future<int> updateRendement(Rendement rendement) async {
    final db = await dbHelper.database;

    return await db.update(
      'Rendement',
      rendement.toMap(),
      where: 'idRendement = ?',
      whereArgs: [rendement.idRendement],
    );
  }

  // -----------------------------------------
  // DELETE : supprimer un rendement
  // -----------------------------------------
  Future<int> deleteRendement(int id) async {
    final db = await dbHelper.database;

    return await db.delete(
      'Rendement',
      where: 'idRendement = ?',
      whereArgs: [id],
    );
  }

  // ------------------------------------------------
  // DELETE ALL : vider toute la table Rendement
  // ------------------------------------------------
  Future<int> deleteAllRendements() async {
    final db = await dbHelper.database;
    return await db.delete('Rendement');
  }
}
