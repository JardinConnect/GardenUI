import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook_workspace/ui/widgets/atoms/MenuIcon/menu_icon.dart';

@UseCase(
  name: 'States',
  type: MenuIcon,
  designLink: 'https://www.figma.com/file/your-menu-design',
)
Widget buildMenuIconUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Basic Menu Icons', style: Theme.of(context).textTheme.titleMedium),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MenuIcon(icon: Icons.home_outlined, matchToContent: false),
          const SizedBox(width: 32),
          MenuIcon(
            icon: Icons.home_outlined,
            isSelected: true,
            matchToContent: false,
          ),
        ],
      ),
    ],
  );
}
