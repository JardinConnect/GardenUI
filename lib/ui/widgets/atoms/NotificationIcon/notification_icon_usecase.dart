import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';

Widget _preview(NotificationIconSeverity severity) {
  return Row(
    spacing: GardenSpace.gapMd,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 58,
        child: NotificationIcon(severity: severity, size: NotificationSize.sm),
      ),
      SizedBox(
        height: 74,
        child: NotificationIcon(severity: severity, size: NotificationSize.md),
      ),
      SizedBox(
        height: 90,
        child: NotificationIcon(severity: severity, size: NotificationSize.lg),
      ),
    ],
  );
}

@UseCase(name: 'Info', type: NotificationIcon)
Widget infoNotificationIconUseCase(BuildContext context) {
  return _preview(NotificationIconSeverity.info);
}

@UseCase(name: 'Alert', type: NotificationIcon)
Widget alertNotificationIconUseCase(BuildContext context) {
  return _preview(NotificationIconSeverity.alert);
}

@UseCase(name: 'Success', type: NotificationIcon)
Widget successNotificationIconUseCase(BuildContext context) {
  return _preview(NotificationIconSeverity.success);
}

@UseCase(name: 'Warning', type: NotificationIcon)
Widget warningNotificationIconUseCase(BuildContext context) {
  return _preview(NotificationIconSeverity.warning);
}
