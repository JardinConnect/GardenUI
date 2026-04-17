import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';

const _twoThresholds = SensorThreshold(
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
);

SensorPageData _tempSensor({Color? color}) => (
  sensorType: SensorType.airTemperature,
  threshold: _twoThresholds,
  iconColor: color ?? GardenColors.redAlert.shade500,
);

void main() {
  group('SensorAlertCard Widget Tests', () {
    testWidgets('renders with temperature sensor', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              title: 'Alert soil temperature',
              sensors: [
                (
                  sensorType: SensorType.soilTemperature,
                  threshold: _twoThresholds,
                  iconColor: GardenColors.redAlert.shade500,
                ),
              ],
              isEnabled: true,
              onToggle: (value) {},
            ),
          ),
        ),
      );

      expect(find.byType(SensorAlertCard), findsOneWidget);
      expect(find.text('Alert soil temperature'), findsOneWidget);
      expect(find.text('35°C'), findsOneWidget);
      expect(find.text('2°C'), findsOneWidget);
    });

    testWidgets('renders with humidity sensor', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              title: 'Alert surface humidity',
              sensors: [
                (
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
                  iconColor: GardenColors.blueInfo.shade400,
                ),
              ],
              isEnabled: true,
              onToggle: (value) {},
            ),
          ),
        ),
      );

      expect(find.byType(SensorAlertCard), findsOneWidget);
      expect(find.text('Alert surface humidity'), findsOneWidget);
      expect(find.text('90%'), findsOneWidget);
      expect(find.text('10%'), findsOneWidget);
    });

    testWidgets('displays correct labels', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              title: 'Alert air temperature',
              sensors: [_tempSensor()],
              isEnabled: true,
              onToggle: (value) {},
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
              title: 'Alert air temperature',
              sensors: [_tempSensor()],
              isEnabled: true,
              onToggle: (value) {},
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
              title: 'Alert air temperature',
              sensors: [_tempSensor()],
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

    testWidgets('displays pagination dots', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              title: 'Alert air temperature',
              sensors: [
                _tempSensor(),
                (
                  sensorType: SensorType.humiditySurface,
                  threshold: _twoThresholds,
                  iconColor: GardenColors.blueInfo.shade400,
                ),
                (
                  sensorType: SensorType.rain,
                  threshold: _twoThresholds,
                  iconColor: GardenColors.blueInfo.shade500,
                ),
              ],
              isEnabled: true,
              onToggle: (value) {},
            ),
          ),
        ),
      );

      expect(find.byType(PaginationDots), findsOneWidget);
    });

    testWidgets('navigates to next page when right arrow is tapped', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              title: 'Alert',
              sensors: [
                _tempSensor(),
                (
                  sensorType: SensorType.rain,
                  threshold: const SensorThreshold(
                    thresholds: [
                      ThresholdValue(
                        value: 100,
                        unit: ' mm',
                        label: 'maximale',
                        alertType: MenuAlertType.none,
                      ),
                    ],
                  ),
                  iconColor: GardenColors.blueInfo.shade500,
                ),
              ],
              isEnabled: true,
              onToggle: (value) {},
            ),
          ),
        ),
      );

      // Initially on page 0 — right arrow is enabled
      final rightArrow = find.byIcon(Icons.chevron_right);
      expect(rightArrow, findsOneWidget);
      await tester.tap(rightArrow);
      await tester.pumpAndSettle();

      // Now on page 1 — right arrow is disabled, left arrow is enabled
      final leftArrow = find.byIcon(Icons.chevron_left);
      expect(leftArrow, findsOneWidget);
    });

    testWidgets('displays alert indicators', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              title: 'Alert air temperature',
              sensors: [_tempSensor()],
              isEnabled: true,
              onToggle: (value) {},
            ),
          ),
        ),
      );

      expect(find.byType(AlertIndicator), findsNWidgets(2));
    });

    testWidgets('displays sensor icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              title: 'Alert air temperature',
              sensors: [_tempSensor()],
              isEnabled: true,
              onToggle: (value) {},
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
              title: 'Alert rain',
              sensors: [
                (
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
                  iconColor: GardenColors.blueInfo.shade500,
                ),
              ],
              isEnabled: true,
              onToggle: (value) {},
            ),
          ),
        ),
      );

      expect(find.byType(SensorAlertCard), findsOneWidget);
      expect(find.text('Alert rain'), findsOneWidget);
    });

    testWidgets('wraps content in GardenCard', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorAlertCard(
              title: 'Alert air temperature',
              sensors: [_tempSensor()],
              isEnabled: true,
              onToggle: (value) {},
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
              title: 'Alert light intensity',
              sensors: [
                (
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
                  iconColor: GardenColors.secondary.shade400,
                ),
              ],
              isEnabled: true,
              onToggle: (value) {},
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
              title: 'Alert air temperature',
              sensors: [
                (
                  sensorType: SensorType.airTemperature,
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
                  iconColor: GardenColors.redAlert.shade500,
                ),
              ],
              isEnabled: true,
              onToggle: (value) {},
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
