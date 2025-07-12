import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dynamic_nav_bar/dynamic_nav_bar.dart';

void main() {
  testWidgets('CustomBottomNavBar builds with items', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: CustomBottomNavBar(
            items: [
              NavItem(name: 'Home', icon: Icons.home, onTap: () {}),
              NavItem(name: 'Profile', icon: Icons.person, onTap: () {}),
            ],
          ),
        ),
      ),
    );

    // Verify the icons are present
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);

    // Verify the labels are present
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });
}
