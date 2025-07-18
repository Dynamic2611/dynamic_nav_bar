import 'package:flutter/material.dart';

class NavBarItem {
  final IconData icon;
  final String label;
  final VoidCallback onPressed; // Optional operation when tapped

  NavBarItem({
    required this.icon,
    required this.label,
    required this.onPressed,
  });
}