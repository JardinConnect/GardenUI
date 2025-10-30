import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';

void main() {
  group('Button Widget Tests', () {
    testWidgets('renders label correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Button(label: 'Send', onPressed: () {}),
          ),
        ),
      );

      expect(find.text('Send'), findsOneWidget);
      expect(find.byType(FilledButton), findsOneWidget);
    });

    testWidgets('renders icon when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Button(
              label: 'Send',
              icon: Icons.send,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.send), findsOneWidget);
      expect(find.text('Send'), findsOneWidget);
    });

    testWidgets('applies primary severity color', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Button(label: 'Primary', onPressed: () {}),
          ),
        ),
      );

      final filledButton = tester.widget<FilledButton>(find.byType(FilledButton));
      final style = filledButton.style;
      expect(
        style?.backgroundColor?.resolve({}),
        GardenColors.primary.shade500,
      );
    });

    testWidgets('applies danger severity color', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Button(
              label: 'Delete',
              severity: ButtonSeverity.danger,
              onPressed: () {},
            ),
          ),
        ),
      );

      final filledButton = tester.widget<FilledButton>(find.byType(FilledButton));
      final style = filledButton.style;
      expect(
        style?.backgroundColor?.resolve({}),
        GardenColors.redAlert.shade500,
      );
    });

    testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Button(
              label: 'Click me',
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(FilledButton));
      await tester.pump();

      expect(pressed, isTrue);
    });
  });
}
