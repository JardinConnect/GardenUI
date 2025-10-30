import 'package:flutter/material.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class TooltipIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final TooltipSize size;

  const TooltipIcon({
    super.key,
    required this.onPressed,
    this.size = TooltipSize.md,
  });

  double get _iconSize {
    switch (size) {
      case TooltipSize.sm:
        return 12;
      case TooltipSize.lg:
        return 20;
      default:
        return 16;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.help_outline_outlined,
        size: _iconSize,
        color: GardenColors.base.shade600,
      ),
      onPressed: onPressed,
    );
  }
}

@widgetbook.UseCase(name: 'Default', type: TooltipIcon)
Widget tooltipIconDefaultUseCase(BuildContext context) {
  return TooltipIcon(onPressed: () => {});
}

@widgetbook.UseCase(name: 'Small', type: TooltipIcon)
Widget tooltipIconSmallUseCase(BuildContext context) {
  return TooltipIcon(size: TooltipSize.sm, onPressed: () => {});
}

@widgetbook.UseCase(name: 'Large', type: TooltipIcon)
Widget tooltipIconLargeUseCase(BuildContext context) {
  return TooltipIcon(size: TooltipSize.lg, onPressed: () => {});
}
