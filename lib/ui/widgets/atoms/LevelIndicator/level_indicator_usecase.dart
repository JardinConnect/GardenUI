import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'level_indicator.dart';

@UseCase(name: 'Level 1', type: LevelIndicator)
Widget levelIndicatorLevel1UseCase(BuildContext context) {
  return SizedBox(height: 60, child: const LevelIndicator(level: 1));
}

@UseCase(name: 'Level 3', type: LevelIndicator)
Widget levelIndicatorLevel3UseCase(BuildContext context) {
  return SizedBox(height: 60, child: const LevelIndicator(level: 3));
}

@UseCase(name: 'Level 5', type: LevelIndicator)
Widget levelIndicatorLevel5UseCase(BuildContext context) {
  return SizedBox(height: 60, child: const LevelIndicator(level: 5));
}

