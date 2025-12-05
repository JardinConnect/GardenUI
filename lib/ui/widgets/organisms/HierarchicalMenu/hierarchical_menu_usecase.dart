import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:garden_ui/ui/components.dart';

void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

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
        onTap: () => _showSnackBar(context, 'Serre principale tappée'),
        children: [
          HierarchicalMenuItem(
            id: '1.1',
            title: 'Zone A',
            subtitle: '22°C',
            level: 2,
            onTap: () => _showSnackBar(context, 'Zone A tappée'),
            children: [
              HierarchicalMenuItem(
                id: '1.1.1',
                title: 'Secteur 1',
                level: 3,
                onTap: () => _showSnackBar(context, 'Secteur 1 tappé'),
              ),
              HierarchicalMenuItem(
                id: '1.1.2',
                title: 'Secteur 2',
                level: 3,
                alertType: MenuAlertType.error,
                onTap: () => _showSnackBar(context, 'Secteur 2 tappé'),
              ),
            ],
          ),
          HierarchicalMenuItem(
            id: '1.2',
            title: 'Zone B',
            subtitle: '21°C',
            level: 2,
            onTap: () => _showSnackBar(context, 'Zone B tappée'),
          ),
        ],
      ),
      HierarchicalMenuItem(
        id: '2',
        title: 'Serre secondaire',
        subtitle: '20°C - 70%',
        icon: Icons.cottage,
        level: 1,
        onTap: () => _showSnackBar(context, 'Serre secondaire tappée'),
        children: [
          HierarchicalMenuItem(
            id: '2.1',
            title: 'Zone C',
            level: 2,
            alertType: MenuAlertType.error,
            onTap: () => _showSnackBar(context, 'Zone C tappée'),
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
        onTap: () => _showSnackBar(context, 'Serre principale tappée'),
        children: [
          HierarchicalMenuItem(
            id: '1.1',
            title: 'Zone A',
            subtitle: '22°C',
            level: 2,
            onTap: () => _showSnackBar(context, 'Zone A tappée'),
          ),
          HierarchicalMenuItem(
            id: '1.2',
            title: 'Zone B',
            subtitle: '21°C',
            level: 2,
            onTap: () => _showSnackBar(context, 'Zone B tappée'),
          ),
        ],
      ),
    ],
    selectedItemId: '1.1',
    onItemSelected: (item) =>
        _showSnackBar(context, 'Item sélectionné: ${item.title}'),
  );
}
