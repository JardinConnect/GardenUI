import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'alert_indicator.dart';
import 'package:garden_ui/ui/models/hierarchical_menu_item.dart';

@UseCase(name: 'Default', type: AlertIndicator)
Widget alertIndicatorDefaultUseCase(BuildContext context) {
  return const AlertIndicator(alertType: MenuAlertType.warning);
}

@UseCase(name: 'Error', type: AlertIndicator)
Widget alertIndicatorErrorUseCase(BuildContext context) {
  return const AlertIndicator(alertType: MenuAlertType.error);
}

@UseCase(name: 'Small', type: AlertIndicator)
Widget alertIndicatorSmallUseCase(BuildContext context) {
  return const AlertIndicator(
    alertType: MenuAlertType.warning,
    size: AlertIndicatorSize.sm,
  );
}
