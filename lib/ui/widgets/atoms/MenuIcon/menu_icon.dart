import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';

enum MenuIconSize { sm, md, lg }

enum MenuIconSeverity { normal, danger }

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

  final MenuIconSeverity severity;

  const MenuIcon({
    super.key,
    required this.icon,
    this.isActive = false,
    this.size = MenuIconSize.md,
    this.severity = MenuIconSeverity.normal,
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

  Color get _bgColor {
    if (severity == MenuIconSeverity.danger) {
      return GardenColors.redAlert.shade500;
    } else if (isActive) {
      return GardenColors.primary.shade500;
    } else {
      return GardenColors.primary.shade50;
    }
  }

  Color get _iconColor {
    if (severity == MenuIconSeverity.danger) {
      return GardenColors.base.shade50;
    } else if (isActive) {
      return GardenColors.primary.shade50;
    } else {
      return GardenColors.primary.shade500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: _radius,
            color: _bgColor,
            boxShadow: GardenShadow.shadowSm,
          ),
          child: Icon(icon, size: _iconWidth, color: _iconColor),
        ),
      ),
    );
  }
}
