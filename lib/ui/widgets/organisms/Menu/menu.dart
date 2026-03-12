import 'package:flutter/material.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';
import 'package:garden_ui/ui/internal/constants.dart';

/// A vertical navigation menu with top and bottom sections.
///
/// This component displays a vertical menu with a logo at the top,
/// main navigation items, and bottom items (typically user actions or settings).
class Menu extends StatefulWidget {
  /// List of main navigation menu items.
  final List<MenuItem> items;

  /// List of bottom menu items (typically logout, settings, etc.).
  final List<MenuItem> bottomItems;

  /// Size of the menu.
  final MenuSize size;

  /// Logo image provider to display at the top of the menu.
  final ImageProvider logo;

  /// Optional callback when the logo is tapped.
  final VoidCallback? onLogoTap;

  const Menu({
    super.key,
    required this.items,
    required this.bottomItems,
    required this.logo,
    this.size = MenuSize.md,
    this.onLogoTap,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = _findActiveIndex();
  }

  @override
  void didUpdateWidget(covariant Menu oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newIndex = _findActiveIndex();
    if (newIndex != selectedIndex) {
      setState(() {
        selectedIndex = newIndex;
      });
    }
  }

  /// Trouve l'index actif depuis les items et bottomItems.
  int? _findActiveIndex() {
    for (int i = 0; i < widget.items.length; i++) {
      if (widget.items[i].isActive) return i;
    }
    for (int i = 0; i < widget.bottomItems.length; i++) {
      if (widget.bottomItems[i].isActive) return widget.items.length + i;
    }
    // Par défaut, sélectionner le premier item
    return widget.items.isNotEmpty ? 0 : null;
  }

  _renderMenuItems(List<MenuItem> items, int startIndex) {
    return List.generate(items.length, (index) {
      final item = items[index];
      final globalIndex = startIndex + index;
      return MenuItem(
        label: item.label,
        icon: item.icon,
        size: _itemSize,
        severity: item.severity,
        onTap: item.onTap,
        isActive: selectedIndex == globalIndex,
        onActiveChanged: (isActive) {
          if (isActive) {
            setState(() {
              selectedIndex = globalIndex;
            });
          }
        },
      );
    });
  }

  double get _width {
    switch (widget.size) {
      case MenuSize.sm:
        return InternalConstants.menuWidthSm * 0.75;
      case MenuSize.lg:
        return InternalConstants.menuWidthLg * 1.25;
      default:
        return InternalConstants.menuWidthMd * 0.83;
    }
  }

  MenuItemSize get _itemSize {
    switch (widget.size) {
      case MenuSize.sm:
        return MenuItemSize.sm;
      case MenuSize.lg:
        return MenuItemSize.lg;
      default:
        return MenuItemSize.md;
    }
  }

  double get _logoWidth {
    switch (widget.size) {
      case MenuSize.sm:
        return InternalConstants.logoWidthSm;
      case MenuSize.lg:
        return InternalConstants.logoWidthLg;
      default:
        return InternalConstants.logoWidthMd;
    }
  }

  EdgeInsets get _padding {
    if (widget.size == MenuSize.sm) {
      return EdgeInsets.only(
        top: GardenSpace.paddingLg,
        bottom: GardenSpace.paddingLg,
        left: GardenSpace.paddingMd,
        right: GardenSpace.paddingMd,
      );
    } else {
      return EdgeInsets.only(
        top: GardenSpace.paddingXl,
        bottom: GardenSpace.paddingXl,
        left: GardenSpace.paddingLg,
        right: GardenSpace.paddingLg,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      color: GardenColors.base.shade100,
      padding: _padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: GardenSpace.gapMd,
            children: [
              GestureDetector(
                onTap: widget.onLogoTap,
                child: MouseRegion(
                  cursor: widget.onLogoTap != null
                      ? SystemMouseCursors.click
                      : SystemMouseCursors.basic,
                  child: Image(image: widget.logo, width: _logoWidth),
                ),
              ),
              Divider(thickness: 1, color: GardenColors.base.shade500),
              ..._renderMenuItems(widget.items, 0),
            ],
          ),
          Column(
            spacing: GardenSpace.gapMd,
            children: [
              ..._renderMenuItems(widget.bottomItems, widget.items.length),
            ],
          ),
        ],
      ),
    );
  }
}
