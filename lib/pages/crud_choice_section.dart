import 'package:flutter/material.dart';
import 'crud_section.dart';

class CrudChoiceSection extends StatelessWidget {
  const CrudChoiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_ChoiceItem> items = [
      _ChoiceItem("Créer une Section", Icons.add, CrudMode.create),
      _ChoiceItem("Modifier une Section", Icons.edit, CrudMode.update),
      _ChoiceItem("Supprimer une Section", Icons.delete, CrudMode.delete),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        title: const Text("Gestion des Sections"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.2,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CrudSection(mode: item.mode),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 6,
                    )
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.icon, size: 40, color: Colors.blue),
                    const SizedBox(height: 15),
                    Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ChoiceItem {
  final String title;
  final IconData icon;
  final CrudMode mode;
  _ChoiceItem(this.title, this.icon, this.mode);
}

enum CrudMode { create, update, delete }
