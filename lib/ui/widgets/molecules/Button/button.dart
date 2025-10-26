import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';
import 'package:garden_ui/ui/models/button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;


class GCButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonSeverity severity;
  final double minWidth;
  final IconAlignment? iconAlignment;
  final IconData? icon;

  const GCButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.severity = ButtonSeverity.primary,
    this.iconAlignment = IconAlignment.end,
    this.minWidth = 24,
    this.icon,
  });

  Color get _backgroundColor {
    if (severity == ButtonSeverity.danger) {
      return GardenColors.redAlert.shade500;
    } else {
      return GardenColors.primary.shade500;
    }
  }

  ButtonStyle get _style {
    return FilledButton.styleFrom(
        backgroundColor: _backgroundColor,
        foregroundColor: GardenColors.primary.shade50,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
            borderRadius: GardenRadius.radiusSm
        ),
        padding: EdgeInsets.symmetric(horizontal: GardenSpace.paddingXl, vertical: GardenSpace.paddingMd),
        minimumSize: Size(minWidth, 48),
        textStyle: GardenTypography.bodyLg.copyWith(
          height: 1.2
        ),
      iconSize: GardenTypography.bodyLg.fontSize,
      iconColor: GardenColors.primary.shade50
    );
  }

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return FilledButton.icon(
        icon: Icon(icon),
          iconAlignment: iconAlignment,
          style: _style,
          onPressed: onPressed,
          label: Text(label)
      );
    } else {
      return FilledButton(
          style: _style,
          onPressed: onPressed,
          child: Text(label)
      );
    }
  }
}

@widgetbook.UseCase(
  name: 'Primary',
  type: GCButton,
)
Widget primaryButtonUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: GardenSpace.gapLg,
    children: [
      GCButton(label: "Send", onPressed: () => {
      }),
      GCButton(label: "Send", icon: Icons.send, onPressed: () => {
      }),
      GCButton(label: "Send", iconAlignment: IconAlignment.start, icon: Icons.send, onPressed: () => {
      }),
      GCButton(label: "Send", icon: Icons.send, minWidth: 300, onPressed: () => {
      }),
    ],
  );
}

@widgetbook.UseCase(
  name: 'Danger',
  type: GCButton,
)
Widget dangerButtonUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: GardenSpace.gapLg,
    children: [
      GCButton(label: "Delete", severity: ButtonSeverity.danger, onPressed: () => {
      }),
      GCButton(label: "Delete", severity: ButtonSeverity.danger, icon: Icons.delete, onPressed: () => {
      }),
      GCButton(label: "Delete", iconAlignment: IconAlignment.start, severity: ButtonSeverity.danger, icon: Icons.delete, onPressed: () => {
      }),
      GCButton(label: "Delete", severity: ButtonSeverity.danger, icon: Icons.delete, minWidth: 300, onPressed: () => {
      }),
    ],
  );
}