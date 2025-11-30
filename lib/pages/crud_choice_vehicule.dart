import 'package:flutter/material.dart';
import 'add_vehicule_page.dart';
import 'list_vehicule_page.dart';

class CrudChoiceVehicule extends StatelessWidget {
  const CrudChoiceVehicule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion des Véhicules"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildButton(
              context,
              icon: Icons.add,
              text: "Créer un véhicule",
              page: const AddVehiculePage(),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.edit,
              text: "Modifier un véhicule",
              page: const ListVehiculePage (),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.delete,
              text: "Supprimer un véhicule",
              page: const ListVehiculePage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required IconData icon,
    required String text,
    required Widget page,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue, size: 40),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
