import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'space_preview.dart';
import 'space_design_system.dart';

@UseCase(
  name: 'Default',
  type: GardenSpace,
  designLink: 'https://www.figma.com/',
)
Widget buildDesignSystemSpaceUseCase(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(GardenSpace.paddingLg),
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PaddingPreview(
            name: 'Padding',
            styles: {
              'Padding XS': GardenSpace.paddingXs,
              'Padding SM': GardenSpace.paddingSm,
              'Padding MD': GardenSpace.paddingMd,
              'Padding LG': GardenSpace.paddingLg,
              'Padding XL': GardenSpace.paddingXl,
            },
          ),
          GapPreview(
            name: 'Gap',
            styles: {
              'Gap XS': GardenSpace.gapXs,
              'Gap SM': GardenSpace.gapSm,
              'Gap MD': GardenSpace.gapMd,
              'Gap LG': GardenSpace.gapLg,
              'Gap XL': GardenSpace.gapXl,
            },
          ),
        ],
      ),
    ),
  );
}
