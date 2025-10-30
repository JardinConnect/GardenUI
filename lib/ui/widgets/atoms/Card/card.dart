import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';

class GardenCard extends StatelessWidget {
  final Widget child;

  final bool hasShadow;

  final bool hasBorder;

  const GardenCard({
    super.key,
    required this.child,
    this.hasShadow = true,
    this.hasBorder = false,
  });

  List<BoxShadow>? get _boxShadow {
    return hasShadow ? GardenShadow.shadowMd : null;
  }

  Border? get _border {
    return hasBorder
        ? Border.all(
            color: GardenColors.base.shade300,
            width: 1.0,
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(GardenSpace.paddingMd),
      decoration: BoxDecoration(
        color: GardenColors.base.shade50,
        borderRadius: GardenRadius.radiusMd,
        boxShadow: _boxShadow,
        border: _border,
      ),
      child: child,
    );
  }
}

