import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';

void main() {
  Color infoColor = GardenColors.blueInfo.shade500;
  Color alertColor = GardenColors.redAlert.shade500;
  Color successColor = GardenColors.tertiary.shade600;
  Color warningColor = GardenColors.yellowWarning.shade500;

  group('NotificationIcon Widget Tests', () {
    testWidgets('default severity should be Info', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: NotificationIcon())),
      );

      final containerFinder = find.descendant(
        of: find.byType(NotificationIcon),
        matching: find.byType(Container),
      );
      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final boxDecoration = containerWidget.decoration as BoxDecoration;
      expect(boxDecoration.color, infoColor);
    });

    testWidgets('should be blue when the given severity is Info', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NotificationIcon(severity: NotificationIconSeverity.info),
          ),
        ),
      );

      final containerFinder = find.descendant(
        of: find.byType(NotificationIcon),
        matching: find.byType(Container),
      );
      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final boxDecoration = containerWidget.decoration as BoxDecoration;
      expect(boxDecoration.color, infoColor);
    });

    testWidgets('should be red when the given severity is Alert', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NotificationIcon(severity: NotificationIconSeverity.alert),
          ),
        ),
      );

      final containerFinder = find.descendant(
        of: find.byType(NotificationIcon),
        matching: find.byType(Container),
      );
      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final boxDecoration = containerWidget.decoration as BoxDecoration;
      expect(boxDecoration.color, alertColor);
    });

    testWidgets('should be red when the given severity is Success', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NotificationIcon(severity: NotificationIconSeverity.success),
          ),
        ),
      );

      final containerFinder = find.descendant(
        of: find.byType(NotificationIcon),
        matching: find.byType(Container),
      );
      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final boxDecoration = containerWidget.decoration as BoxDecoration;
      expect(boxDecoration.color, successColor);
    });

    testWidgets('should be red when the given severity is Warning', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NotificationIcon(severity: NotificationIconSeverity.warning),
          ),
        ),
      );

      final containerFinder = find.descendant(
        of: find.byType(NotificationIcon),
        matching: find.byType(Container),
      );
      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final boxDecoration = containerWidget.decoration as BoxDecoration;
      expect(boxDecoration.color, warningColor);
    });
  });
}
