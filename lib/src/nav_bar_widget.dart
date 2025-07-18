// lib/src/nav_bar_widget.dart
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Widget navBarWidget; // 👈 change this from `Type` to `Widget`

  const CustomBottomNavBar({
    super.key,
    required this.navBarWidget,
  });

  @override
  Widget build(BuildContext context) {
    return navBarWidget;
  }
}
