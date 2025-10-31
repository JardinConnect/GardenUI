import 'package:flutter/material.dart';

/// Data model for a tab item.
///
/// This model represents the data structure for a tab item component,
/// separating the data from the widget implementation.
class TabItemModel {
  /// Label text of the tab
  final String label;

  /// Optional icon to display with the tab
  final IconData? icon;

  const TabItemModel({required this.label, this.icon});

  /// Creates a copy of this tab item with the given fields replaced with new values
  TabItemModel copyWith({String? label, IconData? icon}) {
    return TabItemModel(label: label ?? this.label, icon: icon ?? this.icon);
  }
}
