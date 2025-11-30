import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const SideMenu({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      decoration: const BoxDecoration(
        color: Color(0xFFF5F7FA),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          _buildMenuItem(Icons.home, "Accueil", 0),
          _buildMenuItem(Icons.inventory, "Stock", 1),                                                       
          _buildMenuItem(Icons.local_shipping, "Livraisons", 2),
          _buildMenuItem(Icons.admin_panel_settings, "Admin", 3),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String text, int index) {
    final bool isSelected = index == selectedIndex;

    return InkWell(
      onTap: (){
            onItemSelected(index);   // action 1
          },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.blue : Colors.grey[700]),
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.blue : Colors.grey[700],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
