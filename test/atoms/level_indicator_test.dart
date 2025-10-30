import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';
import 'package:garden_ui/ui/widgets/atoms/LevelIndicator/level_indicator.dart';

void main() {
  group('LevelIndicator Widget Tests', () {
    testWidgets('renders with level 1', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LevelIndicator(level: 1)),
        ),
      );

      expect(find.byType(LevelIndicator), findsOneWidget);
    });

    testWidgets('applies correct color for level 1', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LevelIndicator(level: 1)),
        ),
      );

      final containerWidget = tester.widget<Container>(find.byType(Container));
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.color, GardenColors.primary.shade500);
    });

    testWidgets('applies correct color for level 2', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LevelIndicator(level: 2)),
        ),
      );

      final containerWidget = tester.widget<Container>(find.byType(Container));
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.color, GardenColors.secondary.shade500);
    });

    testWidgets('applies correct color for level 3', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LevelIndicator(level: 3)),
        ),
      );

      final containerWidget = tester.widget<Container>(find.byType(Container));
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.color, GardenColors.tertiary.shade500);
    });

    testWidgets('applies correct color for level 4', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LevelIndicator(level: 4)),
        ),
      );

      final containerWidget = tester.widget<Container>(find.byType(Container));
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.color, GardenColors.blueInfo.shade500);
    });

    testWidgets('applies correct color for level 5', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LevelIndicator(level: 5)),
        ),
      );

      final containerWidget = tester.widget<Container>(find.byType(Container));
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.color, GardenColors.yellowWarning.shade500);
    });

    testWidgets('applies default color for invalid level', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LevelIndicator(level: 99)),
        ),
      );

      final containerWidget = tester.widget<Container>(find.byType(Container));
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.color, GardenColors.base.shade400);
    });

    testWidgets('applies custom color when provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LevelIndicator(level: 1, color: Colors.red),
          ),
        ),
      );

      final containerWidget = tester.widget<Container>(find.byType(Container));
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.color, Colors.red);
    });

    testWidgets('applies correct width for sm size', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LevelIndicator(level: 1, size: LevelIndicatorSize.sm),
          ),
        ),
      );

      final containerWidget = tester.widget<Container>(find.byType(Container));
      expect(containerWidget.constraints?.minWidth, 2.0);
    });

    testWidgets('applies correct width for md size', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LevelIndicator(level: 1, size: LevelIndicatorSize.md),
          ),
        ),
      );

      final containerWidget = tester.widget<Container>(find.byType(Container));
      expect(containerWidget.constraints?.minWidth, 3.0);
    });

    testWidgets('applies correct width for lg size', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LevelIndicator(level: 1, size: LevelIndicatorSize.lg),
          ),
        ),
      );

      final containerWidget = tester.widget<Container>(find.byType(Container));
      expect(containerWidget.constraints?.minWidth, 4.0);
    });

    testWidgets('has fixed height of 30', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LevelIndicator(level: 1)),
        ),
      );

      final containerWidget = tester.widget<Container>(find.byType(Container));
      expect(containerWidget.constraints?.minHeight, 30.0);
    });
  });
}

