import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';

void main() {
  group('SensorAlertCard Widget Tests', () {
    testWidgets('renders with temperature sensor', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              sensorType: SensorType.temperature,
              threshold: const SensorThreshold(
                thresholds: [
                  ThresholdValue(
                    value: 35,
                    unit: '°C',
                    label: 'maximale',
                    alertType: MenuAlertType.warning,
                  ),
                  ThresholdValue(
                    value: 2,
                    unit: '°C',
                    label: 'minimale',
                    alertType: MenuAlertType.warning,
                  ),
                ],
              ),
              isEnabled: true,
              onToggle: (value) {},
              totalPages: 5,
              currentPage: 2,
              onPageChanged: (index) {},
              iconColor: GardenColors.redAlert.shade500,
            ),
          ),
        ),
      );

      expect(find.byType(SensorAlertCard), findsOneWidget);
      expect(find.text('Alerte température'), findsOneWidget);
      expect(find.text('35°C'), findsOneWidget);
      expect(find.text('2°C'), findsOneWidget);
    });

    testWidgets('renders with humidity sensor', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              sensorType: SensorType.humiditySurface,
              threshold: const SensorThreshold(
                thresholds: [
                  ThresholdValue(
                    value: 90,
                    unit: '%',
                    label: 'maximale',
                    alertType: MenuAlertType.error,
                  ),
                  ThresholdValue(
                    value: 10,
                    unit: '%',
                    label: 'minimale',
                    alertType: MenuAlertType.error,
                  ),
                ],
              ),
              isEnabled: true,
              onToggle: (value) {},
              totalPages: 5,
              currentPage: 1,
              onPageChanged: (index) {},
              iconColor: GardenColors.blueInfo.shade400,
            ),
          ),
        ),
      );

      expect(find.byType(SensorAlertCard), findsOneWidget);
      expect(find.text('Alerte humidité surface'), findsOneWidget);
      expect(find.text('90%'), findsOneWidget);
      expect(find.text('10%'), findsOneWidget);
    });

    testWidgets('displays correct labels', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              sensorType: SensorType.temperature,
              threshold: const SensorThreshold(
                thresholds: [
                  ThresholdValue(
                    value: 35,
                    unit: '°C',
                    label: 'maximale',
                    alertType: MenuAlertType.warning,
                  ),
                  ThresholdValue(
                    value: 2,
                    unit: '°C',
                    label: 'minimale',
                    alertType: MenuAlertType.warning,
                  ),
                ],
              ),
              isEnabled: true,
              onToggle: (value) {},
              totalPages: 5,
              currentPage: 2,
              onPageChanged: (index) {},
              iconColor: GardenColors.redAlert.shade500,
            ),
          ),
        ),
      );

      expect(find.text('maximale'), findsOneWidget);
      expect(find.text('minimale'), findsOneWidget);
    });

    testWidgets('displays toggle in correct state', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              sensorType: SensorType.temperature,
              threshold: const SensorThreshold(
                thresholds: [
                  ThresholdValue(
                    value: 35,
                    unit: '°C',
                    label: 'maximale',
                    alertType: MenuAlertType.warning,
                  ),
                  ThresholdValue(
                    value: 2,
                    unit: '°C',
                    label: 'minimale',
                    alertType: MenuAlertType.warning,
                  ),
                ],
              ),
              isEnabled: true,
              onToggle: (value) {},
              totalPages: 5,
              currentPage: 2,
              onPageChanged: (index) {},
              iconColor: GardenColors.redAlert.shade500,
            ),
          ),
        ),
      );

      expect(find.byType(GardenToggle), findsOneWidget);
      final toggle = tester.widget<GardenToggle>(find.byType(GardenToggle));
      expect(toggle.isEnabled, true);
    });

    testWidgets('calls onToggle when toggle is tapped', (
      WidgetTester tester,
    ) async {
      bool toggledValue = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              sensorType: SensorType.temperature,
              threshold: const SensorThreshold(
                thresholds: [
                  ThresholdValue(
                    value: 35,
                    unit: '°C',
                    label: 'maximale',
                    alertType: MenuAlertType.warning,
                  ),
                  ThresholdValue(
                    value: 2,
                    unit: '°C',
                    label: 'minimale',
                    alertType: MenuAlertType.warning,
                  ),
                ],
              ),
              isEnabled: false,
              onToggle: (value) {
                toggledValue = value;
              },
              totalPages: 5,
              currentPage: 2,
              onPageChanged: (index) {},
              iconColor: GardenColors.redAlert.shade500,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(toggledValue, true);
    });

    testWidgets('displays correct number of pagination dots', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              sensorType: SensorType.temperature,
              threshold: const SensorThreshold(
                thresholds: [
                  ThresholdValue(
                    value: 35,
                    unit: '°C',
                    label: 'maximale',
                    alertType: MenuAlertType.warning,
                  ),
                  ThresholdValue(
                    value: 2,
                    unit: '°C',
                    label: 'minimale',
                    alertType: MenuAlertType.warning,
                  ),
                ],
              ),
              isEnabled: true,
              onToggle: (value) {},
              totalPages: 5,
              currentPage: 2,
              onPageChanged: (index) {},
              iconColor: GardenColors.redAlert.shade500,
            ),
          ),
        ),
      );

      expect(find.byType(PaginationDots), findsOneWidget);
    });

    testWidgets('calls onPageChanged when dot is tapped', (
      WidgetTester tester,
    ) async {
      int? changedPage;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              sensorType: SensorType.temperature,
              threshold: const SensorThreshold(
                thresholds: [
                  ThresholdValue(
                    value: 35,
                    unit: '°C',
                    label: 'maximale',
                    alertType: MenuAlertType.warning,
                  ),
                  ThresholdValue(
                    value: 2,
                    unit: '°C',
                    label: 'minimale',
                    alertType: MenuAlertType.warning,
                  ),
                ],
              ),
              isEnabled: true,
              onToggle: (value) {},
              totalPages: 5,
              currentPage: 2,
              onPageChanged: (index) {
                changedPage = index;
              },
              iconColor: GardenColors.redAlert.shade500,
            ),
          ),
        ),
      );

      // Find the PaginationDots widget and tap within it
      final paginationDots = find.byType(PaginationDots);
      expect(paginationDots, findsOneWidget);

      // Tap within the PaginationDots bounds (will tap on first dot)
      await tester.tap(paginationDots);
      await tester.pumpAndSettle();

      expect(changedPage, isNotNull);
    });

    testWidgets('displays alert indicators', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              sensorType: SensorType.temperature,
              threshold: const SensorThreshold(
                thresholds: [
                  ThresholdValue(
                    value: 35,
                    unit: '°C',
                    label: 'maximale',
                    alertType: MenuAlertType.warning,
                  ),
                  ThresholdValue(
                    value: 2,
                    unit: '°C',
                    label: 'minimale',
                    alertType: MenuAlertType.warning,
                  ),
                ],
              ),
              isEnabled: true,
              onToggle: (value) {},
              totalPages: 5,
              currentPage: 2,
              onPageChanged: (index) {},
              iconColor: GardenColors.redAlert.shade500,
            ),
          ),
        ),
      );

      // Should find two alert indicators (one for max, one for min)
      expect(find.byType(AlertIndicator), findsNWidgets(2));
    });

    testWidgets('displays sensor icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              sensorType: SensorType.temperature,
              threshold: const SensorThreshold(
                thresholds: [
                  ThresholdValue(
                    value: 35,
                    unit: '°C',
                    label: 'maximale',
                    alertType: MenuAlertType.warning,
                  ),
                  ThresholdValue(
                    value: 2,
                    unit: '°C',
                    label: 'minimale',
                    alertType: MenuAlertType.warning,
                  ),
                ],
              ),
              isEnabled: true,
              onToggle: (value) {},
              totalPages: 5,
              currentPage: 2,
              onPageChanged: (index) {},
              iconColor: GardenColors.redAlert.shade500,
            ),
          ),
        ),
      );

      expect(find.byType(GardenIcon), findsOneWidget);
    });

    testWidgets('renders with no alerts', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              sensorType: SensorType.rain,
              threshold: const SensorThreshold(
                thresholds: [
                  ThresholdValue(
                    value: 100,
                    unit: ' mm',
                    label: 'maximale',
                    alertType: MenuAlertType.none,
                  ),
                  ThresholdValue(
                    value: 0,
                    unit: ' mm',
                    label: 'minimale',
                    alertType: MenuAlertType.none,
                  ),
                ],
              ),
              isEnabled: true,
              onToggle: (value) {},
              totalPages: 5,
              currentPage: 4,
              onPageChanged: (index) {},
              iconColor: GardenColors.blueInfo.shade500,
            ),
          ),
        ),
      );

      expect(find.byType(SensorAlertCard), findsOneWidget);
      expect(find.text('Alerte pluie'), findsOneWidget);
    });

    testWidgets('wraps content in GardenCard', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              sensorType: SensorType.temperature,
              threshold: const SensorThreshold(
                thresholds: [
                  ThresholdValue(
                    value: 35,
                    unit: '°C',
                    label: 'maximale',
                    alertType: MenuAlertType.warning,
                  ),
                  ThresholdValue(
                    value: 2,
                    unit: '°C',
                    label: 'minimale',
                    alertType: MenuAlertType.warning,
                  ),
                ],
              ),
              isEnabled: true,
              onToggle: (value) {},
              totalPages: 5,
              currentPage: 2,
              onPageChanged: (index) {},
              iconColor: GardenColors.redAlert.shade500,
            ),
          ),
        ),
      );

      expect(find.byType(GardenCard), findsOneWidget);
    });

    testWidgets('renders with 3 thresholds', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              sensorType: SensorType.light,
              threshold: const SensorThreshold(
                thresholds: [
                  ThresholdValue(
                    value: 10000,
                    unit: ' lux',
                    label: 'maximale',
                    alertType: MenuAlertType.error,
                  ),
                  ThresholdValue(
                    value: 5000,
                    unit: ' lux',
                    label: 'optimale',
                    alertType: MenuAlertType.none,
                  ),
                  ThresholdValue(
                    value: 1000,
                    unit: ' lux',
                    label: 'minimale',
                    alertType: MenuAlertType.warning,
                  ),
                ],
              ),
              isEnabled: true,
              onToggle: (value) {},
              totalPages: 5,
              currentPage: 0,
              onPageChanged: (index) {},
              iconColor: GardenColors.secondary.shade400,
            ),
          ),
        ),
      );

      expect(find.byType(SensorAlertCard), findsOneWidget);
      expect(find.text('10000 lux'), findsOneWidget);
      expect(find.text('5000 lux'), findsOneWidget);
      expect(find.text('1000 lux'), findsOneWidget);
      expect(find.text('maximale'), findsOneWidget);
      expect(find.text('optimale'), findsOneWidget);
      expect(find.text('minimale'), findsOneWidget);
      expect(find.byType(AlertIndicator), findsNWidgets(3));
    });

    testWidgets('renders with 4 thresholds', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              sensorType: SensorType.temperature,
              threshold: const SensorThreshold(
                thresholds: [
                  ThresholdValue(
                    value: 40,
                    unit: '°C',
                    label: 'critique',
                    alertType: MenuAlertType.error,
                  ),
                  ThresholdValue(
                    value: 30,
                    unit: '°C',
                    label: 'maximale',
                    alertType: MenuAlertType.warning,
                  ),
                  ThresholdValue(
                    value: 10,
                    unit: '°C',
                    label: 'minimale',
                    alertType: MenuAlertType.warning,
                  ),
                  ThresholdValue(
                    value: 0,
                    unit: '°C',
                    label: 'gel',
                    alertType: MenuAlertType.error,
                  ),
                ],
              ),
              isEnabled: true,
              onToggle: (value) {},
              totalPages: 5,
              currentPage: 2,
              onPageChanged: (index) {},
              iconColor: GardenColors.redAlert.shade500,
            ),
          ),
        ),
      );

      expect(find.byType(SensorAlertCard), findsOneWidget);
      expect(find.text('40°C'), findsOneWidget);
      expect(find.text('30°C'), findsOneWidget);
      expect(find.text('10°C'), findsOneWidget);
      expect(find.text('0°C'), findsOneWidget);
      expect(find.text('critique'), findsOneWidget);
      expect(find.text('maximale'), findsOneWidget);
      expect(find.text('minimale'), findsOneWidget);
      expect(find.text('gel'), findsOneWidget);
      expect(find.byType(AlertIndicator), findsNWidgets(4));
    });
  });
}
