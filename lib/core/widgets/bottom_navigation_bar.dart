import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget(
      {super.key, required this.items, required this.onTap});
  final List<Map<String, dynamic>> items;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(item['icon']),
          label: item['label'],
        );
      }).toList(),
      onTap: onTap,
      selectedItemColor: Colors.indigoAccent,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
    );
  }
}
