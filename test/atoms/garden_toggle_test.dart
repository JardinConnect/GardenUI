import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';

void main() {
  group('GardenToggle Widget Tests', () {
    testWidgets('renders when enabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GardenToggle(isEnabled: true, onToggle: (value) {}),
          ),
        ),
      );

      expect(find.byType(GardenToggle), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('renders when disabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GardenToggle(isEnabled: false, onToggle: (value) {}),
          ),
        ),
      );

      expect(find.byType(GardenToggle), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('calls onToggle when tapped', (WidgetTester tester) async {
      bool toggledValue = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GardenToggle(
              isEnabled: false,
              onToggle: (value) {
                toggledValue = value;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(toggledValue, true);
    });

    testWidgets('switch reflects enabled state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GardenToggle(isEnabled: true, onToggle: (value) {}),
          ),
        ),
      );

      final switchWidget = tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, true);
    });

    testWidgets('switch reflects disabled state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GardenToggle(isEnabled: false, onToggle: (value) {}),
          ),
        ),
      );

      final switchWidget = tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, false);
    });

    testWidgets('shows enabled icon when provided and enabled', (
      WidgetTester tester,
    ) async {
      const icon = Icons.check;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GardenToggle(
              isEnabled: true,
              onToggle: (_) {},
              enabledIcon: icon,
            ),
          ),
        ),
      );

      final switchWidget = tester.widget<Switch>(find.byType(Switch));
      final resolvedIcon = switchWidget.thumbIcon?.resolve({
        WidgetState.selected,
      });
      expect(resolvedIcon?.icon, icon);
    });

    testWidgets('shows disabled icon when provided and disabled', (
      WidgetTester tester,
    ) async {
      const icon = Icons.close;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GardenToggle(
              isEnabled: false,
              onToggle: (_) {},
              disabledIcon: icon,
            ),
          ),
        ),
      );

      final switchWidget = tester.widget<Switch>(find.byType(Switch));
      final resolvedIcon = switchWidget.thumbIcon?.resolve({});
      expect(resolvedIcon?.icon, icon);
    });
  });
}
