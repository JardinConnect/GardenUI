import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_workspace/ui/components.dart';
import 'package:widgetbook_workspace/ui/foundation/color/color_design_system.dart';

void main() {
  group('TabMenu Widget Tests', () {
    testWidgets('renders all tabs correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TabMenu(
              tabs: ['Tab 1', 'Tab 2', 'Tab 3'],
              selectedIndex: 0,
              onTabSelected: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('Tab 1'), findsOneWidget);
      expect(find.text('Tab 2'), findsOneWidget);
      expect(find.text('Tab 3'), findsOneWidget);
    });

    testWidgets('invokes onTabSelected callback when a tab is tapped', (
      WidgetTester tester,
    ) async {
      int selectedIndex = -1;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TabMenu(
              tabs: ['Tab 1', 'Tab 2', 'Tab 3'],
              selectedIndex: 0,
              onTabSelected: (index) {
                selectedIndex = index;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tab 2'));
      expect(selectedIndex, 1);
    });

    testWidgets('displays selected tab correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TabMenu(
              tabs: ['Tab 1', 'Tab 2', 'Tab 3'],
              selectedIndex: 1,
              onTabSelected: (_) {},
            ),
          ),
        ),
      );

      final selectedTextStyle = TextStyle(color: GardenColors.primary.shade500);

      final textWidget = tester.widget<Text>(find.text('Tab 2'));
      expect(textWidget.style?.color, selectedTextStyle.color);
    });

    testWidgets('renders icons when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TabMenu(
              tabs: ['Tab 1', 'Tab 2', 'Tab 3'],
              icons: [Icons.home, Icons.star, Icons.settings],
              selectedIndex: 0,
              onTabSelected: (_) {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets('supports horizontal scrolling when scrollable is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 300, // Constrain width to ensure scrolling is needed
              child: TabMenu(
                tabs: List.generate(20, (index) => 'Tab $index'),
                selectedIndex: 0,
                onTabSelected: (_) {},
                scrollable: true,
              ),
            ),
          ),
        ),
      );

      // Store the initial position of Tab 0 and Tab 19
      final initialPosTab0 = tester.getCenter(find.text('Tab 0'));
      final initialPosTab19 = tester.getCenter(find.text('Tab 19'));

      // Initially, Tab 19 should be far to the right of Tab 0
      expect(initialPosTab19.dx, greaterThan(initialPosTab0.dx));

      // Scroll to the right
      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(-500, 0),
      );
      await tester.pumpAndSettle();

      // Get the new positions after scrolling
      final finalPosTab0 = tester.getCenter(find.text('Tab 0'));
      final finalPosTab19 = tester.getCenter(find.text('Tab 19'));

      // After scrolling, Tab 0 should have moved to the left (negative x direction)
      expect(finalPosTab0.dx, lessThan(initialPosTab0.dx));

      // Tab 19 should be closer to the view after scrolling
      expect(finalPosTab19.dx, lessThan(initialPosTab19.dx));
    });
  });
}
