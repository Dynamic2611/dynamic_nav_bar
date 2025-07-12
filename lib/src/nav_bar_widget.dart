import 'package:flutter/material.dart';
import 'nav_bar_item.dart';

class CustomBottomNavBar extends StatefulWidget {
  final List<NavBarItem> items;
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final int initialIndex;
  final double iconSize;
  final double elevation;
  final bool showLabels;

  const CustomBottomNavBar({
    Key? key,
    required this.items,
    this.backgroundColor = Colors.white,
    this.selectedItemColor = Colors.blueAccent,
    this.unselectedItemColor = Colors.grey,
    this.initialIndex = 0,
    this.iconSize = 24,
    this.elevation = 8,
    this.showLabels = true,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      widget.items[index].onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: widget.elevation,
      color: widget.backgroundColor,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(widget.items.length, (index) {
              final item = widget.items[index];
              final isSelected = _selectedIndex == index;

              return GestureDetector(
                onTap: () => _onItemTapped(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? widget.selectedItemColor.withOpacity(0.1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        item.icon,
                        color: isSelected ? widget.selectedItemColor : widget.unselectedItemColor,
                        size: widget.iconSize,
                      ),
                      if (widget.showLabels)
                        const SizedBox(height: 4),
                      if (widget.showLabels)
                        Text(
                          item.text,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? widget.selectedItemColor : widget.unselectedItemColor,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
