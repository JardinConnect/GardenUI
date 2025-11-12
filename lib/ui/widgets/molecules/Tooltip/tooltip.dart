import 'package:flutter/material.dart';
import 'package:garden_ui/ui/components.dart';

class GardenTooltip extends StatelessWidget {
  final String title;
  final Widget content;

  const GardenTooltip({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return TooltipIconButton(
      onPressed: () => {
        GardenDialog.show(context, title: title, content: content)
      },
    );
  }
}
