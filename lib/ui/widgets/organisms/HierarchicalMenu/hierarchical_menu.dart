import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';
import 'package:garden_ui/ui/enums.dart';
import 'package:garden_ui/ui/internal/constants.dart';
import 'package:garden_ui/ui/models/hierarchical_menu_item.dart';
import 'package:garden_ui/ui/widgets/molecules/HierarchicalMenuItem/hierarchical_menu_item.dart';

/// Multi-level vertical hierarchical menu
///
/// Component for displaying a vertical list of expandable/collapsible
/// items with up to 5 levels of depth
class HierarchicalMenu extends StatefulWidget {
  /// List of root menu items
  final List<HierarchicalMenuItem> items;

  /// Menu size
  final HierarchicalMenuSize size;

  /// ID of the selected item
  final String? selectedItemId;

  /// Callback called when an item is selected
  final ValueChanged<HierarchicalMenuItem>? onItemSelected;

  /// Callback called when expansion state changes
  final ValueChanged<HierarchicalMenuItem>? onItemExpansionChanged;

  /// Maximum width of the menu (optional)
  final double? maxWidth;

  /// Maximum height of the menu (optional)
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
  late Map<String, bool> _expansionState;
  late AnimationController _expansionController;
  final Map<String, AnimationController> _itemControllers = {};
  final Map<String, Animation<double>> _itemAnimations = {};

  @override
  void initState() {
    super.initState();
    _expansionState = {};
    _initializeExpansionState(widget.items);
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
      _initializeExpansionState(widget.items);
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

  void _initializeExpansionState(List<HierarchicalMenuItem> items) {
    for (final item in items) {
      _expansionState[item.id] ??= item.isExpanded;

      if (item.hasChildren) {
        _initializeExpansionState(item.children);
      }
    }
  }

  void _initializeAnimations() {
    // Clean up old controllers
    for (final controller in _itemControllers.values) {
      controller.dispose();
    }
    _itemControllers.clear();
    _itemAnimations.clear();

    _createAnimationsForItems(widget.items);
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

        if (_expansionState[item.id] == true) {
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
        return InternalConstants.menuWidthSm;
      case HierarchicalMenuSize.md:
        return InternalConstants.menuWidthMd;
      case HierarchicalMenuSize.lg:
        return InternalConstants.menuWidthLg;
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
      final currentState = _expansionState[item.id] ?? false;
      _expansionState[item.id] = !currentState;
    });

    final controller = _itemControllers[item.id];
    if (controller != null) {
      if (_expansionState[item.id] == true) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }

    final updatedItem = item.copyWith(isExpanded: _expansionState[item.id]);
    widget.onItemExpansionChanged?.call(updatedItem);
  }

  void _handleItemTapped(HierarchicalMenuItem item) {
    widget.onItemSelected?.call(item);
  }

  List<Widget> _buildMenuItems(List<HierarchicalMenuItem> items) {
    final widgets = <Widget>[];

    for (final item in items) {
      final isExpanded = _expansionState[item.id] ?? false;

      final itemWithState = item.copyWith(isExpanded: isExpanded);

      // Add the main item
      widgets.add(
        HierarchicalMenuItemWidget(
          item: itemWithState,
          size: _itemSize,
          isSelected: item.id == widget.selectedItemId,
          onExpansionChanged: _handleItemExpansionChanged,
          onItemTapped: _handleItemTapped,
        ),
      );

      // Add children with animation if the item is expanded
      if (item.hasChildren && isExpanded) {
        final animation = _itemAnimations[item.id];
        if (animation != null) {
          widgets.add(
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: animation.value,
                    child: child,
                  ),
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

      // Spacing between items
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
          children: _buildMenuItems(widget.items),
        ),
      ),
    );
  }
}