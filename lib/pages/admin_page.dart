import 'package:flutter/material.dart';
import 'crud_choice_section.dart';
import 'crud_choice_rendement.dart';
import 'crud_choice_depense.dart';
import 'crud_choice_vehicule.dart';
import 'crud_choice_affectation.dart';
import 'crud_choice_chauffeur.dart';
import 'crud_choice_contient_legumineuse.dart';
import 'crud_choice_cultive_sur.dart';
import 'crud_choice_employe.dart';
import 'crud_choice_legumineuse.dart';
import 'crud_choice_livraison.dart';



class _AdminItem {
  final String title;
  final IconData icon;
  final String route;

  _AdminItem(this.title, this.icon, this.route);
}



class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_AdminItem> items = [
      _AdminItem("Sections", Icons.map, "section"),
      _AdminItem("Dépenses", Icons.money, "depenses"),
     _AdminItem("Rendements", Icons.show_chart, "rendements"),
      _AdminItem("Légumineuses", Icons.eco, "legumineuses"),
      _AdminItem("Cultivé Sur(Section)", Icons.grass, "cultivesur"),
      _AdminItem("Véhicules", Icons.local_shipping, "vehicule"),
      _AdminItem("Livraisons", Icons.delivery_dining, "livraisons"),
      _AdminItem("Contient Légumineuse(livraison)", Icons.inventory, "contient"),
      _AdminItem("Employés", Icons.groups, "employes"),
      _AdminItem("Chauffeurs", Icons.person, "chauffeur"),
      _AdminItem("Affecter Employé", Icons.assignment_ind, "affecter"),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Administration",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return _buildAdminCard(context, item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


Widget _buildAdminCard(BuildContext context, _AdminItem item) {
  return InkWell(
    onTap: () {
        // 1️ SECTION
        if (item.route == "section") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CrudChoiceSection(),
            ),
          );
          return;
        }

        // 2️ RENDEMENTS
        if (item.route == "rendements") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CrudChoiceRendement()),
            );
          return;
        }

          if (item.route == "depenses") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CrudChoiceDepense()),
            );
            return;
          }

          if (item.route == "vehicule") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CrudChoiceVehicule(),
                  ),
                );
                return;
              }

                    if (item.route == "affecter") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CrudChoiceAffecterEmploye()),
                        );
                        return;
                      }

             if (item.route == "chauffeur") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CrudChoiceChauffeur()),
                        );
                        return;
                      }


        if (item.route == "contient") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CrudChoiceContientLegumineuse()),
                        );
                        return;
                      }

        if (item.route == "cultivesur") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CrudChoiceCultiveSur()),
                        );
                        return;
                      }

          if (item.route == "employes") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CrudChoiceEmploye()),
                        );
                        return;
                      }

          if (item.route == "legumineuses") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CrudChoiceLegumineuse()),
                        );
                        return;
                      }
          if (item.route == "livraisons") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CrudChoiceLivraison()),
                        );
                        return;
                      }
  
        // Default
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Page ${item.title} en construction")),
        );
      },
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 6,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, size: 40, color: Colors.blue),
          const SizedBox(height: 15),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
}