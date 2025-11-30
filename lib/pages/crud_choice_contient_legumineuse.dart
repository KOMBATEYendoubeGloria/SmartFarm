import 'package:flutter/material.dart';
import 'add_contient_legumineuse.dart';
import 'contient_legumineuse_list.dart';

class CrudChoiceContientLegumineuse extends StatelessWidget {
  const CrudChoiceContientLegumineuse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion Contient-Legumineuse"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildButton(
              context,
              icon: Icons.add,
              text: "Ajouter une association",
              page: const AddContientLegumineusePage(),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.list,
              text: "Voir / Modifier",
              page: const ContientLegumineuseListPage(),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.delete,
              text: "Supprimer",
              page: const ContientLegumineuseListPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required IconData icon, required String text, required Widget page}) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
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
            Icon(icon, color: Colors.green, size: 40),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
