import 'package:flutter/material.dart';
import '../../data/db/crud/cultive_sur_dao.dart';
import '../../models/cultive_sur.dart';
import 'add_cultive_sur_page.dart';

class CultiveSurListPage extends StatefulWidget {
  const CultiveSurListPage({super.key});

  @override
  State<CultiveSurListPage> createState() => _CultiveSurListPageState();
}

class _CultiveSurListPageState extends State<CultiveSurListPage> {
  final dao = CultiveSurDao();
  late Future<List<CultiveSur>> dataList;

  @override
  void initState() {
    super.initState();
    dataList = dao.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste Cultive Sur"),
        backgroundColor: Colors.brown,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddCultiveSurPage()),
          ).then((_) {
            setState(() {
              dataList = dao.getAll();
            });
          });
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<CultiveSur>>(
        future: dataList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Center(
              child: Text("Aucune relation enregistrée",
                  style: TextStyle(fontSize: 18)),
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
                  leading:
                      const Icon(Icons.agriculture, color: Colors.brown),
                  title: Text(
                      "Section: ${c.idSection} — Légumineuse: ${c.idLegumineuse}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await dao.delete(c.idSection!, c.idLegumineuse!);
                      setState(() {
                        dataList = dao.getAll();
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
