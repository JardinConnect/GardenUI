import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';
import 'package:garden_ui/ui/enums.dart';

void main() {
  group('GardenIcon Widget Tests', () {
    testWidgets('renders correctly with default values', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: GardenIcon(iconName: 'Humidite_profondeur')),
        ),
      );

      expect(find.byType(GardenIcon), findsOneWidget);
    });

    testWidgets('renders all size variants correctly', (
      WidgetTester tester,
    ) async {
      // Small size
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenIcon(
              iconName: 'Humidite_profondeur',
              size: GardenIconSize.sm,
            ),
          ),
        ),
      );
      expect(find.byType(GardenIcon), findsOneWidget);

      // Medium size
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenIcon(
              iconName: 'Humidite_profondeur',
              size: GardenIconSize.md,
            ),
          ),
        ),
      );
      expect(find.byType(GardenIcon), findsOneWidget);

      // Large size
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenIcon(
              iconName: 'Humidite_profondeur',
              size: GardenIconSize.lg,
            ),
          ),
        ),
      );
      expect(find.byType(GardenIcon), findsOneWidget);
    });

    testWidgets('applies custom color correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GardenIcon(
              iconName: 'Thermometre',
              color: GardenColors.primary.shade500,
            ),
          ),
        ),
      );

      expect(find.byType(GardenIcon), findsOneWidget);
    });

    testWidgets('renders with different icon names', (
      WidgetTester tester,
    ) async {
      const iconNames = [
        'Humidite_profondeur',
        'Humidite_surface',
        'Pluie',
        'Soleil',
        'Thermometre',
      ];

      for (final iconName in iconNames) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: GardenIcon(iconName: iconName)),
          ),
        );

        expect(find.byType(GardenIcon), findsOneWidget);
      }
    });

    testWidgets('renders with fill percentage of 0%', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GardenIcon(
              iconName: 'Humidite_profondeur',
              color: GardenColors.primary.shade500,
              fillPercentage: 0,
            ),
          ),
        ),
      );

      expect(find.byType(GardenIcon), findsOneWidget);
      expect(find.byType(ClipRect), findsOneWidget);
    });

    testWidgets('renders with fill percentage of 50%', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GardenIcon(
              iconName: 'Humidite_profondeur',
              color: GardenColors.primary.shade500,
              fillPercentage: 50,
            ),
          ),
        ),
      );

      expect(find.byType(GardenIcon), findsOneWidget);
      expect(find.byType(ClipRect), findsOneWidget);
    });

    testWidgets('renders with fill percentage of 100%', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GardenIcon(
              iconName: 'Humidite_profondeur',
              color: GardenColors.primary.shade500,
              fillPercentage: 100,
            ),
          ),
        ),
      );

      expect(find.byType(GardenIcon), findsOneWidget);
      expect(find.byType(ClipRect), findsOneWidget);
    });

    testWidgets('renders without fill percentage (no ClipRect)', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GardenIcon(
              iconName: 'Humidite_profondeur',
              color: GardenColors.primary.shade500,
            ),
          ),
        ),
      );

      expect(find.byType(GardenIcon), findsOneWidget);
      expect(find.byType(ClipRect), findsNothing);
    });

    testWidgets('handles various fill percentages', (
      WidgetTester tester,
    ) async {
      const fillPercentages = [0.0, 25.0, 33.3, 50.0, 66.6, 75.0, 90.0, 100.0];

      for (final percentage in fillPercentages) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GardenIcon(
                iconName: 'Humidite_profondeur',
                color: GardenColors.primary.shade500,
                fillPercentage: percentage,
              ),
            ),
          ),
        );

        expect(find.byType(GardenIcon), findsOneWidget);
      }
    });

    testWidgets('works with all design system colors', (
      WidgetTester tester,
    ) async {
      final colors = [
        GardenColors.primary.shade500,
        GardenColors.secondary.shade500,
        GardenColors.tertiary.shade500,
        GardenColors.redAlert.shade500,
        GardenColors.yellowWarning.shade500,
        GardenColors.blueInfo.shade500,
        GardenColors.base.shade300,
        GardenColors.typography.shade500,
      ];

      for (final color in colors) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GardenIcon(iconName: 'Thermometre', color: color),
            ),
          ),
        );

        expect(find.byType(GardenIcon), findsOneWidget);
      }
    });
  });
}
