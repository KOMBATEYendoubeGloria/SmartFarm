import 'package:flutter/material.dart';
import '../data/db/crud/livraison_dao.dart';
import '../../models/livraison.dart';

class AddLivraisonPage extends StatefulWidget {
  const AddLivraisonPage({super.key});

  @override
  State<AddLivraisonPage> createState() => _AddLivraisonPageState();
}

class _AddLivraisonPageState extends State<AddLivraisonPage> {
  final matriculeCtrl = TextEditingController();
  final distanceCtrl = TextEditingController();
  final carburantCtrl = TextEditingController();
  final departCtrl = TextEditingController();
  final arriveeCtrl = TextEditingController();
  final estimationCtrl = TextEditingController();
  final tempReelCtrl = TextEditingController();

  final dao = LivraisonDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter une Livraison"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: matriculeCtrl,
              decoration: const InputDecoration(labelText: "Matricule véhicule"),
            ),
            TextField(
              controller: distanceCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Distance (km)"),
            ),
            TextField(
              controller: carburantCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Carburant (L/km)"),
            ),
            TextField(
              controller: departCtrl,
              decoration: const InputDecoration(labelText: "Départ"),
            ),
            TextField(
              controller: arriveeCtrl,
              decoration: const InputDecoration(labelText: "Arrivée"),
            ),
            TextField(
              controller: estimationCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Estimation temps (heures)"),
            ),
            TextField(
              controller: tempReelCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Temps réel (heures)"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final livraison = Livraison(
                  matriculeVehicule: matriculeCtrl.text,
                  distanceLivraison: double.tryParse(distanceCtrl.text) ?? 0.0,
                  carburantLivraison: double.tryParse(carburantCtrl.text) ?? 0.0,
                  depart: departCtrl.text,
                  arrivee: arriveeCtrl.text,
                  estimationTempLivraison: double.tryParse(estimationCtrl.text) ?? 0.0,
                  tempReelLivraison: double.tryParse(tempReelCtrl.text) ?? 0.0,
                );

                await dao.insertLivraison(livraison);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Livraison enregistrée !")),
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
