import 'package:flutter/material.dart';
import '../data/db/crud/depense_dao.dart';
import '../../models/depense.dart';

class AddDepensePage extends StatefulWidget {
  const AddDepensePage({super.key});

  @override
  State<AddDepensePage> createState() => _AddDepensePageState();
}

class _AddDepensePageState extends State<AddDepensePage> {
  final idSectionCtrl = TextEditingController();
  final jourCtrl = TextEditingController();
  final moisCtrl = TextEditingController();
  final anneeCtrl = TextEditingController();
  final valeurCtrl = TextEditingController();
  final motifCtrl = TextEditingController();

  final dao = DepenseDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter une Dépense"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: idSectionCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "ID Section"),
            ),
            TextField(
              controller: jourCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Jour"),
            ),
            TextField(
              controller: moisCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Mois"),
            ),
            TextField(
              controller: anneeCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Année"),
            ),
            TextField(
              controller: valeurCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Valeur Dépense"),
            ),
            TextField(
              controller: motifCtrl,
              decoration: const InputDecoration(labelText: "Motif"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final depense = Depense(
                  idDepense: 0,
                  idSection: int.tryParse(idSectionCtrl.text) ?? 0,
                  jourDepense: int.tryParse(jourCtrl.text) ?? 0,
                  moisDepense: int.tryParse(moisCtrl.text) ?? 0,
                  anneeDepense: int.tryParse(anneeCtrl.text) ?? 0,
                  valeurDepense:
                      double.tryParse(valeurCtrl.text) ?? 0.0,
                  motifDepense: motifCtrl.text,
                );

                await dao.insert(depense);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Dépense ajoutée !")),
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
