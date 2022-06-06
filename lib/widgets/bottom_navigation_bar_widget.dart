import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/navigation_bar_item.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final List<NavigationBarItem> items;
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget({
    Key? key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 68, 158, 255),
      selectedFontSize: 18,
      selectedIconTheme: const IconThemeData(color: Colors.white, size: 30),
      selectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedFontSize: 12,
      items: _buildItems(),
      currentIndex: selectedIndex,
      onTap: onTap,
    );
  }

  List<BottomNavigationBarItem> _buildItems() {
    return items.map((item) {
      return BottomNavigationBarItem(
        icon: Icon(item.icon),
        label: item.name,
      );
    }).toList();
  }
}
