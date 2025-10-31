import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garden_ui/ui/enums.dart';

/// A customizable SVG icon widget from the Garden UI icon set.
///
/// This component displays SVG icons from the assets/icons directory
/// with support for different sizes, custom colors, and optional
/// bottom-to-top percentage fill.
class GardenIcon extends StatelessWidget {
  /// The name of the icon (e.g., "Humidite_profondeur").
  final String iconName;

  /// The size variant of the icon.
  final GardenIconSize size;

  /// The color to apply to the icon.
  final Color color;

  /// Optional fill percentage from bottom to top (0-100).
  /// When null, the icon is fully displayed.
  final double? fillPercentage;

  const GardenIcon({
    super.key,
    required this.iconName,
    this.size = GardenIconSize.md,
    this.color = const Color(0xFFe8eaf0), // GardenColors.base.shade300
    this.fillPercentage,
  });

  /// Returns the pixel size for the icon based on the size variant.
  double get _iconSize {
    switch (size) {
      case GardenIconSize.sm:
        return 16.0;
      case GardenIconSize.md:
        return 40.0;
      case GardenIconSize.lg:
        return 75.0;
    }
  }

  /// Builds the SVG asset path from the icon name.
  String get _assetPath {
    return 'lib/ui/assets/icons/Icon=$iconName, Size=75.svg';
  }

  @override
  Widget build(BuildContext context) {
    final svgWidget = SvgPicture.asset(
      _assetPath,
      width: _iconSize,
      height: _iconSize,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );

    // If no fill percentage is specified, return the icon as-is
    if (fillPercentage == null) {
      return svgWidget;
    }

    // Clamp fill percentage between 0 and 100
    final clampedFill = fillPercentage!.clamp(0.0, 100.0);
    final fillFraction = clampedFill / 100.0;

    return SizedBox(
      width: _iconSize,
      height: _iconSize,
      child: Stack(
        children: [
          // Background: empty/unfilled icon
          SvgPicture.asset(
            _assetPath,
            width: _iconSize,
            height: _iconSize,
            colorFilter: ColorFilter.mode(
              color.withValues(alpha: 0.2),
              BlendMode.srcIn,
            ),
          ),
          // Foreground: filled portion from bottom
          ClipRect(clipper: _BottomFillClipper(fillFraction), child: svgWidget),
        ],
      ),
    );
  }
}

/// Custom clipper that reveals content from bottom to top based on fill percentage.
class _BottomFillClipper extends CustomClipper<Rect> {
  final double fillFraction;

  _BottomFillClipper(this.fillFraction);

  @override
  Rect getClip(Size size) {
    final fillHeight = size.height * fillFraction;
    return Rect.fromLTRB(0, size.height - fillHeight, size.width, size.height);
  }

  @override
  bool shouldReclip(_BottomFillClipper oldClipper) {
    return oldClipper.fillFraction != fillFraction;
  }
}
