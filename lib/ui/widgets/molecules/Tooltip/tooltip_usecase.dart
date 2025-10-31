import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:garden_ui/ui/components.dart';

@UseCase(name: 'Default', type: GardenTooltip)
Widget tooltipDefaultUseCase(BuildContext context) {
  return Center(
    child: SizedBox(
        child: GardenTooltip()
    ),
  );
}