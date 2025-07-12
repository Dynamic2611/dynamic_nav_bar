// lib/nav_bar_item.dart
import 'package:flutter/widgets.dart';

class NavBarItem {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  NavBarItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });
}