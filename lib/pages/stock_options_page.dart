import 'package:flutter/material.dart';
import '../widgets/click_dash_board_card.dart';

class _StockOptionItem {
  final String title;
  final IconData icon;
  final String route;

  _StockOptionItem(this.title, this.icon, this.route);
}

class StockOptionsPage extends StatelessWidget {
  const StockOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_StockOptionItem> options = [
      _StockOptionItem("Stock Actuel", Icons.storage, "stock_actuel"),
      _StockOptionItem("Observation", Icons.show_chart, "observation"),
      _StockOptionItem("Tendances", Icons.trending_up, "tendances"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Options du Stock"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: options.length,
          itemBuilder: (context, index) {
            final option = options[index];
            return InkWell(
              onTap: () {
                switch (option.route) {
                  case "stock_actuel":
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Stock Actuel cliqué")),
                    );
                    break;
                  case "observation":
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Observation cliqué")),
                    );
                    break;
                  case "tendances":
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Tendances cliqué")),
                    );
                    break;
                }
              },
              child: ClickdashboardCard(
                icon: option.icon,
                iconColor: Colors.orange,
                title: option.title,
                value: "",
                subtitle: "",
              ),
            );
          },
        ),
      ),
    );
  }
}
