import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';
import 'package:garden_ui/ui/enums.dart';

/// A customizable button widget with optional icon and multiple severity styles.
///
/// The Button component provides a consistent button design with configurable
/// label, icon, and severity levels (primary, danger).
class Button extends StatelessWidget {
  /// The text label displayed on the button.
  final String label;

  /// Callback function executed when the button is pressed.
  final VoidCallback onPressed;

  /// The severity level of the button, affecting its color scheme.
  final ButtonSeverity severity;

  /// The minimum width of the button.
  final double minWidth;

  /// Position of the icon relative to the label (start or end).
  final IconAlignment? iconAlignment;

  /// Optional icon to display on the button.
  final IconData? icon;

  const Button({
    super.key,
    required this.label,
    required this.onPressed,
    this.severity = ButtonSeverity.primary,
    this.iconAlignment = IconAlignment.end,
    this.minWidth = 24,
    this.icon,
  });

  Color get _backgroundColor {
    if (severity == ButtonSeverity.danger) {
      return GardenColors.redAlert.shade500;
    } else {
      return GardenColors.primary.shade500;
    }
  }

  ButtonStyle get _style {
    return FilledButton.styleFrom(
      backgroundColor: _backgroundColor,
      foregroundColor: GardenColors.primary.shade50,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(borderRadius: GardenRadius.radiusSm),
      padding: EdgeInsets.symmetric(
        horizontal: GardenSpace.paddingXl,
        vertical: GardenSpace.paddingMd,
      ),
      minimumSize: Size(minWidth, 48),
      textStyle: GardenTypography.bodyLg.copyWith(height: 1.2),
      iconSize: GardenTypography.bodyLg.fontSize,
      iconColor: GardenColors.primary.shade50,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return FilledButton.icon(
        icon: Icon(icon),
        iconAlignment: iconAlignment,
        style: _style,
        onPressed: onPressed,
        label: Text(label),
      );
    } else {
      return FilledButton(
        style: _style,
        onPressed: onPressed,
        child: Text(label),
      );
    }
  }
}
