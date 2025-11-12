import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';

/// A controlled toggle switch component.
///
/// This component displays a toggle switch that allows users to enable or disable
/// a feature. The state is controlled by the parent widget through [isEnabled] and [onToggle].
class GardenToggle extends StatelessWidget {
  /// Whether the toggle is currently enabled.
  final bool isEnabled;

  /// Callback when the toggle is switched.
  final ValueChanged<bool> onToggle;

  const GardenToggle({
    super.key,
    required this.isEnabled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isEnabled,
      onChanged: onToggle,
      activeColor: GardenColors.primary.shade500,
      activeTrackColor: GardenColors.primary.shade200,
      inactiveThumbColor: GardenColors.base.shade400,
      inactiveTrackColor: GardenColors.base.shade300,
    );
  }
}
