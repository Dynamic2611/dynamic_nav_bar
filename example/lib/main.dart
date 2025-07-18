import 'package:flutter/material.dart';
import 'package:dynamic_nav_bar/dynamic_nav_bar.dart'; // Import your custom widget style here

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<NavBarItem> items = [
    NavBarItem(
      icon: Icons.home,
      label: "Home",
      onPressed: () => print("Home pressed"),
    ),
    NavBarItem(
      icon: Icons.settings,
      label: "Settings",
      onPressed: () => print("Settings pressed"),
    ),
    NavBarItem(
      icon: Icons.lightbulb,
      label: "Tax Genius",
      onPressed: () => print("Tax Genius"),
    ),
    NavBarItem(
      icon: Icons.more_horiz,
      label: "More",
      onPressed: () => print("More"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Selected Tab: ${items[_selectedIndex].label}'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15.0, left: 8, right: 8),
        child: CustomBottomNavBar(
          navBarWidget: NeumorphicNavBar(  /// Different type like => NeumorphicNavBar, CenterFloatingNavBar ,GlassBlurNavBar, RoundedSegmentNavBar
            items: items,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ),
      ),
    );
  }
}
