import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';
import 'package:garden_ui/ui/enums.dart';

/// An icon indicator for notifications with customizable severity and size.
///
/// This component displays a notification icon with colors and styling
/// based on the severity level (alert, info, success, warning).
class NotificationIcon extends StatelessWidget {
  /// The severity level affecting the icon's color.
  final NotificationIconSeverity severity;

  /// The size of the notification icon.
  final NotificationSize size;

  const NotificationIcon({
    super.key,
    this.severity = NotificationIconSeverity.info,
    this.size = NotificationSize.md,
  });

  Color get _color {
    switch (severity) {
      case NotificationIconSeverity.alert:
        return GardenColors.redAlert.shade500;
      case NotificationIconSeverity.success:
        return GardenColors.tertiary.shade600;
      case NotificationIconSeverity.warning:
        return GardenColors.yellowWarning.shade500;
      default:
        return GardenColors.blueInfo.shade500;
    }
  }

  double get _containerHorizontalPadding {
    if (size == NotificationSize.sm) {
      return GardenSpace.paddingSm;
    } else {
      return GardenSpace.paddingMd;
    }
  }

  double get _iconWidth {
    switch (size) {
      case NotificationSize.sm:
        return 24;
      case NotificationSize.lg:
        return 32;
      default:
        return 28;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _containerHorizontalPadding),
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(GardenRadius.radiusSizes['md']!),
          bottomLeft: Radius.circular(GardenRadius.radiusSizes['md']!),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.notifications_outlined,
          color: GardenColors.base.shade50,
          size: _iconWidth,
        ),
      ),
    );
  }
}
