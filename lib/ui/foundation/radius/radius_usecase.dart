import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'radius_preview.dart';
import 'radius_design_system.dart';

@UseCase(
  name: 'Default',
  type: GardenRadius,
  designLink: 'https://www.figma.com/',
)
Widget buildDesignSystemRadiusUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(24),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadiusPreview(
            name: 'Radius',
            styles: {
              'Radius XS': GardenRadius.radiusXs,
              'Radius SM': GardenRadius.radiusSm,
              'Radius MD': GardenRadius.radiusMd,
              'Radius LG': GardenRadius.radiusLg,
            },
          ),
        ],
      ),
    ),
  );
}
