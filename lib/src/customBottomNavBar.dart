import 'package:flutter/material.dart';
import '../dynamic_nav_bar.dart';

class GlassBlurNavBar extends StatefulWidget {
  final List<NavBarItem> items;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  // Customizable parameters
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final double iconSize;
  final double elevation;
  final bool showLabels;
  final EdgeInsetsGeometry itemPadding;
  final double borderRadius;
  final Border? border;

  const GlassBlurNavBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.selectedItemColor = Colors.blueAccent,
    this.unselectedItemColor = Colors.grey,
    this.iconSize = 24,
    this.elevation = 8,
    this.showLabels = true,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    this.borderRadius = 20,
    this.border,
  });

  @override
  State<GlassBlurNavBar> createState() => _GlassBlurNavBarState();
}


class _GlassBlurNavBarState extends State<GlassBlurNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: widget.elevation,
            offset: const Offset(2, 2),
          ),
        ],
        border: widget.border,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.items.length, (index) {
          final item = widget.items[index];
          final isSelected = widget.selectedIndex == index;

          return GestureDetector(
            onTap: () {
              widget.onTap(index);
              item.onPressed();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: widget.itemPadding,
              decoration: BoxDecoration(
                color: isSelected ? widget.selectedItemColor.withOpacity(0.1) : Colors.transparent,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item.icon,
                    size: widget.iconSize,
                    color: isSelected ? widget.selectedItemColor : widget.unselectedItemColor,
                  ),
                  if (widget.showLabels)
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? widget.selectedItemColor : widget.unselectedItemColor,
                      ),
                      child: Text(item.label),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    )
    ;
  }
}
