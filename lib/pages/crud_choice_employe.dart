import 'package:flutter/material.dart';
import 'add_employe_page.dart';
import 'employe_list_page.dart';

class CrudChoiceEmploye extends StatelessWidget {
  const CrudChoiceEmploye({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion des Employés"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildButton(
              context,
              icon: Icons.add,
              text: "Créer un employé",
              page: const AddEmployePage(),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.edit,
              text: "Modifier un employé",
              page: const EmployeListPage(),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.delete,
              text: "Supprimer un employé",
              page: const EmployeListPage(),
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
            )
          ],
        ),
      ),
    );
  }
}
