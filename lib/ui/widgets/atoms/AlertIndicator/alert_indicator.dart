import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';
import 'package:garden_ui/ui/models/hierarchical_menu_item.dart';

enum AlertIndicatorSize { sm, md, lg }

/// A visual alert indicator for displaying warning or error states.
///
/// This component displays an icon based on the alert type (none, warning, error)
/// with customizable size.
class AlertIndicator extends StatelessWidget {
  /// The type of alert to display.
  final MenuAlertType alertType;

  /// The size of the alert indicator.
  final AlertIndicatorSize size;

  const AlertIndicator({
    super.key,
    required this.alertType,
    this.size = AlertIndicatorSize.md,
  });

  double get _iconSize {
    switch (size) {
      case AlertIndicatorSize.sm:
        return 12.0;
      case AlertIndicatorSize.md:
        return 16.0;
      case AlertIndicatorSize.lg:
        return 20.0;
    }
  }

  Color get _color {
    switch (alertType) {
      case MenuAlertType.warning:
        return GardenColors.yellowWarning.shade500;
      case MenuAlertType.error:
        return GardenColors.redAlert.shade500;
      case MenuAlertType.none:
        return Colors.transparent;
    }
  }

  IconData get _icon {
    switch (alertType) {
      case MenuAlertType.warning:
      case MenuAlertType.error:
        return Icons.warning;
      case MenuAlertType.none:
        return Icons.clear;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (alertType == MenuAlertType.none) {
      return SizedBox(width: _iconSize);
    }

    return Icon(_icon, size: _iconSize, color: _color);
  }
}
