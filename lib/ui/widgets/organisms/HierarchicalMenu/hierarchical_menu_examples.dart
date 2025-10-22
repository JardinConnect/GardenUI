import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:garden_ui/ui/components.dart';

@widgetbook.UseCase(name: 'Complete Example', type: HierarchicalMenu)
Widget hierarchicalMenuCompleteExampleUseCase(BuildContext context) {
  return StatefulBuilder(
    builder: (context, setState) {
      String? selectedItemId;

      final items = [
        HierarchicalMenuItem(
          id: 'greenhouse_1',
          title: 'Serre principale',
          subtitle: '24°C - 65%',
          icon: Icons.home,
          level: 1,
          alertType: MenuAlertType.warning,
          children: [
            HierarchicalMenuItem(
              id: 'zone_a',
              title: 'Zone A - Légumes',
              subtitle: '22°C - 70%',
              icon: Icons.grass,
              level: 2,
              children: [
                HierarchicalMenuItem(
                  id: 'irrigation_a',
                  title: 'Système irrigation',
                  subtitle: 'Actif',
                  icon: Icons.water_drop,
                  level: 3,
                  children: [
                    HierarchicalMenuItem(
                      id: 'pump_main',
                      title: 'Pompe principale',
                      subtitle: '2.5 bar',
                      icon: Icons.settings,
                      level: 4,
                      alertType: MenuAlertType.error,
                      children: [
                        HierarchicalMenuItem(
                          id: 'flow_sensor',
                          title: 'Capteur débit',
                          subtitle: '15 L/min',
                          icon: Icons.speed,
                          level: 5,
                          alertType: MenuAlertType.error,
                        ),
                        HierarchicalMenuItem(
                          id: 'pressure_sensor',
                          title: 'Capteur pression',
                          subtitle: '2.3 bar',
                          icon: Icons.compress,
                          level: 5,
                        ),
                      ],
                    ),
                    HierarchicalMenuItem(
                      id: 'valve_control',
                      title: 'Contrôle vannes',
                      subtitle: '3/5 ouvertes',
                      icon: Icons.tune,
                      level: 4,
                    ),
                  ],
                ),
                HierarchicalMenuItem(
                  id: 'climate_a',
                  title: 'Contrôle climatique',
                  subtitle: '22°C - 70%',
                  icon: Icons.thermostat,
                  level: 3,
                  children: [
                    HierarchicalMenuItem(
                      id: 'temp_sensor_a',
                      title: 'Capteur température',
                      subtitle: '22.1°C',
                      icon: Icons.device_thermostat,
                      level: 4,
                    ),
                    HierarchicalMenuItem(
                      id: 'humidity_sensor_a',
                      title: 'Capteur humidité',
                      subtitle: '71.2%',
                      icon: Icons.opacity,
                      level: 4,
                      alertType: MenuAlertType.warning,
                    ),
                  ],
                ),
              ],
            ),
            HierarchicalMenuItem(
              id: 'zone_b',
              title: 'Zone B - Fruits',
              subtitle: '26°C - 60%',
              icon: Icons.local_florist,
              level: 2,
              children: [
                HierarchicalMenuItem(
                  id: 'climate_b',
                  title: 'Contrôle climatique',
                  subtitle: '26°C - 60%',
                  icon: Icons.thermostat,
                  level: 3,
                ),
              ],
            ),
            HierarchicalMenuItem(
              id: 'ventilation',
              title: 'Système ventilation',
              subtitle: 'Auto - 45%',
              icon: Icons.air,
              level: 2,
              children: [
                HierarchicalMenuItem(
                  id: 'fan_1',
                  title: 'Ventilateur 1',
                  subtitle: '1200 RPM',
                  icon: Icons.settings,
                  level: 3,
                ),
                HierarchicalMenuItem(
                  id: 'fan_2',
                  title: 'Ventilateur 2',
                  subtitle: 'Arrêté',
                  icon: Icons.settings,
                  level: 3,
                  alertType: MenuAlertType.warning,
                ),
              ],
            ),
          ],
        ),
        HierarchicalMenuItem(
          id: 'greenhouse_2',
          title: 'Serre secondaire',
          subtitle: '20°C - 55%',
          icon: Icons.business,
          level: 1,
          children: [
            HierarchicalMenuItem(
              id: 'zone_unique',
              title: 'Zone unique',
              subtitle: '20°C - 55%',
              icon: Icons.grass,
              level: 2,
              children: [
                HierarchicalMenuItem(
                  id: 'basic_irrigation',
                  title: 'Irrigation basique',
                  subtitle: 'Manuel',
                  icon: Icons.water_drop,
                  level: 3,
                ),
              ],
            ),
          ],
        ),
        HierarchicalMenuItem(
          id: 'storage',
          title: 'Zone stockage',
          subtitle: '18°C - 45%',
          icon: Icons.warehouse,
          level: 1,
          children: [
            HierarchicalMenuItem(
              id: 'cold_storage',
              title: 'Chambre froide',
              subtitle: '4°C - 85%',
              icon: Icons.ac_unit,
              level: 2,
              alertType: MenuAlertType.error,
            ),
          ],
        ),
      ];

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: HierarchicalMenu(
          items: items,
          size: HierarchicalMenuSize.md,
          selectedItemId: selectedItemId,
          maxHeight: 600,
          onItemSelected: (item) {
            setState(() {
              selectedItemId = item.id;
            });
          },
          onItemExpansionChanged: (item) {
            // Gérer l'expansion/collapse
            debugPrint(
              'Item ${item.title} ${item.isExpanded ? "expanded" : "collapsed"}',
            );
          },
        ),
      );
    },
  );
}

@widgetbook.UseCase(
  name: 'Small Size with Deep Nesting',
  type: HierarchicalMenu,
)
Widget hierarchicalMenuDeepNestingUseCase(BuildContext context) {
  return HierarchicalMenu(
    size: HierarchicalMenuSize.sm,
    maxHeight: 400,
    items: [
      HierarchicalMenuItem(
        id: '1',
        title: 'Niveau 1',
        level: 1,
        isExpanded: true,
        children: [
          HierarchicalMenuItem(
            id: '2',
            title: 'Niveau 2',
            level: 2,
            isExpanded: true,
            children: [
              HierarchicalMenuItem(
                id: '3',
                title: 'Niveau 3',
                level: 3,
                isExpanded: true,
                children: [
                  HierarchicalMenuItem(
                    id: '4',
                    title: 'Niveau 4',
                    level: 4,
                    isExpanded: true,
                    children: [
                      HierarchicalMenuItem(
                        id: '5',
                        title: 'Niveau 5 (Max)',
                        subtitle: 'Dernier niveau',
                        level: 5,
                        alertType: MenuAlertType.warning,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
