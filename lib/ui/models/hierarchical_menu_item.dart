import 'package:flutter/material.dart';
import 'package:garden_ui/ui/enums.dart';

/// Data model for a hierarchical menu item
class HierarchicalMenuItem {
  /// Unique identifier for the item
  final String id;

  /// Main title of the item
  final String title;

  /// Sub-information (temperature, humidity, etc.)
  final String? subtitle;

  /// Icon of the item
  final IconData? icon;

  /// Alert type (none, warning, error)
  final MenuAlertType alertType;

  /// Depth level in the hierarchy (1-5)
  final int level;

  /// List of child items
  final List<HierarchicalMenuItem> children;

  /// Indicates if the item is expanded/collapsed
  final bool isExpanded;

  /// Callback called when tapping on the item
  final VoidCallback? onTap;

  /// Callback called when expansion/collapse occurs
  final ValueChanged<bool>? onExpansionChanged;

  const HierarchicalMenuItem({
    required this.id,
    required this.title,
    this.subtitle,
    this.icon,
    this.alertType = MenuAlertType.none,
    this.level = 1,
    this.children = const [],
    this.isExpanded = false,
    this.onTap,
    this.onExpansionChanged,
  });

  /// Creates a copy of the item with modified properties
  HierarchicalMenuItem copyWith({
    String? id,
    String? title,
    String? subtitle,
    IconData? icon,
    MenuAlertType? alertType,
    int? level,
    List<HierarchicalMenuItem>? children,
    bool? isExpanded,
    VoidCallback? onTap,
    ValueChanged<bool>? onExpansionChanged,
  }) {
    return HierarchicalMenuItem(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      icon: icon ?? this.icon,
      alertType: alertType ?? this.alertType,
      level: level ?? this.level,
      children: children ?? this.children,
      isExpanded: isExpanded ?? this.isExpanded,
      onTap: onTap ?? this.onTap,
      onExpansionChanged: onExpansionChanged ?? this.onExpansionChanged,
    );
  }

  /// Checks if the item has children
  bool get hasChildren => children.isNotEmpty;

  /// Returns the color associated with the level
  ///
  /// Uses hardcoded color values matching the design system.
  /// Consider using LevelIndicator component directly for better consistency.
  Color get levelColor {
    switch (level) {
      case 1:
        return const Color(0xFF037f8c); // GardenColors.primary.shade500
      case 2:
        return const Color(0xFFd6a113); // GardenColors.secondary.shade500
      case 3:
        return const Color(0xFF5be51b); // GardenColors.tertiary.shade500
      case 4:
        return const Color(0xFF4a7fe9); // GardenColors.blueInfo.shade500
      case 5:
        return const Color(0xFFedce1e); // GardenColors.yellowWarning.shade500
      default:
        return const Color(0xFFe3e5ed); // GardenColors.base.shade400
    }
  }
}
