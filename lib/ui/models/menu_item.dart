import 'package:flutter/material.dart';
import 'package:garden_ui/ui/enums.dart';

/// Data model for a menu item.
///
/// This model represents the data structure for a menu item component,
/// separating the data from the widget implementation.
class MenuItemModel {
  /// Icon to display in the menu item
  final IconData icon;

  /// Label text of the menu item
  final String label;

  /// Callback function executed when the menu item is tapped
  final VoidCallback onTap;

  /// Severity level of the menu item
  final MenuItemSeverity severity;

  /// Whether this menu item is currently active/selected
  final bool isActive;

  const MenuItemModel({
    required this.icon,
    required this.label,
    required this.onTap,
    this.severity = MenuItemSeverity.normal,
    this.isActive = false,
  });

  /// Creates a copy of this menu item with the given fields replaced with new values
  MenuItemModel copyWith({
    IconData? icon,
    String? label,
    VoidCallback? onTap,
    MenuItemSeverity? severity,
    bool? isActive,
  }) {
    return MenuItemModel(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      onTap: onTap ?? this.onTap,
      severity: severity ?? this.severity,
      isActive: isActive ?? this.isActive,
    );
  }
}
