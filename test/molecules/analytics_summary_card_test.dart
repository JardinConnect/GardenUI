import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';

void main() {
  group('AnalyticsSummaryCard Widget Tests', () {
    testWidgets('renders correctly with provided data', (
      WidgetTester tester,
    ) async {
      const nodeName = 'Serre Nord';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnalyticsSummaryCard(
              name: nodeName,
              batteryPercentage: 80,
              light: 1500,
              rain: 20,
              humiditySurface: 45,
              humidityDepth: 50,
              temperatureSurface: 25.5,
              temperatureDepth: 22.0,
              onPressed: () {},
            ),
          ),
        ),
      );

      // Verify Name
      expect(find.text(nodeName), findsOneWidget);

      // Verify Sensor Values are displayed
      expect(find.text('1500 lux'), findsOneWidget);
      expect(find.text('20%'), findsOneWidget);
      expect(find.text('45%'), findsOneWidget);
      expect(find.text('50%'), findsOneWidget);
      expect(find.text('25.5°C'), findsOneWidget);
      expect(find.text('22.0°C'), findsOneWidget);

      // Verify Battery Indicator exists
      expect(find.byType(BatteryIndicator), findsOneWidget);
    });

    testWidgets('formats low light values correctly (no kL)', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnalyticsSummaryCard(
              name: 'Test Node',
              batteryPercentage: 80,
              light: 400, // < 1000
              rain: 0,
              humiditySurface: 0,
              humidityDepth: 0,
              temperatureSurface: 0,
              temperatureDepth: 0,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('400 lux'), findsOneWidget);
    });

    testWidgets('triggers onPressed callback when tapped', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnalyticsSummaryCard(
              name: 'Test Node',
              batteryPercentage: 80,
              light: 100,
              rain: 0,
              humiditySurface: 0,
              humidityDepth: 0,
              temperatureSurface: 0,
              temperatureDepth: 0,
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AnalyticsSummaryCard));
      expect(wasPressed, isTrue);
    });

    testWidgets('shows click cursor on hover', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnalyticsSummaryCard(
              name: 'Test Node',
              batteryPercentage: 80,
              light: 100,
              rain: 0,
              humiditySurface: 0,
              humidityDepth: 0,
              temperatureSurface: 0,
              temperatureDepth: 0,
              onPressed: () {},
            ),
          ),
        ),
      );

      final mouseRegion = tester.widget<MouseRegion>(
        find
            .descendant(
              of: find.byType(AnalyticsSummaryCard),
              matching: find.byType(MouseRegion),
            )
            .first,
      );

      expect(mouseRegion.cursor, SystemMouseCursors.click);
    });

    testWidgets(
      'does not render BatteryIndicator when batteryPercentage is null',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AnalyticsSummaryCard(
                name: 'Test Node',
                batteryPercentage: null,
                light: 1500,
                rain: 20,
                humiditySurface: 45,
                humidityDepth: 50,
                temperatureSurface: 25.5,
                temperatureDepth: 22.0,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(BatteryIndicator), findsNothing);
      },
    );
  });
}
