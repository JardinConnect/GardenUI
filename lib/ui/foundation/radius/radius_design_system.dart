import 'package:flutter/widgets.dart';

class GardenRadius {
  static const radiusSizes = {'xs': 4.0, 'sm': 8.0, 'md': 12.0, 'lg': 16.0};

  static final radiusXs = BorderRadius.circular(radiusSizes['xs']!);
  static final radiusSm = BorderRadius.circular(radiusSizes['sm']!);
  static final radiusMd = BorderRadius.circular(radiusSizes['md']!);
  static final radiusLg = BorderRadius.circular(radiusSizes['lg']!);
}
