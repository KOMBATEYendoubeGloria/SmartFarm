import '../database_helper.dart';
import '../../../models/employe.dart';

class EmployeDao {
  final dbHelper = DatabaseHelper.instance;

  // -----------------------------
  // INSERT : ajouter un employé
  // -----------------------------
  Future<int> insertEmploye(Employe employe) async {
    final db = await dbHelper.database;
    return await db.insert('Employe', employe.toMap());
  }

  // -------------------------------------
  // GET BY ID : récupérer un employé par ID
  // -------------------------------------
  Future<Employe?> getEmployeById(int id) async {
    final db = await dbHelper.database;

    final res = await db.query(
      'Employe',
      where: 'idEmploye = ?',
      whereArgs: [id],
    );

    if (res.isNotEmpty) {
      return Employe.fromMap(res.first);
    }
    return null;
  }

  // --------------------------------
  // GET ALL : récupérer tous les employés
  // --------------------------------
  Future<List<Employe>> getAllEmployes() async {
    final db = await dbHelper.database;

    final res = await db.query('Employe');

    return res.map((map) => Employe.fromMap(map)).toList();
  }

  // -----------------------------
  // UPDATE : modifier un employé
  // -----------------------------
  Future<int> updateEmploye(Employe employe) async {
    final db = await dbHelper.database;

    return await db.update(
      'Employe',
      employe.toMap(),
      where: 'idEmploye = ?',
      whereArgs: [employe.idEmploye],
    );
  }

  // ----------------------------
  // DELETE : supprimer un employé
  // ----------------------------
  Future<int> deleteEmploye(int id) async {
    final db = await dbHelper.database;

    return await db.delete(
      'Employe',
      where: 'idEmploye = ?',
      whereArgs: [id],
    );
  }

  // ------------------------------------
  // DELETE ALL : vider la table Employe
  // ------------------------------------
  Future<int> deleteAllEmployes() async {
    final db = await dbHelper.database;
    return await db.delete('Employe');
  }
}
 