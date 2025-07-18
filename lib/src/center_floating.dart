// lib/src/styles/style2_widget.dart
import 'package:flutter/material.dart';
import '../dynamic_nav_bar.dart';

class CenterFloatingNavBar extends StatelessWidget {
  final List<NavBarItem> items;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final VoidCallback? onFabTap;

  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final double iconSize;
  final Color fabIconColor;
  final IconData fabIcon;
  final double fabSize;
  final Gradient fabGradient;
  final double fabElevation;
  final double fabBottomOffset;
  final NotchedShape bottomBarShape;
  final double notchMargin;

  const CenterFloatingNavBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
    this.onFabTap,
    this.backgroundColor = Colors.white,
    this.selectedItemColor = Colors.deepOrangeAccent,
    this.unselectedItemColor = Colors.grey,
    this.iconSize = 26,
    this.fabIconColor = Colors.white,
    this.fabIcon = Icons.add,
    this.fabSize = 60,
    this.fabGradient = const LinearGradient(
      colors: [Color(0xFFFF416C), Color(0xFFFF4B2B)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    this.fabElevation = 10.0,
    this.fabBottomOffset = 25.0,
    this.bottomBarShape = const CustomCircularNotchedRectangle(),
    this.notchMargin = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BottomAppBar(
          shape: bottomBarShape,
          notchMargin: notchMargin,
          color: backgroundColor,
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length + 1, (index) {
                if (index == items.length ~/ 2) return SizedBox(width: fabSize);

                final itemIndex = index > items.length ~/ 2 ? index - 1 : index;
                final item = items[itemIndex];
                final isSelected = selectedIndex == itemIndex;

                return IconButton(
                  icon: Icon(
                    item.icon,
                    size: iconSize,
                    color: isSelected ? selectedItemColor : unselectedItemColor,
                  ),
                  onPressed: () {
                    onTap(itemIndex);
                    item.onPressed();
                  },
                );
              }),
            ),
          ),
        ),
        Positioned(
          bottom: fabBottomOffset,
          child: GestureDetector(
            onTap: onFabTap,
            child: Container(
              width: fabSize,
              height: fabSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: fabGradient,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: fabElevation,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(fabIcon, color: fabIconColor, size: fabSize * 0.5),
            ),
          ),
        ),
      ],
    );
  }
}


class CustomCircularNotchedRectangle extends NotchedShape {
  const CustomCircularNotchedRectangle();

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) {
      return Path()..addRect(host);
    }

    final notchRadius = guest.width / 2.0;
    const double s1 = 15.0;
    const double s2 = 1.0;

    final double r = notchRadius;
    final double a = -1.0 * r - s2;
    final double b = host.top;
    final double e = guest.center.dx;
    final double f = guest.center.dy;

    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(e + a - s1, b)
      ..quadraticBezierTo(e, f, e - a + s1, b)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}
