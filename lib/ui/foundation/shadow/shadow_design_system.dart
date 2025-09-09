import 'package:flutter/widgets.dart';

import '../color/color_design_system.dart';

class GardenShadow {
  static final shadowSm = [
    BoxShadow(
      color: GardenColors.base.shade900.withValues(alpha: 0.2),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  static final shadowMd = [
    BoxShadow(
      color: GardenColors.base.shade900.withValues(alpha: 0.25),
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ];

  static final shadowLg = [
    BoxShadow(
      color: GardenColors.base.shade900.withValues(alpha: 0.50),
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];
}
