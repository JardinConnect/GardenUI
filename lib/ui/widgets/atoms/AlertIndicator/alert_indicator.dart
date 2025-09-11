import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/ui/design_system.dart';
import 'package:widgetbook_workspace/ui/models/hierarchical_menu_item.dart';

enum AlertIndicatorSize { sm, md, lg }

class AlertIndicator extends StatelessWidget {
  final MenuAlertType alertType;
  final AlertIndicatorSize size;

  const AlertIndicator({
    super.key,
    required this.alertType,
    this.size = AlertIndicatorSize.md,
  });

  double get _iconSize {
    switch (size) {
      case AlertIndicatorSize.sm:
        return 12.0;
      case AlertIndicatorSize.md:
        return 16.0;
      case AlertIndicatorSize.lg:
        return 20.0;
    }
  }

  Color get _color {
    switch (alertType) {
      case MenuAlertType.warning:
        return GardenColors.yellowWarning.shade500;
      case MenuAlertType.error:
        return GardenColors.redAlert.shade500;
      case MenuAlertType.none:
        return Colors.transparent;
    }
  }

  IconData get _icon {
    switch (alertType) {
      case MenuAlertType.warning:
      case MenuAlertType.error:
        return Icons.warning;
      case MenuAlertType.none:
        return Icons.clear;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (alertType == MenuAlertType.none) {
      return SizedBox(width: _iconSize);
    }

    return Icon(_icon, size: _iconSize, color: _color);
  }
}

@widgetbook.UseCase(name: 'Default', type: AlertIndicator)
Widget alertIndicatorDefaultUseCase(BuildContext context) {
  return const AlertIndicator(alertType: MenuAlertType.warning);
}

@widgetbook.UseCase(name: 'Error', type: AlertIndicator)
Widget alertIndicatorErrorUseCase(BuildContext context) {
  return const AlertIndicator(alertType: MenuAlertType.error);
}

@widgetbook.UseCase(name: 'Small', type: AlertIndicator)
Widget alertIndicatorSmallUseCase(BuildContext context) {
  return const AlertIndicator(
    alertType: MenuAlertType.warning,
    size: AlertIndicatorSize.sm,
  );
}
