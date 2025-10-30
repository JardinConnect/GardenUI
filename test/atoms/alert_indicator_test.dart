import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';

void main() {
  group('AlertIndicator Widget Tests', () {
    testWidgets('renders with warning alert type', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AlertIndicator(alertType: MenuAlertType.warning),
          ),
        ),
      );

      expect(find.byType(AlertIndicator), findsOneWidget);
      expect(find.byIcon(Icons.warning), findsOneWidget);
    });

    testWidgets('renders with error alert type', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AlertIndicator(alertType: MenuAlertType.error)),
        ),
      );

      expect(find.byType(AlertIndicator), findsOneWidget);
      expect(find.byIcon(Icons.warning), findsOneWidget);
    });

    testWidgets('renders empty with none alert type', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AlertIndicator(alertType: MenuAlertType.none)),
        ),
      );

      expect(find.byType(AlertIndicator), findsOneWidget);
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('applies correct color for warning', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AlertIndicator(alertType: MenuAlertType.warning),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.warning));
      expect(iconWidget.color, GardenColors.yellowWarning.shade500);
    });

    testWidgets('applies correct color for error', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AlertIndicator(alertType: MenuAlertType.error)),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.warning));
      expect(iconWidget.color, GardenColors.redAlert.shade500);
    });

    testWidgets('applies correct size for sm', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AlertIndicator(
              alertType: MenuAlertType.warning,
              size: AlertIndicatorSize.sm,
            ),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.warning));
      expect(iconWidget.size, 12.0);
    });

    testWidgets('applies correct size for md', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AlertIndicator(
              alertType: MenuAlertType.warning,
              size: AlertIndicatorSize.md,
            ),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.warning));
      expect(iconWidget.size, 16.0);
    });

    testWidgets('applies correct size for lg', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AlertIndicator(
              alertType: MenuAlertType.warning,
              size: AlertIndicatorSize.lg,
            ),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.warning));
      expect(iconWidget.size, 20.0);
    });
  });
}
