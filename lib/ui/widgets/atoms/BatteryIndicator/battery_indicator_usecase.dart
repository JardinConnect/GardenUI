import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:garden_ui/ui/components.dart';

@widgetbook.UseCase(
  name: 'Battery Indicator at 75% (Medium size)',
  type: BatteryIndicator,
)
Widget batteryIndicatorDefaultUseCase(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    color: Colors.white,
    child: const BatteryIndicator(batteryPercentage: 75),
  );
}

@widgetbook.UseCase(
  name: 'Battery Indicator at 35% (Small size)',
  type: BatteryIndicator,
)
Widget batteryIndicatorSmallUseCase(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    color: Colors.white,
    child: const BatteryIndicator(
      batteryPercentage: 35,
      size: BatteryIndicatorSize.sm,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Battery Indicator at 50% (Large size)',
  type: BatteryIndicator,
)
Widget batteryIndicatorLargeUseCase(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    color: Colors.white,
    child: const BatteryIndicator(
      batteryPercentage: 50,
      size: BatteryIndicatorSize.lg,
    ),
  );
}
