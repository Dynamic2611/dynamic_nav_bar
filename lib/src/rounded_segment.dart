// lib/src/styles/style3_widget.dart
import 'package:flutter/material.dart';
import '../dynamic_nav_bar.dart';

class RoundedSegmentNavBar extends StatelessWidget {
  final List<NavBarItem> items;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color backgroundColor;

  const RoundedSegmentNavBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
    this.unselectedItemColor = Colors.white60,
    this.selectedItemColor = Colors.black,
    this.backgroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              onTap(index); // still trigger external callback
              item.onPressed(); // trigger specific item's function
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.white : Colors.transparent,
              ),
              child: Icon(
                item.icon,
                color: isSelected ? selectedItemColor : unselectedItemColor,
                size: 26,
              ),
            ),
          );
        }),
      ),
    );
  }
}
