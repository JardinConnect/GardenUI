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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: GardenSpace.gapLg,
            children: [
              Text(
                "Cette cellule contient deja une alerte sur l’humidite de la surface du sol.\nVoulez-vous ecraser l’alerte precedente et sauvegarder cell-ci?",
                style: GardenTypography.bodyLg,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: GardenSpace.gapSm,
                children: [
                  Button(
                    label: "Annuler",
                    onPressed: () => GardenDialog.close(context),
                    severity: ButtonSeverity.danger,
                    minWidth: 100,
                  ),
                  Button(
                    label: "Sauvegarder",
                    onPressed: () => GardenDialog.close(context),
                    minWidth: 100,
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
