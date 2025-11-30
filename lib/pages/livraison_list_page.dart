import 'package:flutter/material.dart';
import '../data/db/crud/livraison_dao.dart';
import '../../models/livraison.dart';
import 'add_livraison_page.dart';

class LivraisonListPage extends StatefulWidget {
  const LivraisonListPage({super.key});

  @override
  State<LivraisonListPage> createState() => _LivraisonListPageState();
}

class _LivraisonListPageState extends State<LivraisonListPage> {
  final dao = LivraisonDao();
  late Future<List<Livraison>> livraisons;

  @override
  void initState() {
    super.initState();
    livraisons = dao.getAllLivraisons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des Livraisons"),
        backgroundColor: Colors.blue,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (_) => const AddLivraisonPage()),
          ).then((_) => setState(() {
              livraisons = dao.getAllLivraisons();
          }));
        },
        child: const Icon(Icons.add),
      ),

      body: FutureBuilder<List<Livraison>>(
        future: livraisons,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Center(
              child: Text("Aucune livraison enregistrée",
                style: TextStyle(fontSize: 18)),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final l = data[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 4,
                child: ListTile(
                  leading: const Icon(Icons.local_shipping, color: Colors.blue),
                  title: Text("Véhicule: ${l.matriculeVehicule}"),
                  subtitle: Text(
                    "De ${l.depart} → ${l.arrivee}\n"
                    "Distance: ${l.distanceLivraison} km | "
                    "Estimation: ${l.estimationTempLivraison} h"
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await dao.deleteLivraison(l.idLivraison!);
                      setState(() {
                        livraisons = dao.getAllLivraisons();
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
