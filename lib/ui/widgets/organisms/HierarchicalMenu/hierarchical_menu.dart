import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:garden_ui/ui/design_system.dart';
import 'package:garden_ui/ui/models/hierarchical_menu_item.dart';
import 'package:garden_ui/ui/widgets/molecules/HierarchicalMenuItem/hierarchical_menu_item.dart';

/// Tailles disponibles pour le menu hiérarchique
enum HierarchicalMenuSize { sm, md, lg }

/// Menu vertical hiérarchique multi-niveaux
///
/// Composant permettant d'afficher une liste verticale d'éléments
/// extensibles/collapsibles avec jusqu'à 5 niveaux de profondeur
class HierarchicalMenu extends StatefulWidget {
  /// Liste des éléments racine du menu
  final List<HierarchicalMenuItem> items;

  /// Taille du menu
  final HierarchicalMenuSize size;

  /// ID de l'élément sélectionné
  final String? selectedItemId;

  /// Callback appelé lors de la sélection d'un élément
  final ValueChanged<HierarchicalMenuItem>? onItemSelected;

  /// Callback appelé lors du changement d'état d'expansion
  final ValueChanged<HierarchicalMenuItem>? onItemExpansionChanged;

  /// Largeur maximale du menu (optionnelle)
  final double? maxWidth;

  /// Hauteur maximale du menu (optionnelle)
  final double? maxHeight;

  const HierarchicalMenu({
    super.key,
    required this.items,
    this.size = HierarchicalMenuSize.md,
    this.selectedItemId,
    this.onItemSelected,
    this.onItemExpansionChanged,
    this.maxWidth,
    this.maxHeight,
  });

  @override
  State<HierarchicalMenu> createState() => _HierarchicalMenuState();
}

