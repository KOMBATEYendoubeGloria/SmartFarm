import 'package:flutter/material.dart';
import '../../data/db/crud/contient_legumineuse_dao.dart';
import '../../models/contient_legumineuse.dart';

class AddContientLegumineusePage extends StatefulWidget {
  const AddContientLegumineusePage({super.key});

  @override
  State<AddContientLegumineusePage> createState() =>
      _AddContientLegumineusePageState();
}

class _AddContientLegumineusePageState
    extends State<AddContientLegumineusePage> {
  final idLegCtrl = TextEditingController();
  final idLivCtrl = TextEditingController();
  final qteCtrl = TextEditingController();

  final dao = ContientLegumineuseDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter Contient-Legumineuse"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: idLegCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "ID Légumineuse"),
            ),
            TextField(
              controller: idLivCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "ID Livraison"),
            ),
            TextField(
              controller: qteCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Quantité (kg)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final cl = ContientLegumineuse(
                  idLegumineuse: int.tryParse(idLegCtrl.text),
                  idLivraison: int.tryParse(idLivCtrl.text),
                  qteLegumineuse: double.tryParse(qteCtrl.text),
                );

                await dao.insertContient(cl);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Association ajoutée !")),
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
