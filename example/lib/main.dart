import 'package:flutter/material.dart';
import 'package:dynamic_nav_bar/dynamic_nav_bar.dart'; // ✅ required import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic NavBar Demo',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
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

  final List<Widget> _pages = [
    const Center(child: Text("🏠 Home Page")),
    const Center(child: Text("🔍 Search Page")),
    const Center(child: Text("👤 Profile Page")),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        items: [
          NavBarItem(text: "Home", icon: Icons.home, onTap: () => _onTabTapped(0)),
          NavBarItem(text: "Search", icon: Icons.search, onTap: () => _onTabTapped(1)),
          NavBarItem(text: "Profile", icon: Icons.person, onTap: () => _onTabTapped(2)),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.black54,
        backgroundColor: Colors.white,
        elevation: 12,
      ),
    );
  }
}
