import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'garden_toggle.dart';

@widgetbook.UseCase(name: 'Enabled', type: GardenToggle)
Widget gardenToggleEnabledUseCase(BuildContext context) {
  return GardenToggle(isEnabled: true, onToggle: (value) {});
}

@widgetbook.UseCase(name: 'Disabled', type: GardenToggle)
Widget gardenToggleDisabledUseCase(BuildContext context) {
  return GardenToggle(isEnabled: false, onToggle: (value) {});
}

@widgetbook.UseCase(name: 'Interactive', type: GardenToggle)
Widget gardenToggleInteractiveUseCase(BuildContext context) {
  return const _InteractiveToggle();
}

@widgetbook.UseCase(name: 'Interactive with icons', type: GardenToggle)
Widget gardenToggleInteractiveWithIconsUseCase(BuildContext context) {
  return const _InteractiveToggleWithIcons();
}

class _InteractiveToggle extends StatefulWidget {
  const _InteractiveToggle();

  @override
  State<_InteractiveToggle> createState() => _InteractiveToggleState();
}

class _InteractiveToggleState extends State<_InteractiveToggle> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return GardenToggle(
      isEnabled: isEnabled,
      onToggle: (value) {
        setState(() {
          isEnabled = value;
        });
      },
    );
  }
}

class _InteractiveToggleWithIcons extends StatefulWidget {
  const _InteractiveToggleWithIcons();

  @override
  State<_InteractiveToggleWithIcons> createState() =>
      _InteractiveToggleWithIconsState();
}

class _InteractiveToggleWithIconsState
    extends State<_InteractiveToggleWithIcons> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return GardenToggle(
      isEnabled: isEnabled,
      enabledIcon: Icons.check_outlined,
      disabledIcon: Icons.close,
      onToggle: (value) {
        setState(() {
          isEnabled = value;
        });
      },
    );
  }
}
