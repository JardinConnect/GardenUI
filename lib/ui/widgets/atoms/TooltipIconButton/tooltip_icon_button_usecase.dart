import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:garden_ui/ui/components.dart';

@UseCase(name: 'Default', type: TooltipIconButton)
Widget tooltipIconButtonDefaultUseCase(BuildContext context) {
  return TooltipIconButton(onPressed: () => {});
}

@UseCase(name: 'Small', type: TooltipIconButton)
Widget tooltipIconButtonSmallUseCase(BuildContext context) {
  return TooltipIconButton(size: TooltipSize.sm, onPressed: () => {});
}

@UseCase(name: 'Large', type: TooltipIconButton)
Widget tooltipIconButtonLargeUseCase(BuildContext context) {
  return TooltipIconButton(size: TooltipSize.lg, onPressed: () => {});
}