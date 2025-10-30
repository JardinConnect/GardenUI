import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';
import 'package:garden_ui/ui/foundation/padding/space_design_system.dart';
import 'package:garden_ui/ui/foundation/radius/radius_design_system.dart';
import 'package:garden_ui/ui/foundation/shadow/shadow_design_system.dart';

void main() {
  group('GardenCard Widget Tests', () {
    testWidgets('renders with child widget', (WidgetTester tester) async {
      const testChild = Text('Test Content');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: GardenCard(child: testChild)),
        ),
      );

      expect(find.byType(GardenCard), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('applies shadow when hasShadow is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenCard(hasShadow: true, child: Text('Shadow Test')),
          ),
        ),
      );

      final containerFinder = find.descendant(
        of: find.byType(GardenCard),
        matching: find.byType(Container),
      );

      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.boxShadow, isNotNull);
      expect(decoration.boxShadow, equals(GardenShadow.shadowMd));
    });

    testWidgets('does not apply shadow when hasShadow is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenCard(hasShadow: false, child: Text('No Shadow Test')),
          ),
        ),
      );

      final containerFinder = find.descendant(
        of: find.byType(GardenCard),
        matching: find.byType(Container),
      );

      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.boxShadow, isNull);
    });

    testWidgets('applies border when hasBorder is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenCard(hasBorder: true, child: Text('Border Test')),
          ),
        ),
      );

      final containerFinder = find.descendant(
        of: find.byType(GardenCard),
        matching: find.byType(Container),
      );

      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.border, isNotNull);
      final border = decoration.border as Border;
      expect(border.top.color, equals(GardenColors.base.shade300));
      expect(border.top.width, equals(1.0));
    });

    testWidgets('does not apply border when hasBorder is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenCard(hasBorder: false, child: Text('No Border Test')),
          ),
        ),
      );

      final containerFinder = find.descendant(
        of: find.byType(GardenCard),
        matching: find.byType(Container),
      );

      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.border, isNull);
    });

    testWidgets(
      'applies correct padding, background color, and border radius',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: GardenCard(child: Text('Style Test'))),
          ),
        );

        final containerFinder = find.descendant(
          of: find.byType(GardenCard),
          matching: find.byType(Container),
        );

        expect(containerFinder, findsOneWidget);

        final containerWidget = tester.widget<Container>(containerFinder);
        final decoration = containerWidget.decoration as BoxDecoration;

        // Check background color
        expect(decoration.color, equals(GardenColors.base.shade50));

        // Check border radius
        expect(decoration.borderRadius, equals(GardenRadius.radiusMd));

        // Check padding
        expect(
          containerWidget.padding,
          equals(EdgeInsets.all(GardenSpace.paddingMd)),
        );
      },
    );

    testWidgets('applies both shadow and border when both are enabled', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenCard(
              hasShadow: true,
              hasBorder: true,
              child: Text('Both Test'),
            ),
          ),
        ),
      );

      final containerFinder = find.descendant(
        of: find.byType(GardenCard),
        matching: find.byType(Container),
      );

      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.boxShadow, isNotNull);
      expect(decoration.border, isNotNull);
    });
  });
}
