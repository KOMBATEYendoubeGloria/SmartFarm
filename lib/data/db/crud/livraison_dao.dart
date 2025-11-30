import '../database_helper.dart';
import '../../../models/livraison.dart';

class LivraisonDao {
  final dbHelper = DatabaseHelper.instance;

  // -----------------------------------
  // INSERT : ajouter une livraison
  // -----------------------------------
  Future<int> insertLivraison(Livraison livraison) async {
    final db = await dbHelper.database;
    return await db.insert('Livraison', livraison.toMap());
  }

  // -------------------------------------------------
  // GET BY ID : récupérer une livraison par son ID
  // -------------------------------------------------
  Future<Livraison?> getLivraisonById(int id) async {
    final db = await dbHelper.database;

    final res = await db.query(
      'Livraison',
      where: 'idLivraison = ?',
      whereArgs: [id],
    );

    if (res.isNotEmpty) {
      return Livraison.fromMap(res.first);
    }
    return null;
  }

  // ----------------------------------------------
  // GET ALL : récupérer toutes les livraisons
  // ----------------------------------------------
  Future<List<Livraison>> getAllLivraisons() async {
    final db = await dbHelper.database;

    final res = await db.query('Livraison');

    return res.map((map) => Livraison.fromMap(map)).toList();
  }

  // ----------------------------------------
  // UPDATE : modifier une livraison
  // ----------------------------------------
  Future<int> updateLivraison(Livraison livraison) async {
    final db = await dbHelper.database;

    return await db.update(
      'Livraison',
      livraison.toMap(),
      where: 'idLivraison = ?',
      whereArgs: [livraison.idLivraison],
    );
  }

  // -----------------------------------------
  // DELETE : supprimer une livraison
  // -----------------------------------------
  Future<int> deleteLivraison(int id) async {
    final db = await dbHelper.database;

    return await db.delete(
      'Livraison',
      where: 'idLivraison = ?',
      whereArgs: [id],
    );
  }

  // ------------------------------------------------
  // DELETE ALL : vider toute la table Livraison
  // ------------------------------------------------
  Future<int> deleteAllLivraisons() async {
    final db = await dbHelper.database;
    return await db.delete('Livraison');
  }
}