class _HierarchicalMenuState extends State<HierarchicalMenu>
    with TickerProviderStateMixin {
  late List<HierarchicalMenuItem> _items;
  late AnimationController _expansionController;
  final Map<String, AnimationController> _itemControllers = {};
  final Map<String, Animation<double>> _itemAnimations = {};

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items);
    _expansionController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _initializeAnimations();
  }

  @override
  void didUpdateWidget(HierarchicalMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items != oldWidget.items) {
      _items = List.from(widget.items);
      _initializeAnimations();
    }
  }

  @override
  void dispose() {
    _expansionController.dispose();
    for (final controller in _itemControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _initializeAnimations() {
    // Nettoyer les anciens contrôleurs
    for (final controller in _itemControllers.values) {
      controller.dispose();
    }
    _itemControllers.clear();
    _itemAnimations.clear();

    // Créer des contrôleurs pour chaque item
    _createAnimationsForItems(_items);
  }

  void _createAnimationsForItems(List<HierarchicalMenuItem> items) {
    for (final item in items) {
      if (!_itemControllers.containsKey(item.id)) {
        final controller = AnimationController(
          duration: const Duration(milliseconds: 250),
          vsync: this,
        );
        _itemControllers[item.id] = controller;
        _itemAnimations[item.id] = CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        );

        if (item.isExpanded) {
          controller.value = 1.0;
        }
      }

      if (item.hasChildren) {
        _createAnimationsForItems(item.children);
      }
    }
  }

  HierarchicalMenuItemSize get _itemSize {
    switch (widget.size) {
      case HierarchicalMenuSize.sm:
        return HierarchicalMenuItemSize.sm;
      case HierarchicalMenuSize.md:
        return HierarchicalMenuItemSize.md;
      case HierarchicalMenuSize.lg:
        return HierarchicalMenuItemSize.lg;
    }
  }

  double get _defaultWidth {
    switch (widget.size) {
      case HierarchicalMenuSize.sm:
        return 200.0;
      case HierarchicalMenuSize.md:
        return 300.0;
      case HierarchicalMenuSize.lg:
        return 400.0;
    }
  }

  EdgeInsets get _padding {
    switch (widget.size) {
      case HierarchicalMenuSize.sm:
        return EdgeInsets.all(GardenSpace.paddingSm);
      case HierarchicalMenuSize.md:
        return EdgeInsets.all(GardenSpace.paddingMd);
      case HierarchicalMenuSize.lg:
        return EdgeInsets.all(GardenSpace.paddingLg);
    }
  }

  void _handleItemExpansionChanged(HierarchicalMenuItem item) {
    setState(() {
      _items = _updateItemInTree(_items, item);
    });

    final controller = _itemControllers[item.id];
    if (controller != null) {
      if (item.isExpanded) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }

    widget.onItemExpansionChanged?.call(item);
  }

  void _handleItemTapped(HierarchicalMenuItem item) {
    widget.onItemSelected?.call(item);
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

  List<Widget> _buildMenuItems(List<HierarchicalMenuItem> items) {
    final widgets = <Widget>[];

    for (final item in items) {
      // Ajouter l'élément principal
      widgets.add(
        HierarchicalMenuItemWidget(
          item: item,
          size: _itemSize,
          isSelected: item.id == widget.selectedItemId,
          onExpansionChanged: _handleItemExpansionChanged,
          onItemTapped: _handleItemTapped,
        ),
      );

      // Ajouter les enfants avec animation si l'élément est expandé
      if (item.hasChildren) {
        final animation = _itemAnimations[item.id];
        if (animation != null) {
          widgets.add(
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return ClipRect(
                  child: Align(heightFactor: animation.value, child: child),
                );
              },
              child: Column(
                children: [
                  SizedBox(height: GardenSpace.paddingXs),
                  ..._buildMenuItems(item.children),
                ],
              ),
            ),
          );
        }
      }

      // Espacement entre les éléments
      if (item != items.last) {
        widgets.add(SizedBox(height: GardenSpace.paddingXs));
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.maxWidth ?? _defaultWidth,
      height: widget.maxHeight,
      decoration: BoxDecoration(
        color: GardenColors.base.shade50,
        borderRadius: GardenRadius.radiusMd,
        border: Border.all(color: GardenColors.base.shade200, width: 1),
        boxShadow: GardenShadow.shadowMd,
      ),
      child: SingleChildScrollView(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _buildMenuItems(_items),
        ),
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Default', type: HierarchicalMenu)
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
        children: [
          HierarchicalMenuItem(
            id: '1.1',
            title: 'Zone A',
            subtitle: '22°C - 70%',
            level: 2,
            children: [
              HierarchicalMenuItem(
                id: '1.1.1',
                title: 'Capteur température',
                level: 3,
                alertType: MenuAlertType.error,
              ),
              HierarchicalMenuItem(
                id: '1.1.2',
                title: 'Capteur humidité',
                level: 3,
              ),
            ],
          ),
          HierarchicalMenuItem(
            id: '1.2',
            title: 'Zone B',
            subtitle: '26°C - 60%',
            level: 2,
          ),
        ],
      ),
      HierarchicalMenuItem(
        id: '2',
        title: 'Serre secondaire',
        subtitle: '20°C - 55%',
        icon: Icons.business,
        level: 1,
        children: [
          HierarchicalMenuItem(id: '2.1', title: 'Zone unique', level: 2),
        ],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Large Size', type: HierarchicalMenu)
Widget hierarchicalMenuLargeUseCase(BuildContext context) {
  return HierarchicalMenu(
    size: HierarchicalMenuSize.lg,
    items: [
      HierarchicalMenuItem(
        id: '1',
        title: 'Serre principale',
        subtitle: '24°C - 65%',
        icon: Icons.home,
        level: 1,
        isExpanded: true,
        alertType: MenuAlertType.warning,
        children: [
          HierarchicalMenuItem(
            id: '1.1',
            title: 'Zone A',
            subtitle: '22°C - 70%',
            level: 2,
            isExpanded: true,
            children: [
              HierarchicalMenuItem(
                id: '1.1.1',
                title: 'Système irrigation',
                level: 3,
                children: [
                  HierarchicalMenuItem(
                    id: '1.1.1.1',
                    title: 'Pompe principale',
                    level: 4,
                    children: [
                      HierarchicalMenuItem(
                        id: '1.1.1.1.1',
                        title: 'Capteur débit',
                        level: 5,
                        alertType: MenuAlertType.error,
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
