import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook_workspace/ui/design_system.dart';
import 'package:widgetbook_workspace/ui/widgets/atoms/MenuIcon/menu_icon.dart';

@UseCase(
  name: 'States',
  type: MenuIcon,
  designLink: 'https://www.figma.com/file/your-menu-design',
)
Widget buildMenuIconUseCase(BuildContext context) {
  return Container(
    color: GardenColors.base.shade50,
    padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MenuIcon(icon: Icons.home_outlined, size: MenuIconSize.sm),
        const SizedBox(width: 32),
        MenuIcon(icon: Icons.home_outlined),
        const SizedBox(width: 32),
        MenuIcon(
          icon: Icons.home_outlined,
          isActive: true,
          size: MenuIconSize.lg,
        ),
      ],
    ),
  );
}
