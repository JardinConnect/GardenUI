import 'package:flutter/widgets.dart';
import 'package:widgetbook_workspace/ui/foundation/radius/radius_design_system.dart';

import '../color/color_design_system.dart';

class GardenShadow {
  static final shadowSm = [
    BoxShadow(
      color: GardenColors.base.shade900.withValues(alpha: 0.2),
      blurRadius: GardenRadius.radiusSizes['xs']!,
      offset: Offset(0, 2),
    ),
  ];

  static final shadowMd = [
    BoxShadow(
      color: GardenColors.base.shade900.withValues(alpha: 0.25),
      blurRadius: GardenRadius.radiusSizes['sm']!,
      offset: Offset(0, 4),
    ),
  ];

  static final shadowLg = [
    BoxShadow(
      color: GardenColors.base.shade900.withValues(alpha: 0.50),
      blurRadius: GardenRadius.radiusSizes['lg']!,
      offset: Offset(0, 8),
    ),
  ];
}
