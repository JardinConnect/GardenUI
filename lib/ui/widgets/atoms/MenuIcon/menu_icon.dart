import 'package:flutter/material.dart';
import 'package:widgetbook_workspace/ui/design_system.dart';
import 'package:widgetbook_workspace/ui/foundation/color/color_design_system.dart';

/// A single menu icon used in [MenuItem].
///
/// This component represents a customisable icon in a menu item.
class MenuIcon extends StatelessWidget {
  /// Icon to display.
  final IconData icon;

  /// Whether this menu is currently selected.
  final bool isSelected;

  /// Whether the MenuIcon width should match the content width.
  final bool matchToContent;

  /// Custom width, used when [matchToContent] is false.
  final double width;

  /// Custom icon width, used when [matchToContent] is false.
  final double? iconWidth;

  /// Custom background color when isSelected = true
  Color? selectedBackgroundColor;

  /// Custom icon color when isSelected = true
  Color? selectedIconColor;

  /// Custom background color when isSelected = false
  Color? defaultBackgroundColor;

  /// Custom icon color when isSelected = false
  Color? defaultIconColor;

  MenuIcon({
    super.key,
    required this.icon,
    required this.isSelected,
    this.matchToContent = true,
    this.width = 36.0,
    this.iconWidth = 26.0,
    this.selectedBackgroundColor,
    this.selectedIconColor,
  });

  void _initDefaultColors() {
    selectedBackgroundColor =
        selectedBackgroundColor ?? GardenColors.primary.shade500;
    selectedIconColor = selectedIconColor ?? GardenColors.primary.shade50;
    defaultBackgroundColor =
        defaultBackgroundColor ?? GardenColors.primary.shade50;
    defaultIconColor = defaultIconColor ?? GardenColors.primary.shade500;
  }

  @override
  Widget build(BuildContext context) {
    _initDefaultColors();

    final Widget content = AspectRatio(
      aspectRatio: 1,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: GardenTypography.radiusSm,
          color: isSelected ? selectedBackgroundColor : defaultBackgroundColor,
          boxShadow: GardenTypography.shadowSm,
        ),
        child: Icon(
          icon,
          size: matchToContent ? null : iconWidth,
          color: isSelected ? selectedIconColor : defaultIconColor,
        ),
      ),
    );

    return SizedBox(width: width, child: content);
  }
}
