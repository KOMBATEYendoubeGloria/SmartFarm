import 'package:flutter/material.dart';
import '../data/db/crud/affecter_employe_dao.dart';
import '../../models/affecter_employe.dart';
import 'add_affecter_employe_page.dart';

class AffecterEmployeListPage extends StatefulWidget {
  const AffecterEmployeListPage({super.key});

  @override
  State<AffecterEmployeListPage> createState() =>
      _AffecterEmployeListPageState();
}

class _AffecterEmployeListPageState extends State<AffecterEmployeListPage> {
  final dao = AffecterEmployeDao();
  late Future<List<AffecterEmploye>> data;

  @override
  void initState() {
    super.initState();
    data = dao.getAllAffectations();
  }

  void refresh() {
    setState(() => data = dao.getAllAffectations());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Affectations des Employés"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddAffecterEmployePage()),
          ).then((_) => refresh());
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<AffecterEmploye>>(
        future: data,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final items = snapshot.data!;
          if (items.isEmpty) {
            return const Center(
              child: Text(
                "Aucune affectation enregistrée",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final a = items[index];

              return Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 18),
                child: ListTile(
                  leading: const Icon(Icons.assignment_ind,
                      color: Colors.deepPurple),
                  title: Text(
                      "Employé ${a.idEmploye} → Section ${a.idSection}"),
                  subtitle: Text("Quantité assignée : ${a.qteEmploye}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await dao.deleteAffectation(
                        a.idEmploye ?? 0,
                        a.idSection ?? 0,
                      );
                      refresh();
                    },
                  ),
                  onTap: () {
                    // Modification : on renvoie vers la page d'ajout remplie
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddAffecterEmployePage(),
                      ),
                    ).then((_) => refresh());
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
