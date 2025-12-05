import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';

/// A visual indicator representing the current battery level.
///
/// This component displays a battery icon with a fill level corresponding
/// to the percentage and a text overlay indicating the numeric value.
class BatteryIndicator extends StatelessWidget {
  /// The current battery percentage to display (0-100).
  final int batteryPercentage;

  /// The size of the battery indicator.
  final BatteryIndicatorSize size;

  const BatteryIndicator({
    super.key,
    this.batteryPercentage = 100,
    this.size = BatteryIndicatorSize.md,
  });

  double get _iconSize {
    switch (size) {
      case BatteryIndicatorSize.sm:
        return 34.0;
      case BatteryIndicatorSize.md:
        return 50.0;
      case BatteryIndicatorSize.lg:
        return 66.0;
    }
  }

  TextStyle get _fontStyle {
    switch (size) {
      case BatteryIndicatorSize.sm:
      case BatteryIndicatorSize.md:
        return GardenTypography.bodyMd;
      case BatteryIndicatorSize.lg:
        return GardenTypography.bodyLg;
    }
  }

  // Constants defining the SVG geometry (based on 48x28 original viewbox)
  static const double _kAspectRatio = 44 / 24;

  // Relative positions and sizes as fractions of the container size
  // These are derived from the original SVG design:
  // The inner fillable area starts at (4,4) and has size (32,20) relative to 48x28
  static const double _kFillLeftRatio = 4 / 48;
  static const double _kFillTopRatio = 4 / 28;
  static const double _kFillWidthRatio = 32 / 48;
  static const double _kFillHeightRatio = 20 / 28;

  // The text centering area width (excluding the battery nipple)
  static const double _kTextContainerWidthRatio = 42 / 48;

  @override
  Widget build(BuildContext context) {
    final percentage = (batteryPercentage / 100).clamp(0.0, 1.0);

    return SizedBox(
      width: _iconSize,
      child: AspectRatio(
        aspectRatio: _kAspectRatio,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;

            final fillLeft = width * _kFillLeftRatio;
            final fillTop = height * _kFillTopRatio;
            final fillMaxWidth = width * _kFillWidthRatio;
            final fillHeight = height * _kFillHeightRatio;

            return Stack(
              children: [
                Positioned(
                  left: fillLeft,
                  top: fillTop,
                  width: fillMaxWidth * percentage,
                  height: fillHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: GardenColors.tertiary.shade500,
                    ),
                  ),
                ),

                Positioned.fill(
                  child: SvgPicture.asset(
                    'lib/ui/assets/icons/Icon=Batterie, Size=75.svg',
                    package: 'garden_ui',
                    fit: BoxFit.fill,
                  ),
                ),

                Positioned(
                  left: 0,
                  top: 0,
                  width: width * _kTextContainerWidthRatio,
                  height: height,
                  child: Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.6,
                      heightFactor: 0.5,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "$batteryPercentage%",
                          style: _fontStyle.copyWith(
                            height: 1.1,
                            fontWeight: size == BatteryIndicatorSize.lg
                                ? FontWeight.w600
                                : FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
