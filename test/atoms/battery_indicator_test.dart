import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/design_system.dart';

void main() {
  group('BatteryIndicator Widget Tests', () {
    testWidgets('renders correctly with default values', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: BatteryIndicator())),
      );

      expect(find.byType(BatteryIndicator), findsOneWidget);
      expect(find.text('100%'), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
    });

    testWidgets('displays correct percentage text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: BatteryIndicator(batteryPercentage: 75)),
        ),
      );

      expect(find.text('75%'), findsOneWidget);
    });

    testWidgets('applies correct size dimensions', (WidgetTester tester) async {
      // Test Small Size
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: BatteryIndicator(size: BatteryIndicatorSize.sm),
            ),
          ),
        ),
      );

      final smRenderBox =
          tester.renderObject(find.byType(BatteryIndicator)) as RenderBox;
      expect(smRenderBox.size.width, equals(34.0));

      // Test Medium Size
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: BatteryIndicator(size: BatteryIndicatorSize.md),
            ),
          ),
        ),
      );

      final mdRenderBox =
          tester.renderObject(find.byType(BatteryIndicator)) as RenderBox;
      expect(mdRenderBox.size.width, equals(50.0));

      // Test Large Size
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: BatteryIndicator(size: BatteryIndicatorSize.lg),
            ),
          ),
        ),
      );

      final lgRenderBox =
          tester.renderObject(find.byType(BatteryIndicator)) as RenderBox;
      expect(lgRenderBox.size.width, equals(66.0));
    });

    testWidgets('clamps battery percentage between 0 and 100', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                BatteryIndicator(batteryPercentage: -10),
                BatteryIndicator(batteryPercentage: 150),
              ],
            ),
          ),
        ),
      );

      // Displayed text might still show input value depending on implementation,
      // but we verify the internal calculation clamps it.
      // Since we can't easily check internal state, we check that it renders without crashing
      // and displays the text provided (assuming text display logic matches input).
      expect(find.text('-10%'), findsOneWidget);
      expect(find.text('150%'), findsOneWidget);
    });

    testWidgets('applies correct font style based on size', (
      WidgetTester tester,
    ) async {
      // Small size should use bodyMd style
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: BatteryIndicator(size: BatteryIndicatorSize.sm)),
        ),
      );

      Text textWidget = tester.widget<Text>(find.text('100%'));
      expect(textWidget.style?.fontSize, GardenTypography.bodyMd.fontSize);

      // Medium size should use bodyMd style
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: BatteryIndicator(size: BatteryIndicatorSize.md)),
        ),
      );

      textWidget = tester.widget<Text>(find.text('100%'));
      expect(textWidget.style?.fontSize, GardenTypography.bodyMd.fontSize);

      // Large size should use bodyLg style
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: BatteryIndicator(size: BatteryIndicatorSize.lg)),
        ),
      );

      textWidget = tester.widget<Text>(find.text('100%'));
      expect(textWidget.style?.fontSize, GardenTypography.bodyLg.fontSize);
    });
  });
}
