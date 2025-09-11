import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_workspace/ui/design_system.dart';
import 'package:widgetbook_workspace/ui/widgets/molecules/MenuItem/menu_item.dart';

void main() {
  group('MenuItem Widget Tests', () {
    testWidgets('renders label and icon correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuItem(icon: Icons.home, label: 'Home', onTap: () {}),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('invokes onTap callback when tapped', (
      WidgetTester tester,
    ) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuItem(
              icon: Icons.home,
              label: 'Home',
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(MenuItem));
      expect(tapped, true);
    });

    testWidgets('toggles active state on tap', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuItem(icon: Icons.home, label: 'Home', onTap: () {}),
          ),
        ),
      );

      // Initial (non actif)
      final firstIcon = tester.widget<Icon>(find.byIcon(Icons.home));
      expect((firstIcon.color), isNot(equals(GardenColors.primary.shade50)));

      // Tap → devient actif
      await tester.tap(find.byType(MenuItem));
      await tester.pumpAndSettle();

      final secondIcon = tester.widget<Icon>(find.byIcon(Icons.home));
      expect(secondIcon.color, isNot(firstIcon.color));
    });
  });
}
