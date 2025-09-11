import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_workspace/ui/components.dart';

void main() {
  group('HierarchicalMenuItem', () {
    testWidgets('should display title and subtitle', (
      WidgetTester tester,
    ) async {
      const item = HierarchicalMenuItem(
        id: 'test',
        title: 'Test Title',
        subtitle: 'Test Subtitle',
        level: 1,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: HierarchicalMenuItemWidget(item: item)),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
    });

    testWidgets('should show chevron when has children', (
      WidgetTester tester,
    ) async {
      const item = HierarchicalMenuItem(
        id: 'test',
        title: 'Test Title',
        level: 1,
        children: [HierarchicalMenuItem(id: 'child', title: 'Child', level: 2)],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: HierarchicalMenuItemWidget(item: item)),
        ),
      );

      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    });

    testWidgets('should show alert indicator when alert type is set', (
      WidgetTester tester,
    ) async {
      const item = HierarchicalMenuItem(
        id: 'test',
        title: 'Test Title',
        level: 1,
        alertType: MenuAlertType.warning,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: HierarchicalMenuItemWidget(item: item)),
        ),
      );

      expect(find.byType(AlertIndicator), findsOneWidget);
    });

    testWidgets('should show level indicator', (WidgetTester tester) async {
      const item = HierarchicalMenuItem(
        id: 'test',
        title: 'Test Title',
        level: 3,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: HierarchicalMenuItemWidget(item: item)),
        ),
      );

      expect(find.byType(LevelIndicator), findsOneWidget);
    });

    testWidgets('should call onItemTapped when tapped', (
      WidgetTester tester,
    ) async {
      bool tapped = false;
      const item = HierarchicalMenuItem(
        id: 'test',
        title: 'Test Title',
        level: 1,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HierarchicalMenuItemWidget(
              item: item,
              onItemTapped: (item) {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(HierarchicalMenuItemWidget));
      expect(tapped, isTrue);
    });

    testWidgets(
      'should call onExpansionChanged when tapped on item with children',
      (WidgetTester tester) async {
        bool expansionChanged = false;
        const item = HierarchicalMenuItem(
          id: 'test',
          title: 'Test Title',
          level: 1,
          children: [
            HierarchicalMenuItem(id: 'child', title: 'Child', level: 2),
          ],
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: HierarchicalMenuItemWidget(
                item: item,
                onExpansionChanged: (item) {
                  expansionChanged = true;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(HierarchicalMenuItemWidget));
        expect(expansionChanged, isTrue);
      },
    );
  });

  group('HierarchicalMenu', () {
    testWidgets('should display all root items', (WidgetTester tester) async {
      const items = [
        HierarchicalMenuItem(id: 'item1', title: 'Item 1', level: 1),
        HierarchicalMenuItem(id: 'item2', title: 'Item 2', level: 1),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: HierarchicalMenu(items: items)),
        ),
      );

      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
    });

    testWidgets('should expand children when item is expanded', (
      WidgetTester tester,
    ) async {
      const items = [
        HierarchicalMenuItem(
          id: 'parent',
          title: 'Parent',
          level: 1,
          isExpanded: true,
          children: [
            HierarchicalMenuItem(id: 'child', title: 'Child', level: 2),
          ],
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: HierarchicalMenu(items: items)),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Parent'), findsOneWidget);
      expect(find.text('Child'), findsOneWidget);
    });

    testWidgets('should call onItemSelected when item is tapped', (
      WidgetTester tester,
    ) async {
      HierarchicalMenuItem? selectedItem;
      const items = [
        HierarchicalMenuItem(id: 'test', title: 'Test Item', level: 1),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HierarchicalMenu(
              items: items,
              onItemSelected: (item) {
                selectedItem = item;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Test Item'));
      expect(selectedItem?.id, equals('test'));
    });
  });

  group('AlertIndicator', () {
    testWidgets('should show warning icon for warning type', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AlertIndicator(alertType: MenuAlertType.warning),
          ),
        ),
      );

      expect(find.byIcon(Icons.warning), findsOneWidget);
    });

    testWidgets('should show warning icon for error type', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AlertIndicator(alertType: MenuAlertType.error)),
        ),
      );

      expect(find.byIcon(Icons.warning), findsOneWidget);
    });

    testWidgets('should not show icon for none type', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AlertIndicator(alertType: MenuAlertType.none)),
        ),
      );

      expect(find.byIcon(Icons.warning), findsNothing);
    });
  });

  group('LevelIndicator', () {
    testWidgets('should display level indicator', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: LevelIndicator(level: 3))),
      );

      expect(find.byType(LevelIndicator), findsOneWidget);
    });
  });
}
