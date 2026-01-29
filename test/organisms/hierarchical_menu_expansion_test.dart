import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';

void main() {
  group('HierarchicalMenu - Expansion/Collapse Tests', () {
    testWidgets('should toggle expansion state on multiple taps', (
      WidgetTester tester,
    ) async {
      // Track expansion state changes
      final List<HierarchicalMenuItem> expansionChanges = [];

      const items = [
        HierarchicalMenuItem(
          id: 'parent',
          title: 'Parent Item',
          level: 1,
          children: [
            HierarchicalMenuItem(id: 'child1', title: 'Child 1', level: 2),
            HierarchicalMenuItem(id: 'child2', title: 'Child 2', level: 2),
          ],
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HierarchicalMenu(
              items: items,
              onItemExpansionChanged: (item) {
                expansionChanges.add(item);
              },
            ),
          ),
        ),
      );

      // Verify initial state
      expect(find.text('Parent Item'), findsOneWidget);
      expect(find.text('Child 1'), findsNothing);
      expect(find.text('Child 2'), findsNothing);
      expect(expansionChanges.isEmpty, isTrue);

      // Tap 1: Expand (using chevron)
      await tester.tap(find.byIcon(Icons.keyboard_arrow_down).first);
      await tester
          .pump(); // Use pump() instead of pumpAndSettle() for immediate state check

      expect(expansionChanges.length, equals(1));
      expect(
        expansionChanges[0].isExpanded,
        isTrue,
        reason: 'First tap on chevron should expand the item',
      );

      await tester.pumpAndSettle(); // Now wait for animations
      expect(
        find.text('Child 1'),
        findsOneWidget,
        reason: 'Children should be visible after expansion',
      );
      expect(find.text('Child 2'), findsOneWidget);

      // Tap 2: Collapse (using chevron)
      await tester.tap(find.byIcon(Icons.keyboard_arrow_down).first);
      await tester.pump();

      expect(expansionChanges.length, equals(2));
      expect(
        expansionChanges[1].isExpanded,
        isFalse,
        reason: 'Second tap on chevron should collapse the item',
      );

      await tester.pumpAndSettle();
      expect(
        find.text('Child 1'),
        findsNothing,
        reason: 'Children should be hidden after collapse',
      );
      expect(find.text('Child 2'), findsNothing);

      // Tap 3: Expand again (using chevron)
      await tester.tap(find.byIcon(Icons.keyboard_arrow_down).first);
      await tester.pump();

      expect(expansionChanges.length, equals(3));
      expect(
        expansionChanges[2].isExpanded,
        isTrue,
        reason: 'Third tap on chevron should expand the item again',
      );

      await tester.pumpAndSettle();
      expect(find.text('Child 1'), findsOneWidget);
      expect(find.text('Child 2'), findsOneWidget);

      // Tap 4: Collapse again (using chevron)
      await tester.tap(find.byIcon(Icons.keyboard_arrow_down).first);
      await tester.pump();

      expect(expansionChanges.length, equals(4));
      expect(
        expansionChanges[3].isExpanded,
        isFalse,
        reason: 'Fourth tap on chevron should collapse the item again',
      );

      await tester.pumpAndSettle();
      expect(find.text('Child 1'), findsNothing);
      expect(find.text('Child 2'), findsNothing);
    });

    testWidgets('should handle nested expansion correctly', (
      WidgetTester tester,
    ) async {
      const items = [
        HierarchicalMenuItem(
          id: 'level1',
          title: 'Level 1',
          level: 1,
          children: [
            HierarchicalMenuItem(
              id: 'level2',
              title: 'Level 2',
              level: 2,
              children: [
                HierarchicalMenuItem(id: 'level3', title: 'Level 3', level: 3),
              ],
            ),
          ],
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: HierarchicalMenu(items: items)),
        ),
      );

      // Initially, only level 1 should be visible
      expect(find.text('Level 1'), findsOneWidget);
      expect(find.text('Level 2'), findsNothing);
      expect(find.text('Level 3'), findsNothing);

      // Expand level 1 (tap on first chevron)
      await tester.tap(find.byIcon(Icons.keyboard_arrow_down).first);
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.text('Level 1'), findsOneWidget);
      expect(find.text('Level 2'), findsOneWidget);
      expect(find.text('Level 3'), findsNothing);

      // Expand level 2 (tap on second chevron - now visible)
      await tester.tap(find.byIcon(Icons.keyboard_arrow_down).last);
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.text('Level 1'), findsOneWidget);
      expect(find.text('Level 2'), findsOneWidget);
      expect(find.text('Level 3'), findsOneWidget);

      // Collapse level 2 (tap on second chevron)
      await tester.tap(find.byIcon(Icons.keyboard_arrow_down).last);
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.text('Level 1'), findsOneWidget);
      expect(find.text('Level 2'), findsOneWidget);
      expect(find.text('Level 3'), findsNothing);

      // Collapse level 1 (tap on first chevron)
      await tester.tap(find.byIcon(Icons.keyboard_arrow_down).first);
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.text('Level 1'), findsOneWidget);
      expect(find.text('Level 2'), findsNothing);
      expect(find.text('Level 3'), findsNothing);
    });

    testWidgets(
      'should call onTap callback when tapping on text, not chevron',
      (WidgetTester tester) async {
        int tapCount = 0;
        int expansionChangeCount = 0;

        final items = [
          HierarchicalMenuItem(
            id: 'item',
            title: 'Test Item',
            level: 1,
            onTap: () {
              tapCount++;
            },
            children: const [
              HierarchicalMenuItem(id: 'child', title: 'Child', level: 2),
            ],
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: HierarchicalMenu(
                items: items,
                onItemExpansionChanged: (_) {
                  expansionChangeCount++;
                },
              ),
            ),
          ),
        );

        // Tapping on text should call onTap but NOT expansion
        await tester.tap(find.text('Test Item'));
        await tester.pump();

        expect(
          tapCount,
          equals(1),
          reason: 'onTap should be called when tapping on text',
        );
        expect(
          expansionChangeCount,
          equals(0),
          reason:
              'onExpansionChanged should NOT be called when tapping on text',
        );

        // Verify children are still not visible
        await tester.pumpAndSettle();
        expect(find.text('Child'), findsNothing);

        // Tapping on chevron should call expansion but NOT onTap
        await tester.tap(find.byIcon(Icons.keyboard_arrow_down).first);
        await tester.pump();

        expect(
          tapCount,
          equals(1),
          reason: 'onTap should NOT be called when tapping on chevron',
        );
        expect(
          expansionChangeCount,
          equals(1),
          reason: 'onExpansionChanged should be called when tapping on chevron',
        );

        // Verify children are now visible
        await tester.pumpAndSettle();
        expect(find.text('Child'), findsOneWidget);

        // Multiple taps on text should call onTap each time
        for (int i = 2; i <= 5; i++) {
          await tester.tap(find.text('Test Item'));
          await tester.pump();

          expect(
            tapCount,
            equals(i),
            reason: 'onTap should be called on tap $i',
          );
          expect(
            expansionChangeCount,
            equals(1),
            reason: 'onExpansionChanged should still be 1',
          );

          await tester.pumpAndSettle();
        }
      },
    );

    testWidgets(
      'should maintain separate expansion states for multiple items',
      (WidgetTester tester) async {
        const items = [
          HierarchicalMenuItem(
            id: 'parent1',
            title: 'Parent 1',
            level: 1,
            children: [
              HierarchicalMenuItem(id: 'child1', title: 'Child 1', level: 2),
            ],
          ),
          HierarchicalMenuItem(
            id: 'parent2',
            title: 'Parent 2',
            level: 1,
            children: [
              HierarchicalMenuItem(id: 'child2', title: 'Child 2', level: 2),
            ],
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: HierarchicalMenu(items: items)),
          ),
        );

        // Expand parent 1 (tap on first chevron)
        await tester.tap(find.byIcon(Icons.keyboard_arrow_down).first);
        await tester.pump();
        await tester.pumpAndSettle();

        expect(find.text('Child 1'), findsOneWidget);
        expect(find.text('Child 2'), findsNothing);

        // Expand parent 2 (tap on second chevron)
        await tester.tap(find.byIcon(Icons.keyboard_arrow_down).last);
        await tester.pump();
        await tester.pumpAndSettle();

        expect(find.text('Child 1'), findsOneWidget);
        expect(find.text('Child 2'), findsOneWidget);

        // Collapse parent 1 (tap on first chevron)
        await tester.tap(find.byIcon(Icons.keyboard_arrow_down).first);
        await tester.pump();
        await tester.pumpAndSettle();

        expect(find.text('Child 1'), findsNothing);
        expect(find.text('Child 2'), findsOneWidget);

        // Collapse parent 2 (tap on second chevron)
        await tester.tap(find.byIcon(Icons.keyboard_arrow_down).last);
        await tester.pump();
        await tester.pumpAndSettle();

        expect(find.text('Child 1'), findsNothing);
        expect(find.text('Child 2'), findsNothing);
      },
    );

    testWidgets('should not show chevron for items without children', (
      WidgetTester tester,
    ) async {
      const items = [
        HierarchicalMenuItem(
          id: 'parent',
          title: 'Parent with Children',
          level: 1,
          children: [
            HierarchicalMenuItem(id: 'child', title: 'Child', level: 2),
          ],
        ),
        HierarchicalMenuItem(
          id: 'standalone',
          title: 'Standalone Item',
          level: 1,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: HierarchicalMenu(items: items)),
        ),
      );

      // Should find exactly one chevron (only for parent with children)
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);

      // Verify we can tap on standalone item without issues
      int tapCount = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HierarchicalMenu(
              items: [
                HierarchicalMenuItem(
                  id: 'standalone',
                  title: 'Standalone Item',
                  level: 1,
                  onTap: () => tapCount++,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.text('Standalone Item'));
      await tester.pump();

      expect(tapCount, equals(1));
      expect(find.byIcon(Icons.keyboard_arrow_down), findsNothing);
    });
  });
}
