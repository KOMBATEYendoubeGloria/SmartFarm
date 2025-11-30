import 'package:flutter/material.dart';
import 'add_legumineuse_page.dart';
import 'legumineuse_list_page.dart';

class CrudChoiceLegumineuse extends StatelessWidget {
  const CrudChoiceLegumineuse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion des Légumineuses"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildButton(
              context,
              icon: Icons.add,
              text: "Ajouter une légumineuse",
              page: const AddLegumineusePage(),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.edit,
              text: "Modifier une légumineuse",
              page: const LegumineuseListPage(),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.delete,
              text: "Supprimer une légumineuse",
              page: const LegumineuseListPage(),
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
