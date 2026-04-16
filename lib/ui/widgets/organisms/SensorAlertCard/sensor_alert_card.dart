import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';

/// Données d'une page capteur affichée dans la carte.
typedef SensorPageData = ({
  SensorType sensorType,
  SensorThreshold threshold,
  Color iconColor,
});

/// A card displaying sensor alert thresholds with toggle and pagination.
///
/// This organism displays the maximum and minimum threshold values for an
/// environmental sensor, along with alert indicators, an enable/disable toggle,
/// and pagination dots for navigating between multiple sensors or views.
class SensorAlertCard extends StatefulWidget {
  /// The title of the card
  final String title;

  /// List of sensor pages to display.
  final List<SensorPageData> sensors;

  /// Whether the alert is currently enabled.
  final bool isEnabled;

  /// Callback when the toggle is switched.
  final ValueChanged<bool> onToggle;

  /// Whether to show prev/next arrow buttons around the pagination dots.
  final bool showArrows;

  /// Optional callback when the card is tapped.
  final VoidCallback? onTap;

  const SensorAlertCard({
    super.key,
    required this.title,
    required this.sensors,
    required this.isEnabled,
    required this.onToggle,
    this.showArrows = true,
    this.onTap,
  });

  @override
  State<SensorAlertCard> createState() => _SensorAlertCardState();
}

class _SensorAlertCardState extends State<SensorAlertCard> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalPages = widget.sensors.length;

    return GardenCard(
      hasShadow: true,
      hasBorder: false,
      onTap: widget.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header: Title and Toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Tooltip(
                  message: widget.title,
                  child: Text(
                    widget.title,
                    style: GardenTypography.bodyLg.copyWith(
                      color: GardenColors.typography.shade900,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              GardenToggle(
                enabledIcon: Icons.check,
                isEnabled: widget.isEnabled,
                onToggle: widget.onToggle,
              ),
            ],
          ),
          SizedBox(height: GardenSpace.gapMd),

          // Divider
          Divider(thickness: 1, color: GardenColors.base.shade300, height: 1),
          SizedBox(height: GardenSpace.gapMd),

          // Body swipeable via PageView
          SizedBox(
            height: 120,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: PageView.builder(
                controller: _pageController,
                itemCount: totalPages,
                onPageChanged: (page) => setState(() => _currentPage = page),
                itemBuilder: (context, index) {
                  final sensor = widget.sensors[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GardenIcon(
                        iconName: sensor.sensorType.iconName,
                        size: GardenIconSize.lg,
                        color: sensor.iconColor,
                      ),
                      SizedBox(width: GardenSpace.gapLg),
                      if (sensor.threshold.thresholds.length <= 2)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0;
                                i < sensor.threshold.thresholds.length;
                                i++) ...[
                              _ThresholdRow(
                                thresholdValue: sensor.threshold.thresholds[i],
                              ),
                              if (i < sensor.threshold.thresholds.length - 1)
                                SizedBox(height: GardenSpace.gapSm),
                            ],
                          ],
                        )
                      else
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0;
                                i < sensor.threshold.thresholds.length;
                                i += 2)
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _ThresholdRow(
                                        thresholdValue:
                                            sensor.threshold.thresholds[i],
                                      ),
                                      if (i + 1 <
                                          sensor.threshold.thresholds
                                              .length) ...[
                                        SizedBox(width: GardenSpace.gapLg),
                                        _ThresholdRow(
                                          thresholdValue: sensor
                                              .threshold.thresholds[i + 1],
                                        ),
                                      ],
                                    ],
                                  ),
                                  if (i + 2 <
                                      sensor.threshold.thresholds.length)
                                    SizedBox(height: GardenSpace.gapSm),
                                ],
                              ),
                          ],
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
          SizedBox(height: GardenSpace.gapMd),

          // Divider
          Divider(thickness: 1, color: GardenColors.base.shade300, height: 1),
          SizedBox(height: GardenSpace.gapMd),

          // Footer: flèches (optionnelles) + pagination dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.showArrows) ...[
                IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    color: _currentPage > 0
                        ? GardenColors.typography.shade600
                        : GardenColors.base.shade300,
                  ),
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: _currentPage > 0
                      ? () => _goToPage(_currentPage - 1)
                      : null,
                ),
                SizedBox(width: GardenSpace.gapSm),
              ],
              PaginationDots(
                totalDots: totalPages,
                activeIndex: _currentPage,
                onDotTapped: _goToPage,
              ),
              if (widget.showArrows) ...[
                SizedBox(width: GardenSpace.gapSm),
                IconButton(
                  icon: Icon(
                    Icons.chevron_right,
                    color: _currentPage < totalPages - 1
                        ? GardenColors.typography.shade600
                        : GardenColors.base.shade300,
                  ),
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: _currentPage < totalPages - 1
                      ? () => _goToPage(_currentPage + 1)
                      : null,
                ),
              ],
            ],
          ),
        ],
      ),
    );
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
