import 'package:flutter/material.dart';
import '../../data/db/crud/employe_dao.dart';
import '../../models/employe.dart';

class AddEmployePage extends StatefulWidget {
  const AddEmployePage({super.key});

  @override
  State<AddEmployePage> createState() => _AddEmployePageState();
}

class _AddEmployePageState extends State<AddEmployePage> {
  final nomCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final posteCtrl = TextEditingController();
  final dispoCtrl = TextEditingController();

  final dao = EmployeDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un Employé"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomCtrl,
              decoration: const InputDecoration(labelText: "Nom complet"),
            ),
            TextField(
              controller: ageCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Âge"),
            ),
            TextField(
              controller: posteCtrl,
              decoration: const InputDecoration(labelText: "Poste"),
            ),
            TextField(
              controller: dispoCtrl,
              decoration: const InputDecoration(labelText: "Disponibilité"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final employe = Employe(
                  nomCompletEmploye: nomCtrl.text,
                  ageEmploye: int.tryParse(ageCtrl.text),
                  posteEmploye: posteCtrl.text,
                  disponibiliteEmploye: dispoCtrl.text,
                );

                await dao.insertEmploye(employe);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Employé ajouté !")),
                );

                Navigator.pop(context);
              },
              child: const Text("Enregistrer"),
            ),
          ],
        ),
      ),
    );
  }
}
