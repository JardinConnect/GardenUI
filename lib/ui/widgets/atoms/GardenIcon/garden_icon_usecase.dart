import 'package:flutter/material.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: GardenIcon)
Widget gardenIconDefaultUseCase(BuildContext context) {
  return const Center(child: GardenIcon(iconName: 'Humidite_profondeur'));
}

@widgetbook.UseCase(name: 'All Sizes', type: GardenIcon)
Widget gardenIconSizesUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GardenIcon(iconName: 'Humidite_profondeur', size: GardenIconSize.sm),
        SizedBox(height: 16),
        GardenIcon(iconName: 'Humidite_profondeur', size: GardenIconSize.md),
        SizedBox(height: 16),
        GardenIcon(iconName: 'Humidite_profondeur', size: GardenIconSize.lg),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'All Icons', type: GardenIcon)
Widget gardenIconAllIconsUseCase(BuildContext context) {
  const icons = [
    'Humidite_profondeur',
    'Humidite_surface',
    'Pluie',
    'Soleil',
    'Thermometre',
  ];

  return Center(
    child: Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: icons
          .map(
            (iconName) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GardenIcon(iconName: iconName, size: GardenIconSize.lg),
                const SizedBox(height: 8),
                Text(iconName, style: const TextStyle(fontSize: 12)),
              ],
            ),
          )
          .toList(),
    ),
  );
}

@widgetbook.UseCase(name: 'Color Variants', type: GardenIcon)
Widget gardenIconColorsUseCase(BuildContext context) {
  return Center(
    child: Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        GardenIcon(
          iconName: 'Thermometre',
          size: GardenIconSize.lg,
          color: GardenColors.primary.shade500,
        ),
        GardenIcon(
          iconName: 'Thermometre',
          size: GardenIconSize.lg,
          color: GardenColors.secondary.shade500,
        ),
        GardenIcon(
          iconName: 'Thermometre',
          size: GardenIconSize.lg,
          color: GardenColors.tertiary.shade500,
        ),
        GardenIcon(
          iconName: 'Thermometre',
          size: GardenIconSize.lg,
          color: GardenColors.redAlert.shade500,
        ),
        GardenIcon(
          iconName: 'Thermometre',
          size: GardenIconSize.lg,
          color: GardenColors.yellowWarning.shade500,
        ),
        GardenIcon(
          iconName: 'Thermometre',
          size: GardenIconSize.lg,
          color: GardenColors.blueInfo.shade500,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Fill Percentages', type: GardenIcon)
Widget gardenIconFillUseCase(BuildContext context) {
  return Center(
    child: Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GardenIcon(
              iconName: 'Humidite_profondeur',
              size: GardenIconSize.lg,
              color: GardenColors.primary.shade500,
              fillPercentage: 0,
            ),
            const SizedBox(height: 8),
            const Text('0%', style: TextStyle(fontSize: 12)),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GardenIcon(
              iconName: 'Humidite_profondeur',
              size: GardenIconSize.lg,
              color: GardenColors.primary.shade500,
              fillPercentage: 25,
            ),
            const SizedBox(height: 8),
            const Text('25%', style: TextStyle(fontSize: 12)),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GardenIcon(
              iconName: 'Humidite_profondeur',
              size: GardenIconSize.lg,
              color: GardenColors.primary.shade500,
              fillPercentage: 50,
            ),
            const SizedBox(height: 8),
            const Text('50%', style: TextStyle(fontSize: 12)),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GardenIcon(
              iconName: 'Humidite_profondeur',
              size: GardenIconSize.lg,
              color: GardenColors.primary.shade500,
              fillPercentage: 75,
            ),
            const SizedBox(height: 8),
            const Text('75%', style: TextStyle(fontSize: 12)),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GardenIcon(
              iconName: 'Humidite_profondeur',
              size: GardenIconSize.lg,
              color: GardenColors.primary.shade500,
              fillPercentage: 100,
            ),
            const SizedBox(height: 8),
            const Text('100%', style: TextStyle(fontSize: 12)),
          ],
        ),
      ],
    ),
  );
}
