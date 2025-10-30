import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';

void main() {
  group('TooltipIcon Widget Tests', () {
    testWidgets('renders default icon correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TooltipIcon(onPressed: () {})),
        ),
      );

      final iconFinder = find.byIcon(Icons.help_outline_outlined);
      expect(iconFinder, findsOneWidget);

      final iconWidget = tester.widget<Icon>(iconFinder);
      expect(iconWidget.size, 16);
      expect(iconWidget.color, GardenColors.base.shade600);
    });

    testWidgets('renders small icon correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TooltipIcon(size: TooltipSize.sm, onPressed: () {}),
          ),
        ),
      );

      final iconFinder = find.byIcon(Icons.help_outline_outlined);
      final iconWidget = tester.widget<Icon>(iconFinder);

      expect(iconWidget.size, 12);
      expect(iconWidget.color, GardenColors.base.shade600);
    });

    testWidgets('renders large icon correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TooltipIcon(size: TooltipSize.lg, onPressed: () {}),
          ),
        ),
      );

      final iconFinder = find.byIcon(Icons.help_outline_outlined);
      final iconWidget = tester.widget<Icon>(iconFinder);

      expect(iconWidget.size, 20);
      expect(iconWidget.color, GardenColors.base.shade600);
    });

    testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TooltipIcon(
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(IconButton));
      await tester.pump();

      expect(pressed, isTrue);
    });
  });
}