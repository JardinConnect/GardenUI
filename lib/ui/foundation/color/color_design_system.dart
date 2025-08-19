import 'package:flutter/material.dart';

class GardenColors extends ColorSwatch<int> {
  const GardenColors._(super.primary, super.swatch);

  static const GardenColors typography =
      GardenColors._(0xFFe6e6ec, <int, Color>{
        50: Color(0xFFe6e6ec),
        100: Color(0xFFb0b1c4),
        200: Color(0xFF8a8ca7),
        300: Color(0xFF55577f),
        400: Color(0xFF343666),
        500: Color(0xFF010440),
        600: Color(0xFF01043a),
        700: Color(0xFF01032d),
        800: Color(0xFF010223),
        900: Color(0xFF00021b),
      });

  static const GardenColors base = GardenColors._(0xFFfcfcfd, <int, Color>{
    50: Color(0xFFfcfcfd),
    100: Color(0xFFf4f5f8),
    200: Color(0xFFeff0f4),
    300: Color(0xFFe8eaf0),
    400: Color(0xFFe3e5ed),
    500: Color(0xFFdcdfe8),
    600: Color(0xFFc8cbd3),
    700: Color(0xFF9c9ea5),
    800: Color(0xFF797b80),
    900: Color(0xFF5c5e61),
  });

  static const GardenColors primary = GardenColors._(0xFFe6f2f4, <int, Color>{
    50: Color(0xFFe6f2f4),
    100: Color(0xFFb1d7db),
    200: Color(0xFF8bc4ca),
    300: Color(0xFF56a9b2),
    400: Color(0xFF3599a3),
    500: Color(0xFF037f8c),
    600: Color(0xFF03747f),
    700: Color(0xFF025a63),
    800: Color(0xFF02464d),
    900: Color(0xFF01353b),
  });

  static const GardenColors secondary = GardenColors._(0xFFfbf6e7, <int, Color>{
    50: Color(0xFFfbf6e7),
    100: Color(0xFFf2e2b6),
    200: Color(0xFFecd492),
    300: Color(0xFFe4c061),
    400: Color(0xFFdeb442),
    500: Color(0xFFd6a113),
    600: Color(0xFFc39311),
    700: Color(0xFF98720d),
    800: Color(0xFF76590a),
    900: Color(0xFF5a4408),
  });

  static const GardenColors tertiary = GardenColors._(0xFFeffce8, <int, Color>{
    50: Color(0xFFeffce8),
    100: Color(0xFFccf7b8),
    200: Color(0xFFb4f396),
    300: Color(0xFF91ee66),
    400: Color(0xFF7cea49),
    500: Color(0xFF5be51b),
    600: Color(0xFF53d019),
    700: Color(0xFF41a313),
    800: Color(0xFF327e0f),
    900: Color(0xFF26600b),
  });

  static const GardenColors redAlert = GardenColors._(0xFFfdebeb, <int, Color>{
    50: Color(0xFFfdebeb),
    100: Color(0xFFf8c1c1),
    200: Color(0xFFf5a3a3),
    300: Color(0xFFf07979),
    400: Color(0xFFed5f5f),
    500: Color(0xFFe93737),
    600: Color(0xFFd43232),
    700: Color(0xFFa52727),
    800: Color(0xFF801e1e),
    900: Color(0xFF621717),
  });

  static const GardenColors yellowWarning =
      GardenColors._(0xFFfdfae9, <int, Color>{
        50: Color(0xFFfdfae9),
        100: Color(0xFFf9f0b9),
        200: Color(0xFFf7e898),
        300: Color(0xFFf3de68),
        400: Color(0xFFf1d84b),
        500: Color(0xFFedce1e),
        600: Color(0xFFd8bb1b),
        700: Color(0xFFa89215),
        800: Color(0xFF827111),
        900: Color(0xFF64570d),
      });

  static const GardenColors blueInfo = GardenColors._(0xFFedf2fd, <int, Color>{
    50: Color(0xFFedf2fd),
    100: Color(0xFFc7d7f8),
    200: Color(0xFFacc4f5),
    300: Color(0xFF86a9f0),
    400: Color(0xFF6e99ed),
    500: Color(0xFF4a7fe9),
    600: Color(0xFF4374d4),
    700: Color(0xFF355aa5),
    800: Color(0xFF294680),
    900: Color(0xFF1f3562),
  });

  static const GardenColors shadow =
  GardenColors._(0xFF000000, <int, Color> {
    50: Color(0xFFF5F5F5),
    100: Color(0xFFE0E0E0),
    200: Color(0xFFBDBDBD),
    300: Color(0xFF9E9E9E),
    400: Color(0xFF757575),
    500: Color(0xFF616161),
    600: Color(0xFF424242),
    700: Color(0xFF303030),
    800: Color(0xFF212121),
    900: Color(0xFF000000),
  });


  Color get shade50 => this[50]!;
  Color get shade100 => this[100]!;
  Color get shade200 => this[200]!;
  Color get shade300 => this[300]!;
  Color get shade400 => this[400]!;
  Color get shade500 => this[500]!;
  Color get shade600 => this[600]!;
  Color get shade700 => this[700]!;
  Color get shade800 => this[800]!;
  Color get shade900 => this[900]!;
}
