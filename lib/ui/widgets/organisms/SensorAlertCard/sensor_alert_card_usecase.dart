import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';

@widgetbook.UseCase(
  name: 'Temperature with warnings (2 thresholds)',
  type: SensorAlertCard,
)
Widget sensorAlertCardTemperatureUseCase(BuildContext context) {
  return SizedBox(
    width: 400,
    child: SensorAlertCard(
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
      currentPage: 3,
      onPageChanged: (index) {},
      iconColor: GardenColors.redAlert.shade500,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Humidity with errors (2 thresholds)',
  type: SensorAlertCard,
)
Widget sensorAlertCardHumidityUseCase(BuildContext context) {
  return SizedBox(
    width: 400,
    child: SensorAlertCard(
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
  );
}

@widgetbook.UseCase(name: 'Light with 3 thresholds', type: SensorAlertCard)
Widget sensorAlertCardLightThreeThresholdsUseCase(BuildContext context) {
  return SizedBox(
    width: 400,
    child: SensorAlertCard(
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
      totalPages: 3,
      currentPage: 0,
      onPageChanged: (index) {},
      iconColor: GardenColors.secondary.shade400,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Temperature with 4 thresholds',
  type: SensorAlertCard,
)
Widget sensorAlertCardTemperatureFourThresholdsUseCase(BuildContext context) {
  return SizedBox(
    width: 400,
    child: SensorAlertCard(
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
  );
}

@widgetbook.UseCase(name: 'Disabled toggle', type: SensorAlertCard)
Widget sensorAlertCardDisabledUseCase(BuildContext context) {
  return SizedBox(
    width: 400,
    child: SensorAlertCard(
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
      onToggle: (value) {},
      totalPages: 5,
      currentPage: 2,
      onPageChanged: (index) {},
      iconColor: GardenColors.redAlert.shade500,
    ),
  );
}

@widgetbook.UseCase(name: 'No alerts', type: SensorAlertCard)
Widget sensorAlertCardNoAlertsUseCase(BuildContext context) {
  return SizedBox(
    width: 400,
    child: SensorAlertCard(
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
  );
}

@widgetbook.UseCase(name: 'Custom icon color', type: SensorAlertCard)
Widget sensorAlertCardCustomIconColorUseCase(BuildContext context) {
  return SizedBox(
    width: 400,
    child: SensorAlertCard(
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
      currentPage: 0,
      onPageChanged: (index) {},
      iconColor: GardenColors.primary.shade500,
    ),
  );
}

@widgetbook.UseCase(name: 'Interactive', type: SensorAlertCard)
Widget sensorAlertCardInteractiveUseCase(BuildContext context) {
  return const SizedBox(width: 400, child: _InteractiveSensorAlertCard());
}

class _InteractiveSensorAlertCard extends StatefulWidget {
  const _InteractiveSensorAlertCard();

  @override
  State<_InteractiveSensorAlertCard> createState() =>
      _InteractiveSensorAlertCardState();
}

class _InteractiveSensorAlertCardState
    extends State<_InteractiveSensorAlertCard> {
  bool isEnabled = true;
  int currentPage = 0;

  final List<_SensorData> sensors = [
    _SensorData(
      type: SensorType.temperature,
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
      iconColor: GardenColors.redAlert.shade500,
    ),
    _SensorData(
      type: SensorType.humiditySurface,
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
            alertType: MenuAlertType.none,
          ),
        ],
      ),
      iconColor: GardenColors.blueInfo.shade400,
    ),
    _SensorData(
      type: SensorType.humidityDepth,
      threshold: const SensorThreshold(
        thresholds: [
          ThresholdValue(
            value: 85,
            unit: '%',
            label: 'maximale',
            alertType: MenuAlertType.warning,
          ),
          ThresholdValue(
            value: 15,
            unit: '%',
            label: 'minimale',
            alertType: MenuAlertType.warning,
          ),
        ],
      ),
      iconColor: GardenColors.blueInfo.shade600,
    ),
    _SensorData(
      type: SensorType.light,
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
    _SensorData(
      type: SensorType.rain,
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
  ];

  @override
  Widget build(BuildContext context) {
    final currentSensor = sensors[currentPage];
    return SensorAlertCard(
      sensorType: currentSensor.type,
      threshold: currentSensor.threshold,
      isEnabled: isEnabled,
      onToggle: (value) {
        setState(() {
          isEnabled = value;
        });
      },
      totalPages: sensors.length,
      currentPage: currentPage,
      onPageChanged: (index) {
        setState(() {
          currentPage = index;
        });
      },
      iconColor: currentSensor.iconColor,
    );
  }
}

class _SensorData {
  final SensorType type;
  final SensorThreshold threshold;
  final Color iconColor;

  _SensorData({
    required this.type,
    required this.threshold,
    required this.iconColor,
  });
}
