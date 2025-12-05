import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';
import 'package:garden_ui/ui/enums.dart';
import 'package:garden_ui/ui/internal/constants.dart';

/// An atom that displays a "?" icon button with adjustable size.
/// Commonly used to trigger tooltips or help modals.
class TooltipIconButton extends StatelessWidget {
  /// Callback called when the icon button is pressed
  final VoidCallback onPressed;

  /// Size of the tooltip icon button
  final TooltipSize size;

  const TooltipIconButton({
    super.key,
    required this.onPressed,
    this.size = TooltipSize.md,
  });

  double get _iconSize {
    switch (size) {
      case TooltipSize.sm:
        return InternalConstants.iconSizeSm;
      case TooltipSize.lg:
        return InternalConstants.iconSizeLg;
      default:
        return InternalConstants.iconSizeMd;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.help_outline_outlined,
        size: _iconSize,
        color: GardenColors.base.shade600,
      ),
      onPressed: onPressed,
    );
  }
}
