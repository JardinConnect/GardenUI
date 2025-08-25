import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color/color_design_system.dart';

class GardenTypography {
  static const _sizes = {
    'caption': 10.0,
    'body-md': 13.0,
    'body-lg': 16.0,
    'heading-sm': 20.0,
    'heading-md': 25.0,
    'heading-lg': 31.0,
    'heading-xl': 39.0,
    'display-lg': 49.0,
    'display-xl': 61.0,
  };

  static TextStyle get _base => GoogleFonts.inter(fontWeight: FontWeight.w500);

  static final displayXl = _base.copyWith(
    color: GardenColors.typography.shade900,
    fontSize: _sizes['display-xl'],
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.02 * _sizes['display-xl']!,
  );

  static final displayLg = _base.copyWith(
    color: GardenColors.typography.shade800,
    fontSize: _sizes['display-lg'],
    fontWeight: FontWeight.w700,
    height: 1.22,
    letterSpacing: -0.01 * _sizes['display-lg']!,
  );

  static final headingXl = _base.copyWith(
    color: GardenColors.typography.shade700,
    fontSize: _sizes['heading-xl'],
    fontWeight: FontWeight.w600,
    height: 1.23,
    letterSpacing: -0.005 * _sizes['heading-xl']!,
  );

  static final headingLg = _base.copyWith(
    color: GardenColors.typography.shade600,
    fontSize: _sizes['heading-lg'],
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: 0,
  );

  static final headingMd = _base.copyWith(
    color: GardenColors.typography.shade600,
    fontSize: _sizes['heading-md'],
    height: 1.28,
    letterSpacing: 0,
  );

  static final headingSm = _base.copyWith(
    color: GardenColors.typography.shade500,
    fontSize: _sizes['heading-sm'],
    height: 1.4,
    letterSpacing: 0,
  );

  static final bodyLg = _base.copyWith(
    color: GardenColors.typography.shade500,
    fontSize: _sizes['body-lg'],
    height: 1.5,
    letterSpacing: 0.01 * _sizes['body-lg']!,
  );

  static final bodyMd = _base.copyWith(
    color: GardenColors.typography.shade400,
    fontSize: _sizes['body-md'],
    height: 1.54,
    letterSpacing: 0.02 * _sizes['body-md']!,
  );

  static final caption = _base.copyWith(
    color: GardenColors.typography.shade300,
    fontSize: _sizes['caption'],
    fontWeight: FontWeight.w300,
    height: 1.6,
    letterSpacing: 0.03 * _sizes['caption']!,
  );
}
