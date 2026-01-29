import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';

/// A simple card container with optional shadow and border.
///
/// This component provides a consistent card design with configurable
/// visual properties for shadow and border. Perfect for displaying
/// grouped content with consistent styling.
class GardenCard extends StatelessWidget {
  /// The content to display inside the card.
  final Widget child;

  /// Whether to apply a shadow to the card.
  final bool hasShadow;

  /// Whether to apply a border to the card.
  final bool hasBorder;

  final Color? backgroundColor;

  const GardenCard({
    super.key,
    required this.child,
    this.hasShadow = true,
    this.hasBorder = false,
    this.backgroundColor,
  });

  List<BoxShadow>? get _boxShadow {
    return hasShadow ? GardenShadow.shadowMd : null;
  }

  Border? get _border {
    return hasBorder
        ? Border.all(color: GardenColors.base.shade300, width: 1.0)
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(GardenSpace.paddingMd),
      decoration: BoxDecoration(
        color: backgroundColor ?? GardenColors.base.shade50,
        borderRadius: GardenRadius.radiusMd,
        boxShadow: _boxShadow,
        border: _border,
      ),
      child: child,
    );
  }
}
