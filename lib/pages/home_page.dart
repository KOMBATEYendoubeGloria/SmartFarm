import 'package:flutter/material.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/side_menu.dart';
import '../pages/stock_page.dart';
import '../pages/admin_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int menuIndex = 0;

        Widget getView() {
        switch (menuIndex) {
          case 0:
            return buildDashboardView();  // Accueil
          case 1:
            return const StockPage();     // Stock
          case 3:
            return const AdminPage(); 
          default:
            return const Center(child: Text("Section en cours de construction"));
        }
      }

          Widget buildDashboardView() {
        return ListView(
          children: [
            const Text(
              "Bienvenue Chez MOKPOKPO",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.4,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                DashboardCard(
                  icon: Icons.shopping_basket,
                  iconColor: Colors.green,
                  title: "Stock actuel",
                  value: "8,4 tonnes",
                  subtitle: "+12 % ce mois",
                ),
                DashboardCard(
                  icon: Icons.local_shipping,
                  iconColor: Colors.blue,
                  title: "Livraisons en cours",
                  value: "5",
                  subtitle: "Lomé • Tsévié • Kpalimé",
                ),
                DashboardCard(
                  icon: Icons.eco,
                  iconColor: Colors.yellow,
                  title: "Rendement du mois",
                  value: "+8,5 %",
                  subtitle: "Par rapport au mois dernier",
                ),
                DashboardCard(
                  icon: Icons.cloud,
                  iconColor: Colors.red,
                  title: "Alerte météo",
                  value: "Pluie forte",
                  subtitle: "Dans 24 h",
                ),
              ],
            )
          ],
        );
      }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: Row(
        children: [
          SideMenu(
            selectedIndex: menuIndex,
            onItemSelected: (index) {
              setState(() => menuIndex = index);
            },
          ),

          // ----------- CONTENT -----------
              Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: getView(),  // la vue apparaît selon le menu !
          ),
        ),

  ],
      ),
    );
  }
}
