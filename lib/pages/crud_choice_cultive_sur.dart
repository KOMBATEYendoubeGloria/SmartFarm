import 'package:flutter/material.dart';
import 'add_cultive_sur_page.dart';
import 'cultive_sur_list_page.dart';

class CrudChoiceCultiveSur extends StatelessWidget {
  const CrudChoiceCultiveSur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion Cultive Sur"),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildButton(
              context,
              icon: Icons.add,
              text: "Ajouter une association",
              page: const AddCultiveSurPage(),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.list,
              text: "Voir / Modifier",
              page: const CultiveSurListPage(),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.list,
              text: "Supprimer",
              page: const CultiveSurListPage(),
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
            Icon(icon, color: Colors.brown, size: 40),
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
