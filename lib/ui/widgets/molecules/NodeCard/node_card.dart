import 'package:flutter/material.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';

/// A card displaying the status and sensor data of a specific node.
///
/// This component presents key metrics such as light, rain, humidity (surface/depth),
/// and temperature (surface/depth) in a grid layout. It also displays the node's name
/// and battery level. The card is interactive and can trigger an action when tapped.
class NodeCard extends StatelessWidget {
  /// The display name of the node.
  final String name;

  /// The current battery level of the node in percentage (0-100).
  final int batteryPercentage;

  /// Callback function executed when the card is tapped.
  final VoidCallback onPressed;

  /// Light intensity value in Lux.
  final int light;

  /// Rain intensity in percentage (0-100).
  final int rain;

  /// Surface soil humidity in percentage (0-100).
  final int humiditySurface;

  /// Deep soil humidity in percentage (0-100).
  final int humidityDepth;

  /// Surface temperature in degrees Celsius.
  final double temperatureSurface;

  /// Deep soil temperature in degrees Celsius.
  final double temperatureDepth;

  const NodeCard({
    super.key,
    required this.name,
    required this.batteryPercentage,
    required this.onPressed,
    required this.light,
    required this.rain,
    required this.humiditySurface,
    required this.humidityDepth,
    required this.temperatureSurface,
    required this.temperatureDepth,
  });

  @override
  Widget build(BuildContext context) {
    final fillTemperatureSurfacePercentage = (100 * temperatureSurface / 40)
        .clamp(0.0, 100.0);
    final fillTemperatureDepthPercentage = (100 * temperatureDepth / 40).clamp(
      0.0,
      100.0,
    );
    final fillLightPercentage = (100 * light / 50000).clamp(0.0, 100.0);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: GardenCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(name, style: GardenTypography.headingSm),
                  BatteryIndicator(
                    batteryPercentage: batteryPercentage,
                    size: BatteryIndicatorSize.sm,
                  ),
                ],
              ),

              SizedBox(height: GardenSpace.gapSm),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _buildSensorItem(
                          iconName: "Soleil",
                          value: "${light}L",
                          fillPercentage: fillLightPercentage,
                          color: GardenColors.yellowWarning.shade500,
                        ),
                      ),
                      Expanded(
                        child: _buildSensorItem(
                          iconName: "Pluie",
                          value: "$rain%",
                          fillPercentage: rain.toDouble(),
                          color: GardenColors.blueInfo.shade400,
                        ),
                      ),
                      Expanded(
                        child: _buildSensorItem(
                          iconName: "Humidite_surface",
                          value: "$humiditySurface%",
                          fillPercentage: humiditySurface.toDouble(),
                          color: GardenColors.blueInfo.shade400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: GardenSpace.gapSm),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _buildSensorItem(
                          iconName: "Thermometre",
                          value: "$temperatureSurface°C",
                          fillPercentage: fillTemperatureSurfacePercentage,
                          color: GardenColors.redAlert.shade500,
                        ),
                      ),
                      Expanded(
                        child: _buildSensorItem(
                          iconName: "Thermometre",
                          value: "$temperatureDepth°C",
                          fillPercentage: fillTemperatureDepthPercentage,
                          color: Colors.brown,
                        ),
                      ),
                      Expanded(
                        child: _buildSensorItem(
                          iconName: "Humidite_profondeur",
                          value: "$humidityDepth%",
                          fillPercentage: humidityDepth.toDouble(),
                          color: GardenColors.blueInfo.shade400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSensorItem({
    required String iconName,
    required String value,
    required double fillPercentage,
    required Color color,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: GardenSpace.gapXs,
      children: [
        GardenIcon(
          iconName: iconName,
          fillPercentage: fillPercentage,
          color: color,
        ),
        Text(
          value,
          style: GardenTypography.bodyMd.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
