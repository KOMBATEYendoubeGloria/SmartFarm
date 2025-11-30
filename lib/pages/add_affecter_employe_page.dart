import 'package:flutter/material.dart';
import '../data/db/crud/affecter_employe_dao.dart';
import '../../models/affecter_employe.dart';

class AddAffecterEmployePage extends StatefulWidget {
  const AddAffecterEmployePage({super.key});

  @override
  State<AddAffecterEmployePage> createState() => _AddAffecterEmployePageState();
}

class _AddAffecterEmployePageState extends State<AddAffecterEmployePage> {
  final idEmployeCtrl = TextEditingController();
  final idSectionCtrl = TextEditingController();
  final qteCtrl = TextEditingController();

  final dao = AffecterEmployeDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Affecter un Employé"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: idEmployeCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "ID Employé"),
            ),
            TextField(
              controller: idSectionCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "ID Section"),
            ),
            TextField(
              controller: qteCtrl,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: "Quantité Employés assignés"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final affect = AffecterEmploye(
                  idEmploye: int.tryParse(idEmployeCtrl.text) ?? 0,
                  idSection: int.tryParse(idSectionCtrl.text) ?? 0,
                  qteEmploye: int.tryParse(qteCtrl.text) ?? 0,
                );

                await dao.insertAffectation(affect);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Affectation enregistrée !")),
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
