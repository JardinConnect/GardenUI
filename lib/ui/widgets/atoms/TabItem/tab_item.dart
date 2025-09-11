import 'package:flutter/material.dart';
import 'package:widgetbook_workspace/ui/design_system.dart';
import 'package:widgetbook_workspace/ui/foundation/color/color_design_system.dart';
import 'package:widgetbook_workspace/ui/foundation/typography/typography_design_system.dart';

/// A single tab item used in [TabMenu].
///
/// This component represents a selectable tab with optional icon and
/// customizable indicator.
class TabItem extends StatelessWidget {
  /// The text label of the tab.
  final String label;

  /// Whether this tab is currently selected.
  final bool isSelected;

  /// Callback when the tab is tapped.
  final VoidCallback onTap;

  /// Optional icon to display before the label.
  final IconData? icon;

  /// The spacing between icon and label when icon is provided.
  final double iconLabelSpacing;

  /// Whether the indicator width should match the content width.
  final bool matchIndicatorToContent;

  /// Custom width for the indicator, used when [matchIndicatorToContent] is false.
  final double indicatorWidth;

  const TabItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
    this.iconLabelSpacing = 8.0,
    this.matchIndicatorToContent = true,
    this.indicatorWidth = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = GardenTypography.bodyMd.copyWith(
      color: isSelected
          ? GardenColors.typography.shade400
          : GardenColors.typography.shade100,
    );

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            color: textStyle.color,
            size: 20,
          ),
          SizedBox(width: iconLabelSpacing),
        ],
        Text(label, style: textStyle),
      ],
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Semantics(
          selected: isSelected,
          button: true,
          label: '$label tab',
          child: FocusableActionDetector(
            actions: {
              ActivateIntent: CallbackAction<ActivateIntent>(
                onInvoke: (intent) {
                  onTap();
                  return null;
                },
              ),
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: GardenRadius.radiusSm,
                color: isSelected ? GardenColors.base.shade200 : Colors.transparent,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: GardenSpace.paddingMd,
                  vertical: GardenSpace.paddingXs,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    content
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Calculates the approximate width of the content.
  double _getContentWidth(Row content, TextStyle textStyle) {
    final textWidth = _textSize(label, textStyle).width;
    if (icon != null) {
      // Approximation for icon + spacing + text
      return textWidth + 20 + iconLabelSpacing;
    }
    return textWidth;
  }

  /// Helper method to calculate text dimensions.
  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
