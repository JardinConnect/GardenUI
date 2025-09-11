import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/ui/components.dart';
import 'package:widgetbook_workspace/ui/design_system.dart';

/// Exemple d'intégration complète du menu hiérarchique
/// dans une application de gestion de jardin connecté
class GardenManagementExample extends StatefulWidget {
  const GardenManagementExample({super.key});

  @override
  State<GardenManagementExample> createState() =>
      _GardenManagementExampleState();
}

class _GardenManagementExampleState extends State<GardenManagementExample> {
  String? selectedItemId;
  late List<HierarchicalMenuItem> menuItems;

  @override
  void initState() {
    super.initState();
    _initializeMenuItems();
  }

  void _initializeMenuItems() {
    menuItems = [
      HierarchicalMenuItem(
        id: 'greenhouse_main',
        title: 'Serre principale',
        subtitle: '24.2°C - 67% HR',
        icon: Icons.home_work,
        level: 1,
        alertType: MenuAlertType.warning,
        children: [
          HierarchicalMenuItem(
            id: 'zone_vegetables',
            title: 'Zone légumes',
            subtitle: '22.8°C - 72% HR',
            icon: Icons.eco,
            level: 2,
            children: [
              HierarchicalMenuItem(
                id: 'irrigation_vegetables',
                title: 'Système irrigation',
                subtitle: 'Cycle: 15min - Actif',
                icon: Icons.water_drop,
                level: 3,
                children: [
                  HierarchicalMenuItem(
                    id: 'main_pump',
                    title: 'Pompe principale',
                    subtitle: '2.4 bar - 850 RPM',
                    icon: Icons.settings_input_component,
                    level: 4,
                    alertType: MenuAlertType.error,
                    children: [
                      HierarchicalMenuItem(
                        id: 'flow_sensor_main',
                        title: 'Capteur débit',
                        subtitle: '14.2 L/min',
                        icon: Icons.speed,
                        level: 5,
                        alertType: MenuAlertType.error,
                      ),
                      HierarchicalMenuItem(
                        id: 'pressure_sensor_main',
                        title: 'Capteur pression',
                        subtitle: '2.4 bar',
                        icon: Icons.compress,
                        level: 5,
                      ),
                      HierarchicalMenuItem(
                        id: 'temperature_sensor_pump',
                        title: 'Température pompe',
                        subtitle: '68°C',
                        icon: Icons.device_thermostat,
                        level: 5,
                        alertType: MenuAlertType.warning,
                      ),
                    ],
                  ),
                  HierarchicalMenuItem(
                    id: 'valve_controller',
                    title: 'Contrôleur vannes',
                    subtitle: '4/6 vannes ouvertes',
                    icon: Icons.tune,
                    level: 4,
                    children: [
                      HierarchicalMenuItem(
                        id: 'valve_1',
                        title: 'Vanne secteur 1',
                        subtitle: '100% - Ouverte',
                        icon: Icons.water,
                        level: 5,
                      ),
                      HierarchicalMenuItem(
                        id: 'valve_2',
                        title: 'Vanne secteur 2',
                        subtitle: '75% - Ouverte',
                        icon: Icons.water,
                        level: 5,
                      ),
                    ],
                  ),
                ],
              ),
              HierarchicalMenuItem(
                id: 'climate_vegetables',
                title: 'Contrôle climatique',
                subtitle: '22.8°C - 72% HR',
                icon: Icons.thermostat,
                level: 3,
                children: [
                  HierarchicalMenuItem(
                    id: 'temp_sensor_veg',
                    title: 'Capteur température',
                    subtitle: '22.8°C (Cible: 23°C)',
                    icon: Icons.device_thermostat,
                    level: 4,
                  ),
                  HierarchicalMenuItem(
                    id: 'humidity_sensor_veg',
                    title: 'Capteur humidité',
                    subtitle: '72.1% HR (Cible: 70%)',
                    icon: Icons.opacity,
                    level: 4,
                    alertType: MenuAlertType.warning,
                  ),
                  HierarchicalMenuItem(
                    id: 'heater_veg',
                    title: 'Chauffage d\'appoint',
                    subtitle: 'Arrêt - 0W',
                    icon: Icons.whatshot,
                    level: 4,
                  ),
                ],
              ),
              HierarchicalMenuItem(
                id: 'lighting_vegetables',
                title: 'Éclairage LED',
                subtitle: 'Auto - 65% intensité',
                icon: Icons.lightbulb,
                level: 3,
                children: [
                  HierarchicalMenuItem(
                    id: 'led_panel_1',
                    title: 'Panneau LED 1',
                    subtitle: '65% - Spectre complet',
                    icon: Icons.light,
                    level: 4,
                  ),
                  HierarchicalMenuItem(
                    id: 'led_panel_2',
                    title: 'Panneau LED 2',
                    subtitle: '65% - Spectre complet',
                    icon: Icons.light,
                    level: 4,
                  ),
                ],
              ),
            ],
          ),
          HierarchicalMenuItem(
            id: 'zone_fruits',
            title: 'Zone fruits',
            subtitle: '26.1°C - 58% HR',
            icon: Icons.local_florist,
            level: 2,
            children: [
              HierarchicalMenuItem(
                id: 'climate_fruits',
                title: 'Contrôle climatique',
                subtitle: '26.1°C - 58% HR',
                icon: Icons.thermostat,
                level: 3,
              ),
              HierarchicalMenuItem(
                id: 'irrigation_fruits',
                title: 'Irrigation goutte-à-goutte',
                subtitle: 'Cycle: 30min - Inactif',
                icon: Icons.water_drop,
                level: 3,
              ),
            ],
          ),
          HierarchicalMenuItem(
            id: 'ventilation_system',
            title: 'Système ventilation',
            subtitle: 'Auto - 45% vitesse',
            icon: Icons.air,
            level: 2,
            children: [
              HierarchicalMenuItem(
                id: 'intake_fan',
                title: 'Ventilateur admission',
                subtitle: '1200 RPM - Normal',
                icon: Icons.settings_input_component,
                level: 3,
              ),
              HierarchicalMenuItem(
                id: 'exhaust_fan',
                title: 'Ventilateur extraction',
                subtitle: '0 RPM - Arrêté',
                icon: Icons.settings_input_component,
                level: 3,
                alertType: MenuAlertType.warning,
              ),
            ],
          ),
        ],
      ),
      HierarchicalMenuItem(
        id: 'greenhouse_secondary',
        title: 'Serre secondaire',
        subtitle: '19.8°C - 55% HR',
        icon: Icons.business,
        level: 1,
        children: [
          HierarchicalMenuItem(
            id: 'zone_seedlings',
            title: 'Zone semis',
            subtitle: '19.8°C - 55% HR',
            icon: Icons.grass,
            level: 2,
            children: [
              HierarchicalMenuItem(
                id: 'basic_irrigation',
                title: 'Irrigation manuelle',
                subtitle: 'Dernière fois: 2h ago',
                icon: Icons.water_drop,
                level: 3,
              ),
              HierarchicalMenuItem(
                id: 'heating_mat',
                title: 'Tapis chauffant',
                subtitle: '22°C - Actif (150W)',
                icon: Icons.whatshot,
                level: 3,
              ),
            ],
          ),
        ],
      ),
      HierarchicalMenuItem(
        id: 'storage_area',
        title: 'Zone stockage',
        subtitle: '16.5°C - 42% HR',
        icon: Icons.warehouse,
        level: 1,
        children: [
          HierarchicalMenuItem(
            id: 'cold_storage',
            title: 'Chambre froide',
            subtitle: '3.8°C - 85% HR',
            icon: Icons.ac_unit,
            level: 2,
            alertType: MenuAlertType.error,
            children: [
              HierarchicalMenuItem(
                id: 'cooling_system',
                title: 'Système refroidissement',
                subtitle: 'Défaillant - Maintenance',
                icon: Icons.ac_unit,
                level: 3,
                alertType: MenuAlertType.error,
              ),
            ],
          ),
          HierarchicalMenuItem(
            id: 'tools_storage',
            title: 'Stockage outils',
            subtitle: 'Inventaire: 25 items',
            icon: Icons.build,
            level: 2,
          ),
        ],
      ),
      HierarchicalMenuItem(
        id: 'weather_station',
        title: 'Station météo',
        subtitle: 'Ext: 18°C - 60% HR',
        icon: Icons.wb_sunny,
        level: 1,
        children: [
          HierarchicalMenuItem(
            id: 'outdoor_sensors',
            title: 'Capteurs extérieurs',
            subtitle: '18.2°C - 60% HR',
            icon: Icons.sensors,
            level: 2,
            children: [
              HierarchicalMenuItem(
                id: 'wind_sensor',
                title: 'Anémomètre',
                subtitle: '12 km/h - SO',
                icon: Icons.air,
                level: 3,
              ),
              HierarchicalMenuItem(
                id: 'rain_sensor',
                title: 'Pluviomètre',
                subtitle: '2.4mm aujourd\'hui',
                icon: Icons.beach_access,
                level: 3,
              ),
            ],
          ),
        ],
      ),
    ];
  }

