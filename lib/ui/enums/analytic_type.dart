/// Analytic type enum for the Garden UI library.
library;

import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';

enum AnalyticType {
  light,
  airTemperature,
  soilTemperature,
  airHumidity,
  soilHumidity,
  deepSoilHumidity;

  String get iconName {
    switch (this) {
      case AnalyticType.airHumidity:
        return 'Pluie';
      case AnalyticType.soilHumidity:
        return 'Humidite_surface';
      case AnalyticType.deepSoilHumidity:
        return 'Humidite_profondeur';
      case AnalyticType.airTemperature:
      case AnalyticType.soilTemperature:
        return 'Thermometre';
      case AnalyticType.light:
        return 'Soleil';
    }
  }

  Color get iconColor {
    switch (this) {
      case AnalyticType.airHumidity:
      case AnalyticType.soilHumidity:
      case AnalyticType.deepSoilHumidity:
        return GardenColors.blueInfo.shade400;
      case AnalyticType.airTemperature:
        return GardenColors.redAlert.shade500;
      case AnalyticType.soilTemperature:
        return Colors.brown;
      case AnalyticType.light:
        return GardenColors.yellowWarning.shade500;
    }
  }

  String get unit {
    switch (this) {
      case AnalyticType.airHumidity:
      case AnalyticType.soilHumidity:
      case AnalyticType.deepSoilHumidity:
        return '%';
      case AnalyticType.airTemperature:
      case AnalyticType.soilTemperature:
        return '°C';
      case AnalyticType.light:
        return 'lux';
    }
  }
}