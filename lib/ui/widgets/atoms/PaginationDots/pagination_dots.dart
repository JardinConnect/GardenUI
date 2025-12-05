import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';

/// Interactive dot indicators for pagination.
///
/// This component displays a row of dots representing pages, with the active
/// page highlighted. Dots are interactive and can be tapped to navigate.
class PaginationDots extends StatelessWidget {
  /// The total number of dots to display.
  final int totalDots;

  /// The index of the currently active dot (0-based).
  final int activeIndex;

  /// Callback when a dot is tapped, receiving the tapped dot's index.
  final ValueChanged<int> onDotTapped;

  const PaginationDots({
    super.key,
    required this.totalDots,
    required this.activeIndex,
    required this.onDotTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalDots, (index) {
        final isActive = index == activeIndex;
        return GestureDetector(
          onTap: () => onDotTapped(index),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: GardenSpace.gapXs / 2),
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? GardenColors.base.shade700 : Colors.transparent,
              border: Border.all(color: GardenColors.base.shade700, width: 1.0),
            ),
          ),
        );
      }),
    );
  }
}
