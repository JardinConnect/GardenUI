/// Public spacing and gap constants for the Garden UI library.
///
/// This class provides the design system's spacing tokens that are intended
/// for use by external projects using the library.
class GardenSpace {
  static const _paddings = {
    'xs': 4.0,
    'sm': 8.0,
    'md': 16.0,
    'lg': 24.0,
    'xl': 32.0,
  };
  static const _gaps = {
    'xs': 4.0,
    'sm': 8.0,
    'md': 16.0,
    'lg': 24.0,
    'xl': 32.0,
  };

  static final paddingXs = _paddings['xs']!;
  static final paddingSm = _paddings['sm']!;
  static final paddingMd = _paddings['md']!;
  static final paddingLg = _paddings['lg']!;
  static final paddingXl = _paddings['xl']!;

  static final gapXs = _gaps['xs']!;
  static final gapSm = _gaps['sm']!;
  static final gapMd = _gaps['md']!;
  static final gapLg = _gaps['lg']!;
  static final gapXl = _gaps['xl']!;
}
