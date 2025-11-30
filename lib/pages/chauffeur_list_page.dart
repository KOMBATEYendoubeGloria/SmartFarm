import 'package:flutter/material.dart';
import '../data/db/crud/chauffeur_dao.dart';
import '../../models/Chauffeur.dart';
import 'add_chauffeur_page.dart';

class ChauffeurListPage extends StatefulWidget {
  const ChauffeurListPage({super.key});

  @override
  State<ChauffeurListPage> createState() => _ChauffeurListPageState();
}

class _ChauffeurListPageState extends State<ChauffeurListPage> {
  final dao = ChauffeurDao();
  late Future<List<Chauffeur>> chauffeurs;

  @override
  void initState() {
    super.initState();
    chauffeurs = dao.getAllChauffeurs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des Chauffeurs"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddChauffeurPage()),
          ).then((_) => setState(() {
                chauffeurs = dao.getAllChauffeurs();
              }));
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Chauffeur>>(
        future: chauffeurs,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Center(
              child: Text(
                "Aucun chauffeur enregistré",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final c = data[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 18),
                elevation: 4,
                child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.blue),
                  title: Text(c.nomCompletChauffeur ?? "—"),
                  subtitle: Text(
                      "Permis : ${c.permisChauffeur ?? ''}\nDisponibilité : ${c.disponibiliteChauffeur ?? ''}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await dao.deleteChauffeur(c.idChauffeur ?? 0);
                      setState(() {
                        chauffeurs = dao.getAllChauffeurs();
                      });
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
