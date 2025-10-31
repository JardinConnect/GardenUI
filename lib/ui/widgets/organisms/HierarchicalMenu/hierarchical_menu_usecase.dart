import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:garden_ui/ui/components.dart';

@UseCase(name: 'Default', type: HierarchicalMenu)
Widget hierarchicalMenuDefaultUseCase(BuildContext context) {
  return HierarchicalMenu(
    items: [
      HierarchicalMenuItem(
        id: '1',
        title: 'Serre principale',
        subtitle: '24°C - 65%',
        icon: Icons.home,
        level: 1,
        alertType: MenuAlertType.warning,
        children: [
          HierarchicalMenuItem(
            id: '1.1',
            title: 'Zone A',
            subtitle: '22°C',
            level: 2,
            children: [
              HierarchicalMenuItem(id: '1.1.1', title: 'Secteur 1', level: 3),
              HierarchicalMenuItem(
                id: '1.1.2',
                title: 'Secteur 2',
                level: 3,
                alertType: MenuAlertType.error,
              ),
            ],
          ),
          HierarchicalMenuItem(
            id: '1.2',
            title: 'Zone B',
            subtitle: '21°C',
            level: 2,
          ),
        ],
      ),
      HierarchicalMenuItem(
        id: '2',
        title: 'Serre secondaire',
        subtitle: '20°C - 70%',
        icon: Icons.cottage,
        level: 1,
        children: [
          HierarchicalMenuItem(
            id: '2.1',
            title: 'Zone C',
            level: 2,
            alertType: MenuAlertType.error,
          ),
        ],
      ),
    ],
  );
}

@UseCase(name: 'With Selected Item', type: HierarchicalMenu)
Widget hierarchicalMenuWithSelectionUseCase(BuildContext context) {
  return HierarchicalMenu(
    items: [
      HierarchicalMenuItem(
        id: '1',
        title: 'Serre principale',
        subtitle: '24°C - 65%',
        icon: Icons.home,
        level: 1,
        children: [
          HierarchicalMenuItem(
            id: '1.1',
            title: 'Zone A',
            subtitle: '22°C',
            level: 2,
          ),
        ],
      ),
    ],
    selectedItemId: '1.1',
  );
}
