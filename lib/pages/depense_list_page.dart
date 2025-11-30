import 'package:flutter/material.dart';
import '../data/db/crud/depense_dao.dart';
import '../../models/depense.dart';
import 'add_depense_page.dart';

class DepenseListPage extends StatefulWidget {
  const DepenseListPage({super.key});

  @override
  State<DepenseListPage> createState() => _DepenseListPageState();
}

class _DepenseListPageState extends State<DepenseListPage> {
  final dao = DepenseDao();
  late Future<List<Depense>> depenses;

  @override
  void initState() {
    super.initState();
    depenses = dao.getAllDepenses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des Dépenses"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddDepensePage()),
          ).then((_) => setState(() {
                depenses = dao.getAllDepenses();
              }));
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Depense>>(
        future: depenses,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Center(
              child: Text(
                "Aucune dépense enregistrée",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final d = data[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 18),
                elevation: 4,
                child: ListTile(
                  leading: const Icon(Icons.money, color: Colors.green),
                  title: Text(
                      "Section ${d.idSection} — ${d.jourDepense}/${d.moisDepense}/${d.anneeDepense}"),
                  subtitle: Text(
                      "Valeur: ${d.valeurDepense ?? 0} | Motif: ${d.motifDepense ?? ''}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await dao.deleteDepense(d.idDepense);
                      setState(() {
                        depenses = dao.getAllDepenses();
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
