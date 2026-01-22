/// Analytic type enum for the Garden UI library.
library;

import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';

enum AnalyticsSummaryFilter {
  light,
  airTemperature,
  soilTemperature,
  airHumidity,
  soilHumidity,
  deepSoilHumidity;

  String get iconName {
    switch (this) {
      case AnalyticsSummaryFilter.airHumidity:
        return 'Pluie';
      case AnalyticsSummaryFilter.soilHumidity:
        return 'Humidite_surface';
      case AnalyticsSummaryFilter.deepSoilHumidity:
        return 'Humidite_profondeur';
      case AnalyticsSummaryFilter.airTemperature:
      case AnalyticsSummaryFilter.soilTemperature:
        return 'Thermometre';
      case AnalyticsSummaryFilter.light:
        return 'Soleil';
    }
  }

  Color get iconColor {
    switch (this) {
      case AnalyticsSummaryFilter.airHumidity:
      case AnalyticsSummaryFilter.soilHumidity:
      case AnalyticsSummaryFilter.deepSoilHumidity:
        return GardenColors.blueInfo.shade400;
      case AnalyticsSummaryFilter.airTemperature:
        return GardenColors.redAlert.shade500;
      case AnalyticsSummaryFilter.soilTemperature:
        return Colors.brown;
      case AnalyticsSummaryFilter.light:
        return GardenColors.yellowWarning.shade500;
    }
  }

  String get unit {
    switch (this) {
      case AnalyticsSummaryFilter.airHumidity:
      case AnalyticsSummaryFilter.soilHumidity:
      case AnalyticsSummaryFilter.deepSoilHumidity:
        return '%';
      case AnalyticsSummaryFilter.airTemperature:
      case AnalyticsSummaryFilter.soilTemperature:
        return '°C';
      case AnalyticsSummaryFilter.light:
        return 'lux';
    }
  }
}
