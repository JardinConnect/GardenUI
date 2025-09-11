import 'package:flutter/material.dart';
import 'package:widgetbook_workspace/ui/design_system.dart';
import 'package:widgetbook_workspace/ui/widgets/atoms/MenuIcon/menu_icon.dart';

enum MenuItemSize { sm, md, lg }

enum MenuItemSeverity { normal, danger }

class MenuItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final MenuItemSize size;
  final MenuItemSeverity severity;
  final bool isActive;
  final ValueChanged<bool>? onActiveChanged;

  const MenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.size = MenuItemSize.md,
    this.severity = MenuItemSeverity.normal,
    this.isActive = false,
    this.onActiveChanged,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _isHovered = false;
  late bool _internalActive;

  bool get _isActive =>
      widget.onActiveChanged != null ? widget.isActive : _internalActive;

  @override
  void initState() {
    super.initState();
    _internalActive = widget.isActive;
  }

  void _toggleActive() {
    if (widget.onActiveChanged != null) {
      widget.onActiveChanged!(!_isActive);
    } else {
      setState(() {
        _internalActive = !_internalActive;
      });
    }
    widget.onTap();
  }

  TextStyle get _labelSize {
    switch (widget.size) {
      case MenuItemSize.sm:
        return GardenTypography.caption;
      case MenuItemSize.md:
        return GardenTypography.bodyLg;
      case MenuItemSize.lg:
        return GardenTypography.headingSm;
    }
  }

  TextStyle get _labelStyle {
    if (_isActive) {
      return _labelSize;
    } else if (_isHovered) {
      return _labelSize.copyWith(color: GardenColors.typography.shade300);
    } else {
      return _labelSize.copyWith(color: GardenColors.typography.shade200);
    }
  }

  Color get _bgColor {
    if (_isActive || _isHovered) {
      return widget.severity == MenuItemSeverity.danger
          ? GardenColors.redAlert.shade50
          : GardenColors.primary.shade50;
    } else {
      return Colors.transparent;
    }
  }

  List<BoxShadow> get _shadow {
    if (_isActive) {
      return GardenShadow.shadowSm;
    } else if (_isHovered) {
      return GardenShadow.shadowMd;
    } else {
      return List.empty();
    }
  }

  double get _height {
    switch (widget.size) {
      case MenuItemSize.sm:
        return 32.0;
      case MenuItemSize.md:
        return 48.0;
      case MenuItemSize.lg:
        return 64.0;
    }
  }

  MenuIconSize get _iconSize {
    switch (widget.size) {
      case MenuItemSize.sm:
        return MenuIconSize.sm;
      case MenuItemSize.md:
        return MenuIconSize.md;
      case MenuItemSize.lg:
        return MenuIconSize.lg;
    }
  }

  MenuIconSeverity get _iconSeverity {
    if (widget.severity == MenuItemSeverity.danger) {
      return MenuIconSeverity.danger;
    } else {
      return MenuIconSeverity.normal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          _toggleActive();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          child: Container(
            height: _height,
            width: null,
            padding: EdgeInsets.only(
              top: GardenSpace.paddingSm,
              bottom: GardenSpace.paddingSm,
              right: GardenSpace.paddingMd,
              left: GardenSpace.paddingMd,
            ),
            decoration: BoxDecoration(
              color: _bgColor,
              borderRadius: GardenRadius.radiusMd,
              boxShadow: _shadow,
            ),
            child: Row(
              spacing: GardenSpace.gapMd,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: MenuIcon(
                    key: ValueKey(_isActive),
                    icon: widget.icon,
                    isActive: _isActive,
                    size: _iconSize,
                    severity: _iconSeverity,
                  ),
                ),
                Expanded(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: _labelStyle,
                    curve: Curves.easeOut,
                    child: Text(
                      widget.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
