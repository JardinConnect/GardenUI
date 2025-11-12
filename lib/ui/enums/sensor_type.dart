/// Sensor type enum for the Garden UI library.
///
/// This enum defines the different types of environmental sensors
/// that can be displayed in sensor-related components.
library;

/// Types of environmental sensors
enum SensorType {
  /// Temperature sensor
  temperature,

  /// Surface humidity sensor
  humiditySurface,

  /// Depth/soil humidity sensor
  humidityDepth,

  /// Light/sun sensor
  light,

  /// Rain sensor
  rain,
}

/// Extension on SensorType to provide display names and icon mappings
extension SensorTypeExtension on SensorType {
  /// Returns the display name for the sensor type in French
  String get displayName {
    switch (this) {
      case SensorType.temperature:
        return 'température';
      case SensorType.humiditySurface:
        return 'humidité surface';
      case SensorType.humidityDepth:
        return 'humidité profondeur';
      case SensorType.light:
        return 'luminosité';
      case SensorType.rain:
        return 'pluie';
    }
  }

  /// Returns the icon name to use with GardenIcon
  String get iconName {
    switch (this) {
      case SensorType.temperature:
        return 'Thermometre';
      case SensorType.humiditySurface:
        return 'Humidite_surface';
      case SensorType.humidityDepth:
        return 'Humidite_profondeur';
      case SensorType.light:
        return 'Soleil';
      case SensorType.rain:
        return 'Pluie';
    }
  }
}
