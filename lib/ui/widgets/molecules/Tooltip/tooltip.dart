import 'package:flutter/material.dart';
import 'package:garden_ui/ui/components.dart';

/// A tooltip widget which shows a dialog with detailed information when pressed.
///
/// This widget displays an icon button that, when pressed, opens a dialog
/// containing the provided title and content.
class GardenTooltip extends StatelessWidget {
  /// The title of the tooltip dialog
  final String title;

  /// The content of the tooltip dialog
  final Widget content;

  const GardenTooltip({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return TooltipIconButton(
      onPressed: () => {
        GardenDialog.show(context, title: title, content: content),
      },
    );
  }
}
