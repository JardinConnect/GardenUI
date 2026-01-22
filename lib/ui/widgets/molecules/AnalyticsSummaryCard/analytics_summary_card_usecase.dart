import 'package:flutter/material.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Default',
  type: AnalyticsSummaryCard,
  designLink:
      'https://www.figma.com/design/F4eYqIvQgbgcuG9Ev4kVuC/MockUp?node-id=777-5617&t=QeqXtK992GxqKHXp-4',
)
Widget analyticsSummaryCardUseCase(BuildContext context) {
  return SizedBox(
    width: 320,
    child: AnalyticsSummaryCard(
      name: "Tomates serre nord",
      onPressed: () => {},
      light: 25000,
      rain: 68,
      humiditySurface: 52,
      humidityDepth: 43,
      temperatureSurface: 23.8,
      temperatureDepth: 19.2,
    ),
  );
}

@UseCase(
  name: 'With battery',
  type: AnalyticsSummaryCard,
  designLink:
      'https://www.figma.com/design/F4eYqIvQgbgcuG9Ev4kVuC/MockUp?node-id=777-5617&t=QeqXtK992GxqKHXp-4',
)
Widget analyticsSummaryCardWithBatteryUseCase(BuildContext context) {
  return SizedBox(
    width: 320,
    child: AnalyticsSummaryCard(
      name: "Tomates serre nord",
      onPressed: () => {},
      batteryPercentage: 68,
      light: 25000,
      rain: 68,
      humiditySurface: 52,
      humidityDepth: 43,
      temperatureSurface: 23.8,
      temperatureDepth: 19.2,
    ),
  );
}

@UseCase(
  name: 'With filter',
  type: AnalyticsSummaryCard,
  designLink:
      'https://www.figma.com/design/F4eYqIvQgbgcuG9Ev4kVuC/MockUp?node-id=777-5617&t=QeqXtK992GxqKHXp-4',
)
Widget analyticsSummaryCardWithFilterUseCase(BuildContext context) {
  return SizedBox(
    width: 320,
    child: AnalyticsSummaryCard(
      name: "Tomates serre nord",
      onPressed: () => {},
      filter: AnalyticsSummaryFilter.soilTemperature,
      batteryPercentage: 68,
      light: 25000,
      rain: 68,
      humiditySurface: 52,
      humidityDepth: 43,
      temperatureSurface: 23.8,
      temperatureDepth: 19.2,
    ),
  );
}
