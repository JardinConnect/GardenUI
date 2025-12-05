import 'package:garden_ui/ui/enums.dart';

/// Model representing a single threshold value for a sensor.
///
/// This model contains a threshold value with its unit, label, and alert type.
class ThresholdValue {
  /// The threshold value.
  final double value;

  /// The unit of measurement (e.g., '°C', '%', 'lux').
  final String unit;

  /// The label describing this threshold (e.g., 'maximale', 'minimale', 'optimale').
  final String label;

  /// The alert type for this threshold.
  final MenuAlertType alertType;

  const ThresholdValue({
    required this.value,
    required this.unit,
    required this.label,
    required this.alertType,
  });
}
