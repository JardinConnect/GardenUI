import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:garden_ui/ui/design_system.dart';
import 'package:garden_ui/ui/widgets/molecules/MenuItem/menu_item.dart';

@UseCase(
  name: 'Default',
  type: MenuItem,
  designLink: 'https://www.figma.com/file/your-menu-item-design',
)
Widget buildMenuItemUseCase(BuildContext context) {
  return const _MenuItemShowcase();
}

class _MenuItemShowcase extends StatelessWidget {
  const _MenuItemShowcase();

  void onTap() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          color: GardenColors.base.shade50,
          padding: EdgeInsets.all(GardenSpace.paddingMd),
          child: Column(
            spacing: GardenSpace.gapLg,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Small', style: GardenTypography.bodyLg),
              MenuItem(
                icon: Icons.home_outlined,
                label: 'Home',
                size: MenuItemSize.sm,
                onTap: onTap,
              ),

              Text('Medium', style: GardenTypography.bodyLg),
              MenuItem(
                icon: Icons.home_outlined,
                label: 'Home',
                size: MenuItemSize.md,
                onTap: onTap,
              ),

              Text('Large', style: GardenTypography.bodyLg),
              MenuItem(
                icon: Icons.home_outlined,
                label: 'Home',
                size: MenuItemSize.lg,
                onTap: onTap,
              ),

              Text('Danger', style: GardenTypography.bodyLg),
              MenuItem(
                icon: Icons.logout_outlined,
                label: 'Logout',
                onTap: onTap,
                severity: MenuItemSeverity.danger,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
