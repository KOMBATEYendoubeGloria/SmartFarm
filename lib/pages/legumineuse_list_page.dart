import 'package:flutter/material.dart';
import '../data/db/crud/legumineuse_dao.dart';
import '../../models/legumineuse.dart';
import 'add_legumineuse_page.dart';

class LegumineuseListPage extends StatefulWidget {
  const LegumineuseListPage({super.key});

  @override
  State<LegumineuseListPage> createState() => _LegumineuseListPageState();
}

class _LegumineuseListPageState extends State<LegumineuseListPage> {
  final dao = LegumineuseDao();
  late Future<List<Legumineuse>> legumineuses;

  @override
  void initState() {
    super.initState();
    legumineuses = dao.getAllLegumineuses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des Légumineuses"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddLegumineusePage()),
          ).then((_) => setState(() {
                legumineuses = dao.getAllLegumineuses();
              }));
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Legumineuse>>(
        future: legumineuses,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Center(
              child: Text(
                "Aucune légumineuse enregistrée",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final l = data[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 18),
                elevation: 4,
                child: ListTile(
                  leading: const Icon(Icons.eco, color: Colors.green),
                  title: Text(l.nomLegumineuse ?? ""),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddLegumineusePage(existing: l),
                      ),
                    ).then((_) => setState(() {
                          legumineuses = dao.getAllLegumineuses();
                        }));
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await dao.deleteLegumineuse(l.idLegumineuse!);
                      setState(() {
                        legumineuses = dao.getAllLegumineuses();
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
