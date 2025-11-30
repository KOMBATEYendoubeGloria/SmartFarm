import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



class DatabaseHelper {
  //Initalisation de la base de données
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('ma_base.db');
    return _database!;
  }

  //Création de la base de données
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {

  await db.execute('''
  CREATE TABLE Section (
    idSection INTEGER PRIMARY KEY AUTOINCREMENT,
    superficieSection REAL
  )
''');

    await db.execute('''
      CREATE TABLE Depense (
        idDepense INTEGER PRIMARY KEY AUTOINCREMENT,
        idSection INTEGER,
        jourDepense INTEGER,
        moisDepense INTEGER,
        anneeDepense INTEGER,
        valeurDepense REAL,
        motifDepense TEXT,
        FOREIGN KEY (idSection) REFERENCES Section(idSection)
      )
    ''');
    await db.execute('''
          CREATE TABLE Rendement(
            idRendement INTEGER PRIMARY KEY AUTOINCREMENT,
            idSection INTEGER,
            moisRendement INTEGER,
            anneeRendement INTEGER,
            rendementFinancier REAL,
            rendementPhysique REAL
            FOREIGN KEY (idSection) REFERENCES Section(idSection)
          )

''');

    await db.execute('''
        CREATE TABLE Legumnieuse(
            idLegumineuse INTEGER PRIMARY KEY AUTOINCREMENT,
            nomLegumineuse VARCHAR(50)
        )
''');

  await db.execute(
    '''
    CREATE TABLE CultiveSur(
      idSection INTEGER,
      idLegumineuse INTEGER,
      FOREIGN KEY (idSection) REFERENCES Section(idSection),
      FOREIGN KEY (idLegumineuse)  REFERENCES Legumineuse(idLegumineuse),
      PRIMARY KEY (idSection,idLegumineuse)
    )
'''
  );

  await db.execute('''
      CREATE TABLE Vehicule(
          matriculeVehicule VARCHAR(30) PRIMARY KEY,
          consommationVehicule REAL,
          capaciteMaxVehicule REAL
      )
''');

  await db.execute('''
      CREATE TABLE Livraison(
        idLivraison INTEGER PRIMARY KEY AUTOINCREMENT,
        String matriculeVehicule,
        distanceLivraison REAL,
        carburantLivraison REAL,
        depart VARCHAR(100),
        arrivee VARCHAR(100),
        estimationTempLivraison REAL,
        tempReelLivraison REAL,
        FOREIGN KEY (matriculeVehicule) REFERENCES Vehicule(matriculeVehicule)
      )
''');

  await db.execute('''
      CREATE TABLE ContientLegumineuse(
      idLegumineuse INTEGER,
      idLivraison INTEGER,
      qteLegumineuse INTEGER,
      FOREIGN KEY (idLegumineuse) REFERENCES Legumineuse(idLegumineuse),
      FOREIGN KEY (idLivraison) REFERENCES Livraison(idLivraison),
      PRIMARY KEY (idLegumineuse,idLivraison)
      )
''');

  await db.execute('''
      CREATE TABLE(
          idEmploye INTEGER PRIMARY KEY AUTOINCREMENT,
          nomCompletEmploye VARCHAR(100),
          ageEmploye INTEGER,
          posteEmploye VARCHAR(200)
      )
''');

    await db.execute('''
        CREATE TABLE Chauffeur(
            idChauffeur INTEGER PRIMARY KEY AUTOINCREMENT,
            nomCompletChauffeur VARCHAR(100),
            permisChauffeur VARCHAR(10),
            disponibiliteChauffeur VARCHAR(20)
        )
''');

    await db.execute('''
            CREATE TABLE AffecterEmploye(
              idEmploye INTEGER,
              idSection INTEGER,
              qteEmploye,
              FOREIGN KEY (idEmploye) REFERENCES Employe(idEmploye),
              FOREIGN KEY (idSection) REFERENCES Section(idSection),
              PRIMARY KEY (idEmploye,idSection)
            )
      ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}