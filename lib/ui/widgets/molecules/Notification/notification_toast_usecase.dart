import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:garden_ui/ui/design_system.dart';

import 'notification_toast.dart';

@UseCase(name: 'Info', type: NotificationToast)
Widget infoNotificationUseCase(BuildContext context) {
  return Center(
    child: Column(
      spacing: GardenSpace.gapXl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const NotificationToast(
          title: "Title",
          message:
              "Ceci est une longue notification. Ceci est une très longue notification",
          size: NotificationSize.sm,
          severity: NotificationSeverity.info,
        ),
        const NotificationToast(
          title: "Title",
          message:
              "Ceci est une longue notification. Ceci est une très longue notification",
          size: NotificationSize.md,
          severity: NotificationSeverity.info,
        ),
        const NotificationToast(
          title: "Title",
          message:
              "Ceci est une longue notification. Ceci est une très longue notification",
          size: NotificationSize.lg,
          severity: NotificationSeverity.info,
        ),
      ],
    ),
  );
}

@UseCase(name: 'Alert', type: NotificationToast)
Widget alertNotificationUseCase(BuildContext context) {
  return Column(
    spacing: GardenSpace.gapXl,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.sm,
        severity: NotificationSeverity.alert,
      ),
      const NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.md,
        severity: NotificationSeverity.alert,
      ),
      const NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.lg,
        severity: NotificationSeverity.alert,
      ),
    ],
  );
}

@UseCase(name: 'Success', type: NotificationToast)
Widget successNotificationUseCase(BuildContext context) {
  return Column(
    spacing: GardenSpace.gapXl,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.sm,
        severity: NotificationSeverity.success,
      ),
      const NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.md,
        severity: NotificationSeverity.success,
      ),
      const NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.lg,
        severity: NotificationSeverity.success,
      ),
    ],
  );
}

@UseCase(name: 'Warning', type: NotificationToast)
Widget warningNotificationUseCase(BuildContext context) {
  return Column(
    spacing: GardenSpace.gapXl,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.sm,
        severity: NotificationSeverity.warning,
      ),
      const NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.md,
        severity: NotificationSeverity.warning,
      ),
      const NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.lg,
        severity: NotificationSeverity.warning,
      ),
    ],
  );
}
