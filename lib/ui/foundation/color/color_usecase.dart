import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'color_preview.dart';
import 'color_design_system.dart';

@UseCase(
  name: 'Default',
  type: GardenColors,
  designLink: 'https://www.figma.com/',
)
Widget buildDesignSystemColorUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(24),
    child: Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColorPreview(name: 'Base', color: GardenColors.base),
        ColorPreview(name: 'Primary', color: GardenColors.primary),
        ColorPreview(name: 'Secondary', color: GardenColors.secondary),
        ColorPreview(name: 'Tertiary/Success', color: GardenColors.tertiary),
        ColorPreview(name: 'Typography', color: GardenColors.typography),
        ColorPreview(name: 'Info', color: GardenColors.blueInfo),
        ColorPreview(name: 'Warning', color: GardenColors.yellowWarning),
        ColorPreview(name: 'Error', color: GardenColors.redAlert),
      ],
    ),
  );
}
