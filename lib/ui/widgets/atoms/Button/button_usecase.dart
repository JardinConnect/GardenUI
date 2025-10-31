import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';

@UseCase(name: 'Primary', type: Button)
Widget primaryButtonUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: GardenSpace.gapLg,
    children: [
      Button(label: "Send", onPressed: () => {}),
      Button(label: "Send", icon: Icons.send, onPressed: () => {}),
      Button(
        label: "Send",
        iconAlignment: IconAlignment.start,
        icon: Icons.send,
        onPressed: () => {},
      ),
      Button(
        label: "Send",
        icon: Icons.send,
        minWidth: 300,
        onPressed: () => {},
      ),
    ],
  );
}

@UseCase(name: 'Danger', type: Button)
Widget dangerButtonUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: GardenSpace.gapLg,
    children: [
      Button(
        label: "Delete",
        severity: ButtonSeverity.danger,
        onPressed: () => {},
      ),
      Button(
        label: "Delete",
        severity: ButtonSeverity.danger,
        icon: Icons.delete,
        onPressed: () => {},
      ),
      Button(
        label: "Delete",
        iconAlignment: IconAlignment.start,
        severity: ButtonSeverity.danger,
        icon: Icons.delete,
        onPressed: () => {},
      ),
      Button(
        label: "Delete",
        severity: ButtonSeverity.danger,
        icon: Icons.delete,
        minWidth: 300,
        onPressed: () => {},
      ),
    ],
  );
}
