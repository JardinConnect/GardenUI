import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';

void main() {
  group('TabItem Widget Tests', () {
    testWidgets('renders label correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TabItem(label: 'Test Tab', isSelected: false, onTap: () {}),
          ),
        ),
      );

      expect(find.text('Test Tab'), findsOneWidget);
    });

    testWidgets('renders icon when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TabItem(
              label: 'Test Tab',
              isSelected: false,
              onTap: () {},
              icon: Icons.star,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('invokes onTap callback when tapped', (
      WidgetTester tester,
    ) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TabItem(
              label: 'Test Tab',
              isSelected: false,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Test Tab'));
      expect(tapped, isTrue);
    });

    testWidgets('displays selected state correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TabItem(label: 'Test Tab', isSelected: true, onTap: () {}),
          ),
        ),
      );

      final selectedTextStyle = TextStyle(
        color: GardenColors
            .typography
            .shade400, // Assuming GardenColors.typography.shade400
      );

      final textWidget = tester.widget<Text>(find.text('Test Tab'));
      expect(textWidget.style?.color, selectedTextStyle.color);
    });
  });
}