  void _handleItemSelected(HierarchicalMenuItem item) {
    setState(() {
      selectedItemId = item.id;
    });

    // Simuler la navigation vers une page de détails
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigation vers: ${item.title}'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _handleItemExpansionChanged(HierarchicalMenuItem item) {
    setState(() {
      menuItems = _updateItemInTree(menuItems, item);
    });
  }

  List<HierarchicalMenuItem> _updateItemInTree(
    List<HierarchicalMenuItem> items,
    HierarchicalMenuItem updatedItem,
  ) {
    return items.map((item) {
      if (item.id == updatedItem.id) {
        return updatedItem;
      } else if (item.hasChildren) {
        return item.copyWith(
          children: _updateItemInTree(item.children, updatedItem),
        );
      }
      return item;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jardin Connecté - Surveillance'),
        backgroundColor: GardenColors.primary.shade500,
        foregroundColor: GardenColors.base.shade50,
        elevation: 4,
      ),
      body: Row(
        children: [
          // Menu hiérarchique
          Container(
            width: 350,
            decoration: BoxDecoration(
              color: GardenColors.base.shade50,
              border: Border(
                right: BorderSide(color: GardenColors.base.shade200, width: 1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(GardenSpace.paddingLg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Surveillance',
                        style: GardenTypography.headingMd.copyWith(
                          color: GardenColors.typography.shade800,
                        ),
                      ),
                      Text(
                        'État des équipements en temps réel',
                        style: GardenTypography.bodyMd.copyWith(
                          color: GardenColors.typography.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      left: GardenSpace.paddingLg,
                      right: GardenSpace.paddingLg,
                      bottom: GardenSpace.paddingLg,
                    ),
                    child: HierarchicalMenu(
                      items: menuItems,
                      size: HierarchicalMenuSize.md,
                      selectedItemId: selectedItemId,
                      onItemSelected: _handleItemSelected,
                      onItemExpansionChanged: _handleItemExpansionChanged,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Contenu principal
          Expanded(
            child: Container(
              padding: EdgeInsets.all(GardenSpace.paddingXl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedItemId != null
                        ? 'Détails : ${_findItemById(selectedItemId!)?.title ?? "Sélection inconnue"}'
                        : 'Sélectionnez un élément dans le menu',
                    style: GardenTypography.headingLg.copyWith(
                      color: GardenColors.typography.shade800,
                    ),
                  ),
                  SizedBox(height: GardenSpace.paddingLg),
                  if (selectedItemId != null) ...[
                    _buildDetailCard(),
                    SizedBox(height: GardenSpace.paddingLg),
                    _buildStatusCard(),
                  ] else
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.touch_app,
                              size: 64,
                              color: GardenColors.base.shade400,
                            ),
                            SizedBox(height: GardenSpace.paddingMd),
                            Text(
                              'Cliquez sur un élément du menu\npour voir les détails',
                              textAlign: TextAlign.center,
                              style: GardenTypography.bodyLg.copyWith(
                                color: GardenColors.typography.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  HierarchicalMenuItem? _findItemById(String id) {
    return _findItemInTree(menuItems, id);
  }

  HierarchicalMenuItem? _findItemInTree(
    List<HierarchicalMenuItem> items,
    String id,
  ) {
    for (final item in items) {
      if (item.id == id) return item;
      if (item.hasChildren) {
        final found = _findItemInTree(item.children, id);
        if (found != null) return found;
      }
    }
    return null;
  }

  Widget _buildDetailCard() {
    final item = _findItemById(selectedItemId!);
    if (item == null) return const SizedBox();

    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(GardenSpace.paddingLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (item.icon != null)
                  Icon(
                    item.icon,
                    size: 32,
                    color: GardenColors.primary.shade500,
                  ),
                if (item.icon != null) SizedBox(width: GardenSpace.paddingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title, style: GardenTypography.headingMd),
                      if (item.subtitle != null)
                        Text(
                          item.subtitle!,
                          style: GardenTypography.bodyLg.copyWith(
                            color: GardenColors.typography.shade500,
                          ),
                        ),
                    ],
                  ),
                ),
                if (item.alertType != MenuAlertType.none)
                  AlertIndicator(
                    alertType: item.alertType,
                    size: AlertIndicatorSize.lg,
                  ),
              ],
            ),
            SizedBox(height: GardenSpace.paddingMd),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: GardenSpace.paddingSm,
                vertical: GardenSpace.paddingXs,
              ),
              decoration: BoxDecoration(
                color: item.levelColor.withOpacity(0.1),
                borderRadius: GardenRadius.radiusSm,
                border: Border.all(color: item.levelColor.withOpacity(0.3)),
              ),
              child: Text(
                'Niveau ${item.level}',
                style: GardenTypography.caption.copyWith(
                  color: item.levelColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(GardenSpace.paddingLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Informations système', style: GardenTypography.headingSm),
            SizedBox(height: GardenSpace.paddingMd),
            Row(
              children: [
                _buildInfoChip('Dernière mise à jour', '2 min ago'),
                SizedBox(width: GardenSpace.paddingMd),
                _buildInfoChip('Statut réseau', 'Connecté'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: GardenSpace.paddingSm,
        vertical: GardenSpace.paddingXs,
      ),
      decoration: BoxDecoration(
        color: GardenColors.base.shade100,
        borderRadius: GardenRadius.radiusSm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GardenTypography.caption.copyWith(
              color: GardenColors.typography.shade400,
            ),
          ),
          Text(
            value,
            style: GardenTypography.bodyMd.copyWith(
              fontWeight: FontWeight.w600,
              color: GardenColors.typography.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Complete Garden Management',
  type: GardenManagementExample,
)
Widget gardenManagementCompleteUseCase(BuildContext context) {
  return const GardenManagementExample();
}
