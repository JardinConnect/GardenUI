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

  const MenuIcon({
    super.key,
    required this.icon,
    this.isActive = false,
    this.size = MenuIconSize.md,
  });

  double get _width {
    switch (size) {
      case MenuIconSize.sm:
        return 16.0;
      case MenuIconSize.md:
        return 32.0;
      case MenuIconSize.lg:
        return 48.0;
    }
  }

  double get _iconWidth {
    switch (size) {
      case MenuIconSize.sm:
        return 12.0;
      case MenuIconSize.md:
        return 24.0;
      case MenuIconSize.lg:
        return 36.0;
    }
  }

  BorderRadiusGeometry get _radius {
    switch (size) {
      case MenuIconSize.sm:
        return GardenRadius.radiusXs;
      case MenuIconSize.md:
      case MenuIconSize.lg:
        return GardenRadius.radiusSm;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = isActive
        ? GardenColors.primary.shade500
        : GardenColors.primary.shade50;
    final iconColor = isActive
        ? GardenColors.primary.shade50
        : GardenColors.primary.shade500;

    return SizedBox(
      width: _width,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: _radius,
            color: bgColor,
            boxShadow: GardenShadow.shadowSm,
          ),
          child: Icon(icon, size: _iconWidth, color: iconColor),
        ),
      ),
    );
  }
}
