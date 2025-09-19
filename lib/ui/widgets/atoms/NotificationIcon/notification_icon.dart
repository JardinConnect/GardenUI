import 'package:flutter/material.dart';
import 'package:widgetbook_workspace/ui/design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

enum NotificationIconSeverity { alert, info, success, warning }

enum NotificationIconSize { sm, md, lg }

class NotificationIcon extends StatelessWidget {
  final NotificationIconSeverity severity;
  final NotificationIconSize size;

  const NotificationIcon({
    super.key,
    this.severity = NotificationIconSeverity.info,
    this.size = NotificationIconSize.md,
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

  double get _width {
    switch (size) {
      case NotificationIconSize.sm:
        return 48;
      case NotificationIconSize.lg:
        return 80;
      default:
        return 64;
    }
  }

  double get _iconWidth {
    switch (size) {
      case NotificationIconSize.sm:
        return 24;
      case NotificationIconSize.lg:
        return 48;
      default:
        return 32;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
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
          color: GardenColors.base.shade500,
          size: _iconWidth,
        ),
      ),
    );
  }
}

Widget _preview(NotificationIconSeverity severity) {
  return Row(
    spacing: GardenSpace.gapMd,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 58,
        child: NotificationIcon(
          severity: severity,
          size: NotificationIconSize.sm,
        ),
      ),
      SizedBox(
        height: 74,
        child: NotificationIcon(
          severity: severity,
          size: NotificationIconSize.md,
        ),
      ),
      SizedBox(
        height: 90,
        child: NotificationIcon(
          severity: severity,
          size: NotificationIconSize.lg,
        ),
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Info', type: NotificationIcon)
Widget infoNotificationIconUseCase(BuildContext context) {
  return _preview(NotificationIconSeverity.info);
}

@widgetbook.UseCase(name: 'Alert', type: NotificationIcon)
Widget alertNotificationIconUseCase(BuildContext context) {
  return _preview(NotificationIconSeverity.alert);
}

@widgetbook.UseCase(name: 'Success', type: NotificationIcon)
Widget successNotificationIconUseCase(BuildContext context) {
  return _preview(NotificationIconSeverity.success);
}

@widgetbook.UseCase(name: 'Warning', type: NotificationIcon)
Widget warningNotificationIconUseCase(BuildContext context) {
  return _preview(NotificationIconSeverity.warning);
}
