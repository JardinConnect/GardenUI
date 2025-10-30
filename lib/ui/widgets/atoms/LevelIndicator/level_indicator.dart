import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';

enum LevelIndicatorSize { sm, md, lg }

/// A visual indicator representing hierarchical levels with color-coded bars.
///
/// This component displays a colored vertical bar whose color varies based
/// on the level number (1-5) or a custom color.
class LevelIndicator extends StatelessWidget {
  /// The hierarchical level to display (1-5).
  final int level;

  /// The size of the level indicator.
  final LevelIndicatorSize size;

  /// Optional custom color override.
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
