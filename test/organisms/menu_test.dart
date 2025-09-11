import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_workspace/ui/components.dart';

void main() {
  group('Menu Widget Tests', () {
    testWidgets('renders top and bottom items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Menu(
              items: [
                MenuItem(icon: Icons.home, label: 'Home', onTap: () {}),
                MenuItem(icon: Icons.search, label: 'Search', onTap: () {}),
              ],
              bottomItems: [
                MenuItem(icon: Icons.settings, label: 'Settings', onTap: () {}),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('applies correct MenuItemSize for each MenuSize', (
      tester,
    ) async {
      Future<MenuItem> pumpAndGetMenuItem(MenuSize size) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Menu(
                items: [
                  MenuItem(icon: Icons.home, label: 'Home', onTap: () {}),
                ],
                bottomItems: [],
                size: size,
              ),
            ),
          ),
        );

        return tester.widget<MenuItem>(find.byType(MenuItem).first);
      }

      final smItem = await pumpAndGetMenuItem(MenuSize.sm);
      expect(smItem.size, equals(MenuItemSize.sm));

      final mdItem = await pumpAndGetMenuItem(MenuSize.md);
      expect(mdItem.size, equals(MenuItemSize.md));

      final lgItem = await pumpAndGetMenuItem(MenuSize.lg);
      expect(lgItem.size, equals(MenuItemSize.lg));
    });

    testWidgets('selects item when tapped and updates active state', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Menu(
              items: [
                MenuItem(icon: Icons.home, label: 'Home', onTap: () {}),
                MenuItem(icon: Icons.search, label: 'Search', onTap: () {}),
              ],
              bottomItems: [],
            ),
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      final searchItem = tester.widget<MenuItem>(
        find.widgetWithText(MenuItem, 'Search'),
      );
      expect(searchItem.isActive, true);

      final homeItem = tester.widget<MenuItem>(
        find.widgetWithText(MenuItem, 'Home'),
      );
      expect(homeItem.isActive, false);
    });
  });

  testWidgets('first MenuItem is active by default', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Menu(
            items: [
              MenuItem(icon: Icons.home, label: 'Home', onTap: () {}),
              MenuItem(icon: Icons.search, label: 'Search', onTap: () {}),
            ],
            bottomItems: [],
          ),
        ),
      ),
    );

    final homeItem = tester.widget<MenuItem>(
      find.widgetWithText(MenuItem, 'Home'),
    );
    final searchItem = tester.widget<MenuItem>(
      find.widgetWithText(MenuItem, 'Search'),
    );

    expect(homeItem.isActive, isTrue);
    expect(searchItem.isActive, isFalse);
  });

  testWidgets('tapping another MenuItem changes active state', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Menu(
            items: [
              MenuItem(icon: Icons.home, label: 'Home', onTap: () {}),
              MenuItem(icon: Icons.search, label: 'Search', onTap: () {}),
            ],
            bottomItems: [],
          ),
        ),
      ),
    );

    await tester.tap(find.text('Search'));
    await tester.pumpAndSettle();

    final homeItem = tester.widget<MenuItem>(
      find.widgetWithText(MenuItem, 'Home'),
    );
    final searchItem = tester.widget<MenuItem>(
      find.widgetWithText(MenuItem, 'Search'),
    );

    expect(homeItem.isActive, isFalse);
    expect(searchItem.isActive, isTrue);
  });
}
