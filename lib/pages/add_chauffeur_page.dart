import 'package:flutter/material.dart';
import '../data/db/crud/chauffeur_dao.dart';
import '../../models/Chauffeur.dart';

class AddChauffeurPage extends StatefulWidget {
  const AddChauffeurPage({super.key});

  @override
  State<AddChauffeurPage> createState() => _AddChauffeurPageState();
}

class _AddChauffeurPageState extends State<AddChauffeurPage> {
  final nomCtrl = TextEditingController();
  final permisCtrl = TextEditingController();
  final dispoCtrl = TextEditingController();

  final dao = ChauffeurDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un Chauffeur"),
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
              controller: permisCtrl,
              decoration: const InputDecoration(labelText: "Type de permis"),
            ),
            TextField(
              controller: dispoCtrl,
              decoration:
                  const InputDecoration(labelText: "Disponibilité (ex: oui/non)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final chauffeur = Chauffeur(
                  idChauffeur: null,
                  nomCompletChauffeur: nomCtrl.text,
                  permisChauffeur: permisCtrl.text,
                  disponibiliteChauffeur: dispoCtrl.text,
                );

                await dao.insertChauffeur(chauffeur);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Chauffeur ajouté !")),
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
