import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';
import 'package:garden_ui/ui/models/hierarchical_menu_item.dart';
import 'package:garden_ui/ui/widgets/atoms/AlertIndicator/alert_indicator.dart';
import 'package:garden_ui/ui/widgets/atoms/LevelIndicator/level_indicator.dart';

enum HierarchicalMenuItemSize { sm, md, lg }

/// A hierarchical menu item widget with expandable/collapsible functionality.
///
/// This widget displays a single item in a hierarchical menu structure with support
/// for multiple levels, icons, alerts, and expansion/collapse animations.
class HierarchicalMenuItemWidget extends StatefulWidget {
  final HierarchicalMenuItem item;
  final HierarchicalMenuItemSize size;
  final bool isSelected;
  final ValueChanged<HierarchicalMenuItem>? onExpansionChanged;
  final ValueChanged<HierarchicalMenuItem>? onItemTapped;

  const HierarchicalMenuItemWidget({
    super.key,
    required this.item,
    this.size = HierarchicalMenuItemSize.md,
    this.isSelected = false,
    this.onExpansionChanged,
    this.onItemTapped,
  });

  @override
  State<HierarchicalMenuItemWidget> createState() =>
      _HierarchicalMenuItemWidgetState();
}

class _HierarchicalMenuItemWidgetState extends State<HierarchicalMenuItemWidget>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: -0.5, end: 0.0).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.easeInOut),
    );

    if (widget.item.isExpanded) {
      _rotationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(HierarchicalMenuItemWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.item.isExpanded != oldWidget.item.isExpanded) {
      if (widget.item.isExpanded) {
        _rotationController.forward();
      } else {
        _rotationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  EdgeInsets get _padding {
    switch (widget.size) {
      case HierarchicalMenuItemSize.sm:
        return EdgeInsets.symmetric(
          horizontal: GardenSpace.paddingSm,
          vertical: GardenSpace.paddingXs,
        );
      case HierarchicalMenuItemSize.md:
        return EdgeInsets.symmetric(
          horizontal: GardenSpace.paddingMd,
          vertical: GardenSpace.paddingSm,
        );
      case HierarchicalMenuItemSize.lg:
        return EdgeInsets.symmetric(
          horizontal: GardenSpace.paddingLg,
          vertical: GardenSpace.paddingMd,
        );
    }
  }

  double get _leftIndent {
    return (widget.item.level - 1) * GardenSpace.hierarchicalIndentPerLevel;
  }

  TextStyle get _titleStyle {
    switch (widget.size) {
      case HierarchicalMenuItemSize.sm:
        return GardenTypography.bodyMd.copyWith(
          color: widget.isSelected
              ? GardenColors.primary.shade500
              : GardenColors.typography.shade700,
          fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.w500,
        );
      case HierarchicalMenuItemSize.md:
        return GardenTypography.bodyLg.copyWith(
          color: widget.isSelected
              ? GardenColors.primary.shade500
              : GardenColors.typography.shade700,
          fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.w500,
        );
      case HierarchicalMenuItemSize.lg:
        return GardenTypography.headingSm.copyWith(
          color: widget.isSelected
              ? GardenColors.primary.shade500
              : GardenColors.typography.shade700,
          fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.w500,
        );
    }
  }

  TextStyle get _subtitleStyle {
    switch (widget.size) {
      case HierarchicalMenuItemSize.sm:
      case HierarchicalMenuItemSize.md:
        return GardenTypography.caption.copyWith(
          color: GardenColors.typography.shade400,
        );
      case HierarchicalMenuItemSize.lg:
        return GardenTypography.bodyMd.copyWith(
          color: GardenColors.typography.shade400,
        );
    }
  }

  Color get _backgroundColor {
    if (widget.isSelected) {
      return GardenColors.primary.shade50;
    } else if (_isHovered) {
      return GardenColors.base.shade100;
    } else {
      return Colors.transparent;
    }
  }

  void _handleTap() {
    if (widget.item.hasChildren) {
      final updatedItem = widget.item.copyWith(
        isExpanded: !widget.item.isExpanded,
      );
      widget.onExpansionChanged?.call(updatedItem);
    }
    widget.onItemTapped?.call(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _handleTap,
        child: Container(
          padding: _padding,
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: GardenRadius.radiusSm,
            border: widget.isSelected
                ? Border.all(color: GardenColors.primary.shade200, width: 1)
                : null,
          ),
          child: Row(
            children: [
              // Indentation for levels
              SizedBox(width: _leftIndent),

              // Level indicator
              LevelIndicator(
                level: widget.item.level,
                size: widget.size == HierarchicalMenuItemSize.sm
                    ? LevelIndicatorSize.sm
                    : widget.size == HierarchicalMenuItemSize.lg
                    ? LevelIndicatorSize.lg
                    : LevelIndicatorSize.md,
              ),

              SizedBox(width: GardenSpace.paddingSm),

              // Main icon (optional)
              if (widget.item.icon != null) ...[
                Icon(
                  widget.item.icon,
                  size: widget.size == HierarchicalMenuItemSize.sm
                      ? GardenSpace.iconSizeSm
                      : GardenSpace.iconSizeMd,
                  color: widget.isSelected
                      ? GardenColors.primary.shade500
                      : GardenColors.typography.shade500,
                ),
                SizedBox(width: GardenSpace.paddingSm),
              ],

              // Main content
              Expanded(
                child: Padding(
                  padding: _padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.item.title,
                        style: _titleStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (widget.item.subtitle != null) ...[
                        SizedBox(height: GardenSpace.gapXs / 2),
                        Text(
                          widget.item.subtitle!,
                          style: _subtitleStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              // Alert indicator
              AlertIndicator(
                alertType: widget.item.alertType,
                size: widget.size == HierarchicalMenuItemSize.sm
                    ? AlertIndicatorSize.sm
                    : widget.size == HierarchicalMenuItemSize.lg
                    ? AlertIndicatorSize.lg
                    : AlertIndicatorSize.md,
              ),

              SizedBox(width: GardenSpace.paddingSm),

              // Chevron for items with children
              if (widget.item.hasChildren)
                AnimatedBuilder(
                  animation: _rotationAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotationAnimation.value * math.pi,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: widget.size == HierarchicalMenuItemSize.sm
                            ? GardenSpace.iconSizeSm
                            : GardenSpace.iconSizeMd,
                        color: GardenColors.typography.shade400,
                      ),
                    );
                  },
                )
              else
                SizedBox(
                  width: widget.size == HierarchicalMenuItemSize.sm
                      ? GardenSpace.iconSizeSm
                      : GardenSpace.iconSizeMd,
                ),

              SizedBox(width: GardenSpace.paddingSm),
            ],
          ),
        ),
      ),
    );
  }
}
