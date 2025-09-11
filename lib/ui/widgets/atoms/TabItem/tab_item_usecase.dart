import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook_workspace/ui/design_system.dart';
import 'package:widgetbook_workspace/ui/widgets/atoms/TabItem/tab_item.dart';

@UseCase(
  name: 'States',
  type: TabItem,
  designLink: 'https://www.figma.com/file/your-tab-design',
)
Widget buildTabItemUseCase(BuildContext context) {
  return Container(
    color: GardenColors.base.shade50,
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Basic Tabs', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabItem(label: 'Selected', isSelected: true, onTap: () {}),
            const SizedBox(width: 32),
            TabItem(label: 'Unselected', isSelected: false, onTap: () {}),
          ],
        ),

        const SizedBox(height: 32),
        Text('Tabs with Icons', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabItem(
              label: 'Home',
              icon: Icons.home,
              isSelected: true,
              onTap: () {},
            ),
            const SizedBox(width: 32),
            TabItem(
              label: 'Profile',
              icon: Icons.person,
              isSelected: false,
              onTap: () {},
            ),
          ],
        ),

        const SizedBox(height: 32),
        Text(
          'Tabs with Adaptive Indicator',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabItem(
              label: 'Selected',
              isSelected: true,
              matchIndicatorToContent: true,
              onTap: () {},
            ),
            const SizedBox(width: 32),
            TabItem(
              label: 'Unselected',
              isSelected: false,
              matchIndicatorToContent: true,
              onTap: () {},
            ),
          ],
        ),
      ],
    ),
  );
}
