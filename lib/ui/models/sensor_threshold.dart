import 'package:garden_ui/ui/components.dart';

/// Model representing sensor alert thresholds.
///
/// This model contains a flexible list of threshold values for a sensor,
/// allowing for 2, 3, or more threshold levels.
class SensorThreshold {
  /// The list of threshold values for this sensor.
  final List<ThresholdValue> thresholds;

  const SensorThreshold({required this.thresholds});
}
