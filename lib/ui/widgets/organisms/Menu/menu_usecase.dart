import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook_workspace/ui/components.dart';
import 'package:widgetbook_workspace/ui/design_system.dart';

@UseCase(
  name: 'Default',
  type: Menu,
  designLink: 'https://www.figma.com/file/your-menu-design',
)
Widget buildMenuUseCase(BuildContext context) {
  return const _MenuShowcase();
}

class _MenuShowcase extends StatelessWidget {
  const _MenuShowcase();

  void onTap() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 900,
        width: 900,
        color: GardenColors.base.shade50,
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            height: double.infinity,
            child: Menu(
              items: [
                MenuItem(
                  icon: Icons.home_outlined,
                  label: "Dashboard",
                  onTap: onTap,
                ),
                MenuItem(
                  icon: Icons.hexagon_outlined,
                  label: "Espaces",
                  onTap: onTap,
                ),
                MenuItem(icon: Icons.sensors, label: "Cellules", onTap: onTap),
                MenuItem(
                  icon: Icons.thunderstorm_outlined,
                  label: "Alertes",
                  onTap: onTap,
                ),
              ],
              bottomItems: [
                MenuItem(
                  icon: Icons.settings_outlined,
                  label: "Paramètres",
                  onTap: onTap,
                ),
                MenuItem(
                  icon: Icons.logout,
                  label: "Déconnexion",
                  onTap: onTap,
                  severity: MenuItemSeverity.danger,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
