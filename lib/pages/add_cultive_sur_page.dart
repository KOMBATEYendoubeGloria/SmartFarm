import 'package:flutter/material.dart';
import '../../data/db/crud/cultive_sur_dao.dart';
import '../../models/cultive_sur.dart';

class AddCultiveSurPage extends StatefulWidget {
  const AddCultiveSurPage({super.key});

  @override
  State<AddCultiveSurPage> createState() => _AddCultiveSurPageState();
}

class _AddCultiveSurPageState extends State<AddCultiveSurPage> {
  final idSectionCtrl = TextEditingController();
  final idLegCtrl = TextEditingController();

  final dao = CultiveSurDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter Cultive Sur"),
        backgroundColor: Colors.brown,
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
              controller: idLegCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "ID Légumineuse"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final c = CultiveSur(
                  idSection: int.tryParse(idSectionCtrl.text),
                  idLegumineuse: int.tryParse(idLegCtrl.text),
                );

                await dao.insertCultiveSur(c);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Relation ajoutée !")),
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
