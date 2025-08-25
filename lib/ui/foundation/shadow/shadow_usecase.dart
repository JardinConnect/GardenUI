import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'shadow_preview.dart';
import 'shadow_design_system.dart';

@UseCase(
  name: 'Default',
  type: GardenShadow,
  designLink: 'https://www.figma.com/',
)
Widget buildDesignSystemShadowUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(24),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShadowPreview(
            name: 'Shadow',
            styles: {
              'Shadow SM': GardenShadow.shadowSm,
              'Shadow MD': GardenShadow.shadowMd,
              'Shadow LG': GardenShadow.shadowLg,
            },
          ),
        ],
      ),
    ),
  );
}
