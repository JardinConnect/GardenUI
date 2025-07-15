import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'typography_preview.dart';
import 'typography_design_system.dart';

@UseCase(
  name: 'Default',
  type: GardenTypography,
  designLink: 'https://www.figma.com/',
)
Widget buildDesignSystemTextStylesUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(24),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TypographyPreview(
            name: 'Display',
            styles: {
              'Display XL': GardenTypography.displayXl,
              'Display LG': GardenTypography.displayLg,
            },
          ),
          const SizedBox(height: 20),
          TypographyPreview(
            name: 'Heading',
            styles: {
              'Heading XL': GardenTypography.headingXl,
              'Heading LG': GardenTypography.headingLg,
              'Heading MD': GardenTypography.headingMd,
              'Heading SM': GardenTypography.headingSm,
            },
          ),
          const SizedBox(height: 20),
          TypographyPreview(
            name: 'Body',
            styles: {
              'Body LG': GardenTypography.bodyLg,
              'Body MD': GardenTypography.bodyMd,
            },
          ),
          const SizedBox(height: 20),
          TypographyPreview(
            name: 'Caption',
            styles: {'Caption': GardenTypography.caption},
          ),
        ],
      ),
    ),
  );
}
