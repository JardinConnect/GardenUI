import 'package:flutter/material.dart';
import 'package:garden_ui/ui/components.dart';

class GardenTooltip extends StatelessWidget {
  const GardenTooltip({super.key});

  @override
  Widget build(BuildContext context) {
    return TooltipIconButton(
      onPressed: () => {
        showDialog(
            context: context,
            builder: (context) {
              return GardenDialog(title: "Serre n°1");
            })
      },
    );
  }
}
