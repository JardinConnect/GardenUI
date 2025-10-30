import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';

void main() {
  group('MenuIcon Widget Tests', () {
    testWidgets('renders icon correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: MenuIcon(icon: Icons.access_alarm_outlined)),
        ),
      );

      expect(find.byIcon(Icons.access_alarm_outlined), findsOneWidget);
    });

    testWidgets('displays selected state correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuIcon(icon: Icons.access_alarm_outlined, isActive: true),
          ),
        ),
      );

      final expectedBoxDecorationColor = GardenColors.primary.shade500;
      final expectedIconColor = GardenColors.primary.shade50;

      final containerFinder = find.descendant(
        of: find.byType(MenuIcon),
        matching: find.byType(Container),
      );

      final iconFinder = find.byIcon(Icons.access_alarm_outlined);

      expect(containerFinder, findsOneWidget);
      expect(iconFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final iconWidget = tester.widget<Icon>(iconFinder);

      expect(
        (containerWidget.decoration as BoxDecoration).color,
        expectedBoxDecorationColor,
      );
      expect(iconWidget.color, expectedIconColor);
    });

    testWidgets('displays unselected state correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuIcon(icon: Icons.access_alarm_outlined, isActive: false),
          ),
        ),
      );

      final expectedBoxDecorationColor = GardenColors.primary.shade50;
      final expectedIconColor = GardenColors.primary.shade500;

      final containerFinder = find.descendant(
        of: find.byType(MenuIcon),
        matching: find.byType(Container),
      );

      final iconFinder = find.byIcon(Icons.access_alarm_outlined);

      expect(containerFinder, findsOneWidget);
      expect(iconFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final iconWidget = tester.widget<Icon>(iconFinder);

      expect(
        (containerWidget.decoration as BoxDecoration).color,
        expectedBoxDecorationColor,
      );
      expect(iconWidget.color, expectedIconColor);
    });
  });
}
