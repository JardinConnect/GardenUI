import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:garden_ui/ui/components.dart';

@UseCase(name: 'Default', type: GardenDialog)
Widget dialogDefaultUseCase(BuildContext context) {
  return Center(
    child: GardenDialog(
        title: "Serre n°1",
      content: Column(
        children: [
          Text("blabla"),
          Text("blabla"),
          Text("blabla"),
          Text("blabla"),
        ],
      ),
    ),
  );
}