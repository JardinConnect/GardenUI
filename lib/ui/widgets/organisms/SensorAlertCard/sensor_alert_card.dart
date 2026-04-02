import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';

/// A card displaying sensor alert thresholds with toggle and pagination.
///
/// This organism displays the maximum and minimum threshold values for an
/// environmental sensor, along with alert indicators, an enable/disable toggle,
/// and pagination dots for navigating between multiple sensors or views.
class SensorAlertCard extends StatefulWidget {
  /// The title of the card
  final String title;

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

  /// Color for the sensor icon.
  final Color iconColor;

  /// Optional callback when the card is tapped.
  final VoidCallback? onTap;

  const SensorAlertCard({
    super.key,
    required this.title,
    required this.sensorType,
    required this.threshold,
    required this.isEnabled,
    required this.onToggle,
    required this.totalPages,
    required this.currentPage,
    required this.onPageChanged,
    required this.iconColor,
    this.onTap,
  });

  @override
  State<SensorAlertCard> createState() => _SensorAlertCardState();
}

class _SensorAlertCardState extends State<SensorAlertCard> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentPage);
  }

  @override
  void didUpdateWidget(SensorAlertCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Sync si le parent change la page sans swipe
    if (oldWidget.currentPage != widget.currentPage &&
        _pageController.hasClients) {
      _pageController.animateToPage(
        widget.currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Text(
                widget.title,
                style: GardenTypography.bodyLg.copyWith(
                  color: GardenColors.typography.shade900,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GardenToggle(
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
            child: GestureDetector(
              onHorizontalDragStart: (_) {},
              onHorizontalDragUpdate: (_) {},
              onHorizontalDragEnd: (_) {},
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.totalPages,
                  onPageChanged: widget.onPageChanged,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GardenIcon(
                          iconName: widget.sensorType.iconName,
                          size: GardenIconSize.lg,
                          color: widget.iconColor,
                        ),
                        SizedBox(width: GardenSpace.gapLg),
                        if (widget.threshold.thresholds.length <= 2)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (
                                var i = 0;
                                i < widget.threshold.thresholds.length;
                                i++
                              ) ...[
                                _ThresholdRow(
                                  thresholdValue:
                                      widget.threshold.thresholds[i],
                                ),
                                if (i < widget.threshold.thresholds.length - 1)
                                  SizedBox(height: GardenSpace.gapSm),
                              ],
                            ],
                          )
                        else
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (
                                var i = 0;
                                i < widget.threshold.thresholds.length;
                                i += 2
                              )
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _ThresholdRow(
                                          thresholdValue:
                                              widget.threshold.thresholds[i],
                                        ),
                                        if (i + 1 <
                                            widget
                                                .threshold
                                                .thresholds
                                                .length) ...[
                                          SizedBox(width: GardenSpace.gapLg),
                                          _ThresholdRow(
                                            thresholdValue: widget
                                                .threshold
                                                .thresholds[i + 1],
                                          ),
                                        ],
                                      ],
                                    ),
                                    if (i + 2 <
                                        widget.threshold.thresholds.length)
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
          ),
          SizedBox(height: GardenSpace.gapMd),

          // Divider
          Divider(thickness: 1, color: GardenColors.base.shade300, height: 1),
          SizedBox(height: GardenSpace.gapMd),

          // Footer: Pagination dots (cliquables + sync avec swipe)
          PaginationDots(
            totalDots: widget.totalPages,
            activeIndex: widget.currentPage,
            onDotTapped: (page) {
              _pageController.animateToPage(
                page,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              widget.onPageChanged(page);
            },
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
