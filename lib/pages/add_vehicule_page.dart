import 'package:flutter/material.dart';
import '../../models/vehicule.dart';
import '../data/db/crud/vehicule_dao.dart';

class AddVehiculePage extends StatefulWidget {
  const AddVehiculePage({super.key});

  @override
  State<AddVehiculePage> createState() => _AddVehiculePageState();
}

class _AddVehiculePageState extends State<AddVehiculePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _matriculeController = TextEditingController();
  final TextEditingController _consommationController = TextEditingController();
  final TextEditingController _capaciteController = TextEditingController();

  final VehiculeDao _vehiculeDao = VehiculeDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ajouter un véhicule")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _matriculeController,
                decoration: const InputDecoration(
                  labelText: "Matricule du véhicule",
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Obligatoire" : null,
              ),
              TextFormField(
                controller: _consommationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Consommation (L/100km)",
                ),
              ),
              TextFormField(
                controller: _capaciteController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Capacité max (kg)",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;

                  Vehicule v = Vehicule(
                    matriculeVehicule: _matriculeController.text,
                    consommationVehicule: double.tryParse(_consommationController.text),
                    capaciteMaxVehicule: int.tryParse(_capaciteController.text),
                  );

                  await _vehiculeDao.insertVehicule(v);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Véhicule ajouté")),
                  );

                  Navigator.pop(context);
                },
                child: const Text("Enregistrer"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
