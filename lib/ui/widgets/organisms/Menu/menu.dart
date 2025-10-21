import 'package:flutter/material.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';

enum MenuSize { sm, md, lg }

class Menu extends StatefulWidget {
  final List<MenuItem> items;
  final List<MenuItem> bottomItems;
  final MenuSize size;

  const Menu({
    super.key,
    required this.items,
    required this.bottomItems,
    this.size = MenuSize.md,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int? selectedIndex = 0;

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
        return 150;
      case MenuSize.lg:
        return 500;
      default:
        return 250;
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
        return 96;
      case MenuSize.lg:
        return 256;
      default:
        return 156;
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
              Image.asset("assets/images/logo.png", width: _logoWidth),
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
