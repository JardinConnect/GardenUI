import 'package:flutter/material.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';

/// A card displaying sensor alert thresholds with toggle and pagination.
///
/// This organism displays the maximum and minimum threshold values for an
/// environmental sensor, along with alert indicators, an enable/disable toggle,
/// and pagination dots for navigating between multiple sensors or views.
class SensorAlertCard extends StatelessWidget {
  /// The type of sensor being displayed.
  final SensorType sensorType;

  /// The threshold values and alert types for this sensor.
  final SensorThreshold threshold;

  /// Whether the alert is currently enabled.
  final bool isEnabled;

  /// Callback when the toggle is switched.
  final ValueChanged<bool> onToggle;

  /// The total number of pages/sensors.
  final int totalPages;

  /// The current page index (0-based).
  final int currentPage;

  /// Callback when a page dot is tapped.
  final ValueChanged<int> onPageChanged;

  const SensorAlertCard({
    super.key,
    required this.sensorType,
    required this.threshold,
    required this.isEnabled,
    required this.onToggle,
    required this.totalPages,
    required this.currentPage,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GardenCard(
      hasShadow: true,
      hasBorder: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header: Title and Toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Alerte ${sensorType.displayName}',
                style: GardenTypography.bodyLg.copyWith(
                  color: GardenColors.typography.shade900,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GardenToggle(isEnabled: isEnabled, onToggle: onToggle),
            ],
          ),
          SizedBox(height: GardenSpace.gapMd),

          // Divider
          Divider(thickness: 1, color: GardenColors.base.shade300, height: 1),
          SizedBox(height: GardenSpace.gapMd),

          // Body: Icon and Thresholds (centered)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Sensor Icon
              GardenIcon(
                iconName: sensorType.iconName,
                size: GardenIconSize.lg,
                color: GardenColors.redAlert.shade500,
              ),
              SizedBox(width: GardenSpace.gapLg),

              // Threshold values (2-column grid)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < threshold.thresholds.length; i += 2)
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _ThresholdRow(
                              thresholdValue: threshold.thresholds[i],
                            ),
                            if (i + 1 < threshold.thresholds.length) ...[
                              SizedBox(width: GardenSpace.gapLg),
                              _ThresholdRow(
                                thresholdValue: threshold.thresholds[i + 1],
                              ),
                            ],
                          ],
                        ),
                        if (i + 2 < threshold.thresholds.length)
                          SizedBox(height: GardenSpace.gapSm),
                      ],
                    ),
                ],
              ),
            ],
          ),
          SizedBox(height: GardenSpace.gapMd),

          // Divider
          Divider(thickness: 1, color: GardenColors.base.shade300, height: 1),
          SizedBox(height: GardenSpace.gapMd),

          // Footer: Pagination dots
          PaginationDots(
            totalDots: totalPages,
            activeIndex: currentPage,
            onDotTapped: onPageChanged,
          ),
        ],
      ),
    );
  }

  Color _getSensorIconColor(SensorType sensorType) {
    switch (sensorType) {
      case SensorType.temperature:
        return GardenColors.redAlert.shade500;
      case SensorType.humiditySurface:
        return GardenColors.blueInfo.shade400;
      case SensorType.humidityDepth:
        return GardenColors.blueInfo.shade600;
      case SensorType.light:
        return GardenColors.secondary.shade400;
      case SensorType.rain:
        return GardenColors.blueInfo.shade500;
    }
  }
}

/// Internal widget for displaying a threshold value row with alert indicator.
class _ThresholdRow extends StatelessWidget {
  final ThresholdValue thresholdValue;

  const _ThresholdRow({required this.thresholdValue});

  Color get _valueColor {
    switch (thresholdValue.alertType) {
      case MenuAlertType.warning:
        return GardenColors.yellowWarning.shade500;
      case MenuAlertType.error:
        return GardenColors.redAlert.shade500;
      case MenuAlertType.none:
        return GardenColors.typography.shade500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Value with unit
        Text(
          '${thresholdValue.value.toStringAsFixed(0)}${thresholdValue.unit}',
          style: GardenTypography.headingMd.copyWith(
            color: _valueColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: GardenSpace.gapXs),

        // Alert indicator and label
        Row(
          children: [
            AlertIndicator(
              alertType: thresholdValue.alertType,
              size: AlertIndicatorSize.sm,
            ),
            SizedBox(width: GardenSpace.gapXs),
            Text(
              thresholdValue.label,
              style: GardenTypography.bodyMd.copyWith(
                color: GardenColors.typography.shade500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
