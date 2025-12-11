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

@UseCase(
  name: 'Interactive with content display',
  type: HierarchicalMenuItemWidget,
)
Widget hierarchicalMenuItemInteractiveUseCase(BuildContext context) {
  return const _InteractiveHierarchicalMenuDemo();
}

class _InteractiveHierarchicalMenuDemo extends StatefulWidget {
  const _InteractiveHierarchicalMenuDemo();

  @override
  State<_InteractiveHierarchicalMenuDemo> createState() =>
      _InteractiveHierarchicalMenuDemoState();
}

class _InteractiveHierarchicalMenuDemoState
    extends State<_InteractiveHierarchicalMenuDemo> {
  late List<HierarchicalMenuItem> menuItems;
  String? selectedItemId;

  @override
  void initState() {
    super.initState();
    menuItems = [
      HierarchicalMenuItem(
        id: 'greenhouse1',
        title: 'Serre principale',
        subtitle: '24°C - 65%',
        icon: Icons.home,
        level: 1,
        alertType: MenuAlertType.warning,
        isExpanded: false,
        children: [
          HierarchicalMenuItem(
            id: 'greenhouse1_zone_a',
            title: 'Zone A - Tomates',
            subtitle: '22°C - 70%',
            level: 2,
            alertType: MenuAlertType.none,
          ),
          HierarchicalMenuItem(
            id: 'greenhouse1_zone_b',
            title: 'Zone B - Salades',
            subtitle: '20°C - 60%',
            level: 2,
            alertType: MenuAlertType.error,
          ),
          HierarchicalMenuItem(
            id: 'greenhouse1_zone_c',
            title: 'Zone C - Herbes',
            subtitle: '23°C - 55%',
            level: 2,
            alertType: MenuAlertType.warning,
          ),
        ],
      ),
      HierarchicalMenuItem(
        id: 'greenhouse2',
        title: 'Serre secondaire',
        subtitle: '26°C - 80%',
        icon: Icons.agriculture,
        level: 1,
        alertType: MenuAlertType.error,
        isExpanded: false,
        children: [
          HierarchicalMenuItem(
            id: 'greenhouse2_zone_a',
            title: 'Zone A - Fleurs',
            subtitle: '25°C - 75%',
            level: 2,
            alertType: MenuAlertType.none,
            children: [
              HierarchicalMenuItem(
                id: 'greenhouse2_zone_a_orchids',
                title: 'Orchidées',
                level: 3,
                alertType: MenuAlertType.warning,
              ),
              HierarchicalMenuItem(
                id: 'greenhouse2_zone_a_roses',
                title: 'Roses',
                level: 3,
                alertType: MenuAlertType.none,
              ),
            ],
          ),
          HierarchicalMenuItem(
            id: 'greenhouse2_zone_b',
            title: 'Zone B - Cactus',
            subtitle: '28°C - 40%',
            level: 2,
            alertType: MenuAlertType.none,
          ),
        ],
      ),
      HierarchicalMenuItem(
        id: 'outdoor',
        title: 'Jardin extérieur',
        subtitle: '18°C - 45%',
        icon: Icons.park,
        level: 1,
        alertType: MenuAlertType.none,
        isExpanded: false,
        children: [
          HierarchicalMenuItem(
            id: 'outdoor_vegetables',
            title: 'Potager',
            level: 2,
            alertType: MenuAlertType.none,
          ),
          HierarchicalMenuItem(
            id: 'outdoor_fruits',
            title: 'Verger',
            level: 2,
            alertType: MenuAlertType.warning,
          ),
        ],
      ),
    ];
  }

  void _handleExpansionChanged(HierarchicalMenuItem item) {
    setState(() {
      _toggleExpansion(menuItems, item.id);
    });
  }

  void _toggleExpansion(List<HierarchicalMenuItem> items, String itemId) {
    for (var i = 0; i < items.length; i++) {
      if (items[i].id == itemId) {
        items[i] = items[i].copyWith(isExpanded: !items[i].isExpanded);
        return;
      }
      if (items[i].children != null && items[i].children!.isNotEmpty) {
        _toggleExpansion(items[i].children!, itemId);
      }
    }
  }

  void _handleItemTapped(HierarchicalMenuItem item) {
    setState(() {
      selectedItemId = item.id;
    });
  }

  String _getContentForItem(String itemId) {
    final contentMap = {
      'greenhouse1': 'Serre principale\n\n'
          'Température moyenne: 24°C\n'
          'Humidité: 65%\n'
          'Statut: Attention requise\n\n'
          'Cette serre contient 3 zones de culture avec différentes plantes.',
      'greenhouse1_zone_a': 'Zone A - Tomates\n\n'
          'Température: 22°C\n'
          'Humidité: 70%\n'
          'Type de culture: Tomates cerises\n'
          'Statut: Normal\n\n'
          'Production estimée: 45kg cette semaine',
      'greenhouse1_zone_b': 'Zone B - Salades\n\n'
          'Température: 20°C\n'
          'Humidité: 60%\n'
          'Type de culture: Laitue romaine\n'
          'Statut: ALERTE - Irrigation nécessaire\n\n'
          'Vérifier le système d\'arrosage',
      'greenhouse1_zone_c': 'Zone C - Herbes\n\n'
          'Température: 23°C\n'
          'Humidité: 55%\n'
          'Type de culture: Basilic, Persil, Coriandre\n'
          'Statut: Attention - Humidité basse',
      'greenhouse2': 'Serre secondaire\n\n'
          'Température moyenne: 26°C\n'
          'Humidité: 80%\n'
          'Statut: ALERTE - Température élevée\n\n'
          'Ventilation recommandée',
      'greenhouse2_zone_a': 'Zone A - Fleurs\n\n'
          'Température: 25°C\n'
          'Humidité: 75%\n'
          'Type de culture: Fleurs ornementales\n'
          'Statut: Normal\n\n'
          'Contient 2 sous-zones spécialisées',
      'greenhouse2_zone_a_orchids': 'Orchidées\n\n'
          'Température: 25°C\n'
          'Humidité: 80%\n'
          'Espèces: Phalaenopsis, Cattleya\n'
          'Statut: Attention - Contrôler humidité\n\n'
          '23 plants en floraison',
      'greenhouse2_zone_a_roses': 'Roses\n\n'
          'Température: 24°C\n'
          'Humidité: 70%\n'
          'Variétés: Rouge passion, Rose pâle\n'
          'Statut: Normal\n\n'
          'Taille prévue la semaine prochaine',
      'greenhouse2_zone_b': 'Zone B - Cactus\n\n'
          'Température: 28°C\n'
          'Humidité: 40%\n'
          'Collection: Cactus variés\n'
          'Statut: Optimal\n\n'
          'Conditions parfaites pour les succulentes',
      'outdoor': 'Jardin extérieur\n\n'
          'Température: 18°C\n'
          'Humidité: 45%\n'
          'Statut: Normal\n\n'
          'Conditions météo favorables',
      'outdoor_vegetables': 'Potager\n\n'
          'Température: 18°C\n'
          'Cultures: Carottes, Courgettes, Poivrons\n'
          'Statut: Normal\n\n'
          'Récolte prévue dans 2 semaines',
      'outdoor_fruits': 'Verger\n\n'
          'Température: 18°C\n'
          'Arbres: Pommiers, Poiriers, Cerisiers\n'
          'Statut: Attention - Traitement préventif requis\n\n'
          'Inspection des parasites recommandée',
    };

    return contentMap[itemId] ??
        'Sélectionnez un élément du menu pour voir son contenu détaillé.';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Menu on the left
        SizedBox(
          width: 350,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var item in menuItems)
                  _buildMenuItemWithChildren(item),
              ],
            ),
          ),
        ),
        const SizedBox(width: 24),
        // Content on the right
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Détails',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  _getContentForItem(selectedItemId ?? ''),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItemWithChildren(HierarchicalMenuItem item) {
    return Column(
      children: [
        HierarchicalMenuItemWidget(
          item: item,
          isSelected: selectedItemId == item.id,
          onExpansionChanged: _handleExpansionChanged,
          onItemTapped: _handleItemTapped,
        ),
        if (item.isExpanded && item.children != null)
          for (var child in item.children!)
            _buildMenuItemWithChildren(child),
      ],
    );
  }
}