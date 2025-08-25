import 'package:flutter/widgets.dart';

class GardenRadius {
  static const _radius = {'xs': 4.0, 'sm': 8.0, 'md': 12.0, 'lg': 16.0};

  static final radiusXs = BorderRadiusGeometry.circular(_radius['xs']!);
  static final radiusSm = BorderRadiusGeometry.circular(_radius['sm']!);
  static final radiusMd = BorderRadiusGeometry.circular(_radius['md']!);
  static final radiusLg = BorderRadiusGeometry.circular(_radius['lg']!);
}
