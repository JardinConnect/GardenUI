import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';

/// A simple card container with optional shadow and border.
///
/// This component provides a consistent card design with configurable
/// visual properties for shadow and border. Perfect for displaying
/// grouped content with consistent styling.
class GardenCard extends StatefulWidget {
  /// The content to display inside the card.
  final Widget child;

  /// Whether to apply a shadow to the card.
  final bool hasShadow;

  /// Whether to apply a border to the card.
  final bool hasBorder;

  final Color? backgroundColor;

  /// Optional tap callback. If provided, the card becomes clickable.
  final VoidCallback? onTap;

  const GardenCard({
    super.key,
    required this.child,
    this.hasShadow = true,
    this.hasBorder = true,
    this.backgroundColor,
    this.onTap,
  });

  @override
  State<GardenCard> createState() => _GardenCardState();
}

class _GardenCardState extends State<GardenCard> {
  bool _isHovered = false;

  List<BoxShadow>? get _boxShadow {
    if (!widget.hasShadow) return null;
    return _isHovered && widget.onTap != null
        ? GardenShadow.shadowMd
        : GardenShadow.shadowSm;
  }

  Border? get _border {
    return widget.hasBorder
        ? Border.all(color: GardenColors.base.shade300, width: 1.0)
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      onEnter: widget.onTap != null
          ? (_) => setState(() => _isHovered = true)
          : null,
      onExit: widget.onTap != null
          ? (_) => setState(() => _isHovered = false)
          : null,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: EdgeInsets.all(GardenSpace.paddingMd),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? GardenColors.base.shade50,
            borderRadius: GardenRadius.radiusMd,
            boxShadow: _boxShadow,
            border: _border,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
