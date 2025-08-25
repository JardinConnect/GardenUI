import 'package:flutter/material.dart';
import 'package:widgetbook_workspace/ui/design_system.dart';
import 'package:widgetbook_workspace/ui/foundation/color/color_design_system.dart';
import 'package:widgetbook_workspace/ui/foundation/radius/radius_design_system.dart';
import 'package:widgetbook_workspace/ui/foundation/shadow/shadow_design_system.dart';

enum MenuIconSize { sm, md, lg }

/// A single menu icon used in [MenuItem].
///
/// This component represents a customisable icon in a menu item.
class MenuIcon extends StatelessWidget {
  /// Icon to display.
  final IconData icon;

  /// Whether this menu is currently active.
  final bool isActive;

  /// MenuIcon size.
  final MenuIconSize size;

  /// Custom icon width.
  double? width;

  /// Custom icon width.
  double? iconWidth;

  /// Custom background color when [isActive] = true
  Color? activeBackgroundColor;

  /// Custom icon color when [isActive] = true
  Color? activeIconColor;

  /// Custom background color when [isActive] = false
  Color? defaultBackgroundColor;

  /// Custom icon color when isActive = false
  Color? defaultIconColor;

  BorderRadiusGeometry? radius;

  MenuIcon({
    super.key,
    required this.icon,
    this.isActive = false,
    this.size = MenuIconSize.md,
  });

  void _initDefaultColors() {
    activeBackgroundColor =
        activeBackgroundColor ?? GardenColors.primary.shade500;
    activeIconColor = activeIconColor ?? GardenColors.primary.shade50;
    defaultBackgroundColor =
        defaultBackgroundColor ?? GardenColors.primary.shade50;
    defaultIconColor = defaultIconColor ?? GardenColors.primary.shade500;
  }

  void _initDefaultSizes() {
    switch (size) {
      case MenuIconSize.sm:
        width = 16.0;
        iconWidth = 12.0;
        radius = GardenRadius.radiusXs;
        break;
      case MenuIconSize.md:
        width = 32.0;
        iconWidth = 24.0;
        radius = GardenRadius.radiusSm;
        break;
      case MenuIconSize.lg:
        width = 48.0;
        iconWidth = 36.0;
        radius = GardenRadius.radiusSm;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _initDefaultColors();
    _initDefaultSizes();

    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: radius,
            color: isActive ? activeBackgroundColor : defaultBackgroundColor,
            boxShadow: GardenShadow.shadowSm,
          ),
          child: Icon(
            icon,
            size: iconWidth,
            color: isActive ? activeIconColor : defaultIconColor,
          ),
        ),
      ),
    );
  }
}
