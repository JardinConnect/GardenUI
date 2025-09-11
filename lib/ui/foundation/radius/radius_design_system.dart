import 'package:flutter/widgets.dart';

class GardenRadius {
  static const radiusSizes = {'xs': 4.0, 'sm': 8.0, 'md': 12.0, 'lg': 16.0};

  static final radiusXs = BorderRadiusGeometry.circular(radiusSizes['xs']!);
  static final radiusSm = BorderRadiusGeometry.circular(radiusSizes['sm']!);
  static final radiusMd = BorderRadiusGeometry.circular(radiusSizes['md']!);
  static final radiusLg = BorderRadiusGeometry.circular(radiusSizes['lg']!);
}
