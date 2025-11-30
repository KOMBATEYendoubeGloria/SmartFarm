import 'package:flutter/material.dart';
import '../../data/db/crud/contient_legumineuse_dao.dart';
import '../../models/contient_legumineuse.dart';
import 'add_contient_legumineuse.dart';

class ContientLegumineuseListPage extends StatefulWidget {
  const ContientLegumineuseListPage({super.key});

  @override
  State<ContientLegumineuseListPage> createState() =>
      _ContientLegumineuseListPageState();
}

class _ContientLegumineuseListPageState
    extends State<ContientLegumineuseListPage> {
  final dao = ContientLegumineuseDao();
  late Future<List<ContientLegumineuse>> associations;

  @override
  void initState() {
    super.initState();
    associations = dao.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Associations Contient-Legumineuse"),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddContientLegumineusePage()),
          ).then((_) {
            setState(() {
              associations = dao.getAll();
            });
          });
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<ContientLegumineuse>>(
        future: associations,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Center(
              child: Text("Aucune association enregistrée",
                  style: TextStyle(fontSize: 18)),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final cl = data[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 18),
                elevation: 4,
                child: ListTile(
                  leading:
                      const Icon(Icons.local_florist, color: Colors.green),
                  title: Text(
                      "Legumineuse: ${cl.idLegumineuse} — Livraison: ${cl.idLivraison}"),
                  subtitle: Text("Quantité: ${cl.qteLegumineuse} kg"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await dao.deleteContient(
                          cl.idLegumineuse!, cl.idLivraison!);
                      setState(() {
                        associations = dao.getAll();
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
