import 'package:flutter/material.dart';
import '../../models/vehicule.dart';
import '../data/db/crud/vehicule_dao.dart';

class ListVehiculePage extends StatefulWidget {
  const ListVehiculePage({super.key});

  @override
  State<ListVehiculePage> createState() => _ListVehiculePageState();
}

class _ListVehiculePageState extends State<ListVehiculePage> {
  final VehiculeDao _vehiculeDao = VehiculeDao();

  List<Vehicule> vehicules = [];

  @override
  void initState() {
    super.initState();
    _loadVehicules();
  }

  Future<void> _loadVehicules() async {
    vehicules = await _vehiculeDao.getAllVehicules();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liste des véhicules")),
      body: vehicules.isEmpty
          ? const Center(child: Text("Aucun véhicule trouvé"))
          : ListView.builder(
              itemCount: vehicules.length,
              itemBuilder: (context, index) {
                final v = vehicules[index];

                return Card(
                  margin: const EdgeInsets.all(12),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    title: Text(
                      v.matriculeVehicule ?? "Sans matricule",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      "Consommation : ${v.consommationVehicule ?? 'N/A'}\n"
                      "Capacité Max : ${v.capaciteMaxVehicule ?? 'N/A'}",
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        await _vehiculeDao.deleteVehicule(
                          v.matriculeVehicule!,
                        );

                        _loadVehicules(); // refresh
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
