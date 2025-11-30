import 'package:flutter/material.dart';
import '../data/db/crud/rendement_dao.dart';
import '../../models/rendement.dart';
import 'add_rendement_page.dart';

class RendementListPage extends StatefulWidget {
  const RendementListPage({super.key});

  @override
  State<RendementListPage> createState() => _RendementListPageState();
}

class _RendementListPageState extends State<RendementListPage> {
  final dao = RendementDao();
  late Future<List<Rendement>> rendements;

  @override
  void initState() {
    super.initState();
    rendements = dao.getAllRendements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des Rendements"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddRendementPage()),
          ).then((_) => setState(() {
                rendements = dao.getAllRendements();
              }));
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Rendement>>(
        future: rendements,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Center(
              child: Text(
                "Aucun rendement enregistré",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final r = data[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 18),
                elevation: 4,
                child: ListTile(
                  leading: const Icon(Icons.bar_chart, color: Colors.blue),
                  title: Text("Section ${r.idSection} — Mois ${r.moisRendement}/${r.anneeRendement}"),
                  subtitle: Text(
                      "Financier: ${r.rendementFinancier ?? 0} | Physique: ${r.rendementPhysique ?? 0}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await dao.deleteRendement(r.idRendement!);
                      setState(() {
                        rendements = dao.getAllRendements();
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
