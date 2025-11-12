import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:garden_ui/ui/components.dart';

@UseCase(name: 'Default', type: GardenTooltip)
Widget tooltipDefaultUseCase(BuildContext context) {
  return SizedBox(
    width: 150,
    child: Center(
      child: GardenTooltip(
        title: "Serre n°1",
        content: SizedBox(
          width: 150,
          child: Column(
            spacing: GardenSpace.gapMd,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Niveau 1", style: GardenTypography.headingSm),
                  Text("Dernière mise à jour : il y'a 2 minutes", style: GardenTypography.bodyMd),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GardenCard(
                    child: Center(
                      child: Text("Carte 1"),
                    ),
                  ),
                  GardenCard(
                    child: Center(
                      child: Text("Carte 1"),
                    ),
                  ),
                  GardenCard(
                    child: Center(
                      child: Text("Carte 1"),
                    ),
                  ),
                  GardenCard(
                    child: Center(
                      child: Text("Carte 1"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}