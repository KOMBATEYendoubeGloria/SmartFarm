import 'package:flutter/material.dart';
import '../data/db/crud/rendement_dao.dart';
import '../../models/rendement.dart';

class AddRendementPage extends StatefulWidget {
  const AddRendementPage({super.key});

  @override
  State<AddRendementPage> createState() => _AddRendementPageState();
}

class _AddRendementPageState extends State<AddRendementPage> {
  final idSectionCtrl = TextEditingController();
  final moisCtrl = TextEditingController();
  final anneeCtrl = TextEditingController();
  final financierCtrl = TextEditingController();
  final physiqueCtrl = TextEditingController();

  final dao = RendementDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un Rendement"),
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
              controller: moisCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Mois (1-12)"),
            ),
            TextField(
              controller: anneeCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Année"),
            ),
            TextField(
              controller: financierCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Rendement financier"),
            ),
            TextField(
              controller: physiqueCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Rendement physique"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final rendement = Rendement(
                  idSection: int.tryParse(idSectionCtrl.text),
                  moisRendement: int.tryParse(moisCtrl.text),
                  anneeRendement: int.tryParse(anneeCtrl.text),
                  rendementFinancier: double.tryParse(financierCtrl.text),
                  rendementPhysique: double.tryParse(physiqueCtrl.text),
                );

                await dao.insertRendement(rendement);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Rendement ajouté !")),
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
