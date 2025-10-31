import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:garden_ui/ui/components.dart';

@UseCase(name: 'Default', type: HierarchicalMenuItemWidget)
Widget hierarchicalMenuItemDefaultUseCase(BuildContext context) {
  return HierarchicalMenuItemWidget(
    item: HierarchicalMenuItem(
      id: '1',
      title: 'Serre principale',
      subtitle: '24°C - 65%',
      icon: Icons.home,
      level: 1,
      alertType: MenuAlertType.warning,
      children: [HierarchicalMenuItem(id: '1.1', title: 'Zone A', level: 2)],
    ),
  );
}

@UseCase(name: 'With Children Expanded', type: HierarchicalMenuItemWidget)
Widget hierarchicalMenuItemExpandedUseCase(BuildContext context) {
  return HierarchicalMenuItemWidget(
    item: HierarchicalMenuItem(
      id: '1',
      title: 'Serre principale',
      subtitle: '24°C - 65%',
      icon: Icons.home,
      level: 1,
      isExpanded: true,
      alertType: MenuAlertType.error,
      children: [HierarchicalMenuItem(id: '1.1', title: 'Zone A', level: 2)],
    ),
  );
}
