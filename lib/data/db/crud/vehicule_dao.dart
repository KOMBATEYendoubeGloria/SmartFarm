import 'package:sqflite/sqflite.dart';
import '../../../models/vehicule.dart';
import '../database_helper.dart';

class VehiculeDao {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  /// ---------------------------------------------------------
  /// 1. INSERTION : Ajouter un véhicule
  /// ---------------------------------------------------------
  Future<int> insertVehicule(Vehicule vehicule) async {
    final db = await _dbHelper.database;
    return await db.insert(
      'Vehicule',
      vehicule.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// ---------------------------------------------------------
  /// 2. LECTURE : Récupérer un véhicule par son matricule
  /// ---------------------------------------------------------
  Future<Vehicule?> getVehiculeByMatricule(String matricule) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> result = await db.query(
      'Vehicule',
      where: 'matriculeVehicule = ?',
      whereArgs: [matricule],
    );

    if (result.isNotEmpty) {
      return Vehicule.fromMap(result.first);
    }
    return null;
  }

  /// ---------------------------------------------------------
  /// 3. LECTURE : Récupérer tous les véhicules
  /// ---------------------------------------------------------
  Future<List<Vehicule>> getAllVehicules() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> results = await db.query('Vehicule');

    return results.map((map) => Vehicule.fromMap(map)).toList();
  }

  /// ---------------------------------------------------------
  /// 4. MISE À JOUR : Modifier un véhicule
  /// ---------------------------------------------------------
  Future<int> updateVehicule(Vehicule vehicule) async {
    final db = await _dbHelper.database;

    return await db.update(
      'Vehicule',
      vehicule.toMap(),
      where: 'matriculeVehicule = ?',
      whereArgs: [vehicule.matriculeVehicule],
    );
  }

  /// ---------------------------------------------------------
  /// 5. SUPPRESSION : Supprimer un véhicule
  /// ---------------------------------------------------------
  Future<int> deleteVehicule(String matricule) async {
    final db = await _dbHelper.database;

    return await db.delete(
      'Vehicule',
      where: 'matriculeVehicule = ?',
      whereArgs: [matricule],
    );
  }
}
