import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:garden_ui/ui/design_system.dart';

enum LevelIndicatorSize { sm, md, lg }

class LevelIndicator extends StatelessWidget {
  final int level;
  final LevelIndicatorSize size;
  final Color? color;

  const LevelIndicator({
    super.key,
    required this.level,
    this.size = LevelIndicatorSize.md,
    this.color,
  });

  double get _width {
    switch (size) {
      case LevelIndicatorSize.sm:
        return 2.0;
      case LevelIndicatorSize.md:
        return 3.0;
      case LevelIndicatorSize.lg:
        return 4.0;
    }
  }

  Color get _color {
    if (color != null) return color!;

    switch (level) {
      case 1:
        return GardenColors.primary.shade500;
      case 2:
        return GardenColors.secondary.shade500;
      case 3:
        return GardenColors.tertiary.shade500;
      case 4:
        return GardenColors.blueInfo.shade500;
      case 5:
        return GardenColors.yellowWarning.shade500;
      default:
        return GardenColors.base.shade400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: 30,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(_width / 2),
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Level 1', type: LevelIndicator)
Widget levelIndicatorLevel1UseCase(BuildContext context) {
  return SizedBox(height: 60, child: const LevelIndicator(level: 1));
}

@widgetbook.UseCase(name: 'Level 3', type: LevelIndicator)
Widget levelIndicatorLevel3UseCase(BuildContext context) {
  return SizedBox(height: 60, child: const LevelIndicator(level: 3));
}

@widgetbook.UseCase(name: 'Level 5', type: LevelIndicator)
Widget levelIndicatorLevel5UseCase(BuildContext context) {
  return SizedBox(height: 60, child: const LevelIndicator(level: 5));
}
