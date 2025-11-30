import 'package:sqflite/sqflite.dart';
import '../../../models/section.dart';
import '../database_helper.dart';

class SectionDao {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  /// ----------------------------
  /// 1. INSERTION
  /// ----------------------------
  Future<int> insertSection(Section section) async {
    final db = await _dbHelper.database;
    return await db.insert(
      'Section',
      section.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// ----------------------------
  /// 2. LECTURE : récupérer une section via son id
  /// ----------------------------
  Future<Section?> getSectionById(int id) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> result = await db.query(
      'Section',
      where: 'idSection = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return Section.fromMap(result.first);
    }
    return null;
  }

  /// ----------------------------
  /// 3. LECTURE : récupérer toutes les sections
  /// ----------------------------
  Future<List<Section>> getAllSections() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> results = await db.query('Section');

    return results.map((map) => Section.fromMap(map)).toList();
  }

  /// ----------------------------
  /// 4. MISE À JOUR
  /// ----------------------------
  Future<int> updateSection(Section section) async {
    final db = await _dbHelper.database;
    return await db.update(
      'Section',
      section.toMap(),
      where: 'idSection = ?',
      whereArgs: [section.idSection],
    );
  }

  /// ----------------------------
  /// 5. SUPPRESSION
  /// ----------------------------
  Future<int> deleteSection(int id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      'Section',
      where: 'idSection = ?',
      whereArgs: [id],
    );
  }
}
