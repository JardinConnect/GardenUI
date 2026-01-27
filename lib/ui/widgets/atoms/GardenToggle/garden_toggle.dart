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

  /// Optional icon to display when the toggle is enabled.
  final IconData? enabledIcon;

  /// Optional icon to display when the toggle is disabled.
  final IconData? disabledIcon;

  const GardenToggle({
    super.key,
    required this.isEnabled,
    required this.onToggle,
    this.enabledIcon,
    this.disabledIcon,
  });

  double? get _iconWeight {
    return GardenTypography.bodyLg.fontWeight?.value.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isEnabled,
      onChanged: onToggle,
      thumbIcon: WidgetStateProperty.resolveWith<Icon?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected) && enabledIcon != null) {
          return Icon(
            enabledIcon,
            color: GardenColors.primary.shade500,
            weight: _iconWeight,
          );
        }
        if (!states.contains(WidgetState.selected) && disabledIcon != null) {
          return Icon(
            disabledIcon,
            color: GardenColors.base.shade50,
            weight: _iconWeight,
          );
        }
        return null;
      }),
      thumbColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected) && enabledIcon != null) {
          return GardenColors.base.shade50;
        }
        if (!states.contains(WidgetState.selected) && disabledIcon != null) {
          return GardenColors.primary.shade500;
        }
        return null;
      }),
      activeThumbColor: GardenColors.base.shade50,
      activeTrackColor: GardenColors.primary.shade500,
      inactiveTrackColor: GardenColors.base.shade50,
      inactiveThumbColor: GardenColors.primary.shade500,
      trackOutlineColor: WidgetStateProperty.all(GardenColors.primary.shade500),
      trackOutlineWidth: WidgetStateProperty.all(2.0),
    );
  }
}
