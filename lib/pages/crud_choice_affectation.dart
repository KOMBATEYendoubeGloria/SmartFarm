import 'package:flutter/material.dart';
import 'add_affecter_employe_page.dart';
import 'affecter_employe_list_page.dart';

class CrudChoiceAffecterEmploye extends StatelessWidget {
  const CrudChoiceAffecterEmploye({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Affectation Employés"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildButton(
              context,
              icon: Icons.add,
              text: "Créer une affectation",
              page: const AddAffecterEmployePage(),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.edit,
              text: "Modifier une affectation",
              page: const AffecterEmployeListPage(),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.delete,
              text: "Supprimer une affectation",
              page: const AffecterEmployeListPage(),
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
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
