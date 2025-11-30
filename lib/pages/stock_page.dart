import 'package:flutter/material.dart';
import 'stock_options_page.dart';
import '../widgets/click_dash_board_card.dart';

class _StockItem {
  final String title;
  final IconData icon;
  final String route;

  _StockItem(this.title, this.icon, this.route);
}

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_StockItem> items = [
      _StockItem("Soja", Icons.shopping_basket, "soja"),
      // Tu peux ajouter d'autres légumineuses plus tard
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              if (item.route == "soja") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StockOptionsPage(),
                  ),
                );
                return;
              }
            },
            child: ClickdashboardCard(
              icon: item.icon,
              iconColor: Colors.green,
              title: item.title,
              value: "8,4 tonnes",
              subtitle: "+12 % ce mois",
            ),
          );
        },
      ),
    );
  }
}
