import 'package:flutter/material.dart';
import '../../data/db/crud/employe_dao.dart';
import '../../models/employe.dart';
import 'add_employe_page.dart';

class EmployeListPage extends StatefulWidget {
  const EmployeListPage({super.key});

  @override
  State<EmployeListPage> createState() => _EmployeListPageState();
}

class _EmployeListPageState extends State<EmployeListPage> {
  final dao = EmployeDao();
  late Future<List<Employe>> employes;

  @override
  void initState() {
    super.initState();
    employes = dao.getAllEmployes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des Employés"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddEmployePage()),
          ).then((_) {
            setState(() {
              employes = dao.getAllEmployes();
            });
          });
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Employe>>(
        future: employes,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Center(
              child: Text(
                "Aucun employé enregistré",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final e = data[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 18),
                elevation: 4,
                child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.green),
                  title: Text(e.nomCompletEmploye ?? ""),
                  subtitle: Text(
                    "Âge : ${e.ageEmploye} | Poste : ${e.posteEmploye}\nDisponibilité : ${e.disponibiliteEmploye}",
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await dao.deleteEmploye(e.idEmploye!);
                      setState(() {
                        employes = dao.getAllEmployes();
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
